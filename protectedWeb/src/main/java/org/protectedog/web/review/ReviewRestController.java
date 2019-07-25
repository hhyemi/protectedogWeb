package org.protectedog.web.review;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.protectedog.service.domain.FileDog;
import org.protectedog.service.domain.Review;
import org.protectedog.service.domain.User;
import org.protectedog.service.file.FileService;
import org.protectedog.service.review.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/review/*")
public class ReviewRestController {

	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;

	@Autowired
	@Qualifier("fileServiceImpl")
	private FileService fileService;

	@Value("#{commonProperties['hospital']}")
	String hospitalCode;

	public ReviewRestController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "json/addHospitalReview/", method = RequestMethod.POST)
	public Review addHospitalReview(@RequestBody Map<String,Object> mapReview , HttpSession session) throws Exception {

		System.out.println("/review/json/addHospitalReview : POST");

		int grade = Integer.parseInt((String) mapReview.get("grade"));
		User user = (User)session.getAttribute("user");

		//리뷰 디비에 넣기
		Review review = new Review();
		review.setId(user.getId());
		review.setNickName(user.getNickname());
		review.setBoardCode(hospitalCode);
		review.setGrade(grade);
		review.setPostTitle((String) mapReview.get("postTitle"));
		review.setPostContent((String)mapReview.get("postContent"));
		review.setHospitalName((String)mapReview.get("hospitalName"));
		
		reviewService.addReview(review);
		review = reviewService.getReview(review.getPostNo());
		
		
		// 파일디비에넣기
		List<FileDog> listFile = new ArrayList<FileDog>();
		String[] fileList =  mapReview.get("file").toString().split(",");
		
		for (String fileName : fileList) {

			if (fileName != null && fileName.length() > 0) {

				FileDog files = new FileDog();
				files.setBoardCode(hospitalCode);
				files.setFileName(fileName);
				files.setFileCode(0);
				files.setPostNo(review.getPostNo());
				listFile.add(files);
			}
		}
		fileService.addFile(listFile);


		return review;
	}
}
