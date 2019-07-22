//package org.protectedog.web.review;
//
//import org.protectedog.service.comment.CommentService;
//import org.protectedog.service.domain.Review;
//import org.protectedog.service.review.ReviewService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//
//
//@RestController
//@RequestMapping("/review/*")
//public class ReviewRestController {
//	
//	@Autowired
//	@Qualifier("reviewServiceImpl")
//	private	ReviewService reviewService;
//	
//	@Value("#{reviewProperties['rev']}")
//	String review;
//	
//	
//	public ReviewRestController() {
//		System.out.println(this.getClass());
//	}
//	
//	
//	
//	
//	@RequestMapping( value="json/addReview/", method=RequestMethod.POST )
//	public Review addReview(@RequestBody Review review) throws Exception{
//		
//		System.out.println("/user/json/getUser : GET");
//		
//		return reviewService.addReview(review);
//
//	}
//}
//	
//	