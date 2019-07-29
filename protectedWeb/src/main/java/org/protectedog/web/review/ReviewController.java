package org.protectedog.web.review;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.domain.FileDog;
import org.protectedog.service.domain.Review;
import org.protectedog.service.domain.User;
import org.protectedog.service.file.FileService;
import org.protectedog.service.review.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/review/*")
public class ReviewController {

	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;

	@Autowired
	@Qualifier("fileServiceImpl")
	private FileService fileService;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@Value("#{commonProperties['hospital']}")
	String hospitalCode;

	public ReviewController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "getHospitalReview", method = RequestMethod.GET)
	public String getHospitalReview(@RequestParam("placeName") String placeName,
			@RequestParam("placeAddr") String placeAddr, @RequestParam("placeJIAddr") String placeJIAddr,
			@RequestParam("placeTel") String placeTel, @ModelAttribute("search") Search search, Model model,
			HttpSession session) throws Exception {

		System.out.println("/review/getHospitalReview : GET");

		User user = (User) session.getAttribute("user");

		// 지도정보
		Map<String, String> map = new HashMap<String, String>();
		map.put("placeName", URLDecoder.decode(placeName, "UTF-8"));
		map.put("placeAddr", URLDecoder.decode(placeAddr, "UTF-8"));
		map.put("placeJIAddr", URLDecoder.decode(placeJIAddr, "UTF-8"));
		map.put("placeTel", URLDecoder.decode(placeTel, "UTF-8"));

		// 후기정보
		String originSearch = null;

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		if (search.getSearchKeyword() == null) {
			search.setSearchKeyword("");
		} else {
			if (!search.getSearchKeyword().equals("")) {
				originSearch = search.getSearchKeyword();
				String likeSearch = "%" + search.getSearchKeyword() + "%";
				search.setSearchKeyword(likeSearch);
			}
		}

		if (search.getSearchCondition() == null) {
			search.setSearchCondition("");
		}

		Map<String, Object> reviewMap = reviewService.listReview(search, hospitalCode,
				URLDecoder.decode(placeName, "UTF-8"));

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) reviewMap.get("totalCount")).intValue(),
				pageUnit, pageSize);
		System.out.println(resultPage);

		search.setSearchKeyword(originSearch);

		// 파일가져오기
		Map<String, Object> filePost = new HashMap<String, Object>();
		filePost.put("boardCode", hospitalCode);
		List<FileDog> file = fileService.getFile(filePost);
		
		System.out.println(reviewMap);

		int grade=0;
		int i=0;
		List<Review> reviewList= (List<Review>) reviewMap.get("list");
		for ( i = 0; i < reviewList.size(); i++) {
			grade += reviewList.get(i).getGrade();
			System.out.println(":::::"+reviewList.get(i).getGrade());
		}
		int avgGrade = grade / i ;
		System.out.println("평균!!"+avgGrade);
		
		// Model 과 View 연결
		model.addAttribute("list", reviewMap.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("placeList", map);
		model.addAttribute("user", user);
		model.addAttribute("file", file);

		return "forward:/hospital/getHospitalReview.jsp";
	}

}
