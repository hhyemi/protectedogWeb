package org.protectedog.web.cart;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.board.BoardService;
import org.protectedog.service.cart.CartService;
import org.protectedog.service.domain.Board;
import org.protectedog.service.domain.Cart;
import org.protectedog.service.domain.User;
import org.protectedog.service.product.ProductService;
import org.protectedog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/Cart/*")
public class CartController {

	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService cartService;

	// setter Method 구현 않음

	// ==> classpath:config/common.properties ,
	// classpath:config/commonservice.xml 참조 할것
	// ==> 아래의 두개를 주석을 풀어 의미를 확인 할것

	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	public CartController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "addCart")
	public String addCart(@ModelAttribute("user") User user,@ModelAttribute("cart") Cart cart, HttpSession session, HttpServletRequest request)
			throws Exception {
		System.out.println("/product/addBoard : GET/POST");
		
	
		System.out.println(cart);
		System.out.println("///////////////////");
		
		cartService.updateCart(cart);
		return "forward:/cart/listCart.jsp";
		
	
	}
	
	/*@RequestMapping( value="listCart")
	public String listCart(@ModelAttribute("search") Search search, HttpServletRequest request, Model model,@RequestParam("id") String id) throws Exception {

		System.out.println("/listCart get");
	
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		List<Cart> map = cartService.listCart(id);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model 과 View 연결
	
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listCart.jsp";
	}*/
}


