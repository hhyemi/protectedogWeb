package org.protectedog.web.review;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.protectedog.service.domain.User;
import org.protectedog.service.review.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/review/*")
public class ReviewController {

	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;

	public ReviewController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "getHospitalReview", method = RequestMethod.GET)
	public String getHospitalReview( @RequestParam("placeName") String placeName, @RequestParam("placeAddr") String placeAddr
			, @RequestParam("placeJIAddr") String placeJIAddr, @RequestParam("placeTel") String placeTel,Model model,
			HttpSession session) throws Exception {

		System.out.println("/review/getHospitalReview : GET");
		
		User user = (User) session.getAttribute("user");
		Map<String,String> map = new HashMap<String,String>();
		map.put("placeName", URLDecoder.decode(placeName,"UTF-8"));
		map.put("placeAddr", URLDecoder.decode(placeAddr,"UTF-8"));
		map.put("placeJIAddr", URLDecoder.decode(placeJIAddr,"UTF-8"));
		map.put("placeTel", URLDecoder.decode(placeTel,"UTF-8"));
		model.addAttribute("placeList", map);
		model.addAttribute("user", user);
		
		
		return "forward:/hospital/getHospitalReview.jsp";
	}

}
