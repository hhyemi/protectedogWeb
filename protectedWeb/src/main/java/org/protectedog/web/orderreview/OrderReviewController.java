package org.protectedog.web.orderreview;

import java.util.HashMap;
import java.util.Map;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Order;
import org.protectedog.service.domain.Product;
import org.protectedog.service.domain.Review;
import org.protectedog.service.order.OrderService;
import org.protectedog.service.product.ProductService;
import org.protectedog.service.review.ReviewService;
import org.protectedog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



	//==> 회원관리 Controller
	@Controller
	@RequestMapping("/order/*")
	public class OrderReviewController {

		/// Field
		@Autowired
		@Qualifier("orderServiceImpl")
		private OrderService orderService;
		// setter Method 구현 않음
		@Autowired
		@Qualifier("productServiceImpl")
		private ProductService productService;
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;
		@Autowired
		@Qualifier("reviewServiceImpl")
		private ReviewService reviewService;
		
		public OrderReviewController() {
			System.out.println(this.getClass());	
			
		}
		
		@RequestMapping("addReview")
		public String addReview( @ModelAttribute("review") Review review) throws Exception {
			
			System.out.println("/addReview get");
			System.out.println(review);
			
			reviewService.addReview(review);
			
			Order order = new Order();
			order.setOrderNo(review.getOrderNo());
			order.setOrderCode(5);
			orderService.updateOrderCode(order);
			
			
			return "redirect:/product/listReview?prodNo="+review.getOrderNo();
		}
		

		
		

			
		
		
}