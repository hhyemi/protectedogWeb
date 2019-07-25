package org.protectedog.web.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.protectedog.service.cart.CartService;
import org.protectedog.service.domain.Cart;
import org.protectedog.service.domain.Product;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/cart/*")
public class CartController {

	/// Field
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService cartService;
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;


	public CartController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	
	
	@RequestMapping(value="addCart", method=RequestMethod.GET)
	public String addCart(@RequestParam("prodNo") int prodNo, Model model) throws Exception{

		System.out.println("/addCart GET");
		
		Product product = productService.getProduct(prodNo);
		
		System.out.println("product : "+product );
		
		model.addAttribute("product", product);
		
		return "forward:/shop/cart/listCart.jsp";
	}
	
	@RequestMapping(value="addCart" , method=RequestMethod.POST)
	public String addCart(@ModelAttribute("cart") Cart cart, @ModelAttribute("product") Product product,	  
	@RequestParam("id") String id,@RequestParam("quantity") int quantity,
	@RequestParam("prodNo") int prodNo, @RequestParam("prodName") String prodName,@RequestParam("discountPrice") int discountPrice,
	 HttpSession session, Model model) throws Exception {

		System.out.println("/addCart");
		
		//Business Logic
		cart.setProdNo(productService.getProduct(prodNo));
		cart.setId(userService.getUsers(id));
		cart.setQuantity(quantity);
		cart.setTotalPrice(quantity*discountPrice);
	
		
		//장바구니에 기존 상품이 있는지 검사
		if ( cartService.countCart(prodNo, id) == 1) {
			cartService.updateCart(cart);
		} else {
			cartService.addCart(cart);
		}

		
		model.addAttribute("cart", cart);
		model.addAttribute("product", product);
		
		return "forward:/shop/cart/listCart.jsp";
	}
		
		
	
	

	// 2. 장바구니 목록
	@RequestMapping(value="listCart")
	public String listCart(HttpSession session, Model model, HttpServletRequest request) throws Exception {

		User user=(User)session.getAttribute("user");
		String id=user.getId();
		

		List<Cart> list = cartService.listCart(id);
				
		int totalPrice = cartService.totalPrice(id); 

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("count", list.size()); 
		map.put("totalPrice", totalPrice);

		model.addAttribute("map", map);
		model.addAttribute("list", list);
		
		return "redirect:cart/listCart";
	}


	@RequestMapping("delCart")
	public String delCart(@RequestParam int cartNo, HttpSession session) throws Exception{
		cartService.delCart(cartNo);
	return "redirect:/cart/listCart";
	}


	@RequestMapping(value="UpdateCart")
	public String UpdateCart(Model model, HttpSession session,
	@RequestParam("prodNo") int[] prodNo,@RequestParam("quantity") int[] quantity,
	@RequestParam("totalPrie") int[] totalPrice) throws Exception{
		
		System.out.println("/modifyCart");
		
		// 세션을 통해서 유저 아이디를 가져옵니다.
		User user =(User) session.getAttribute("user");
		String id = user.getId();
		
		// 레코드의 갯수 만큼 반복문을 실행
		for ( int i = 0; i<prodNo.length; i++) {
			Cart cart = new Cart();
			cart.setId(userService.getUsers(id));
			cart.setQuantity(quantity[i]);
			cart.setProdNo(productService.getProduct(prodNo[i]));
			cart.setTotalPrice(totalPrice[i]);
			cartService.modifyCart(cart);
		}
		
		return "forward:/cart/listCart";
	}
	
	@RequestMapping(value="addOrderCart")
	public String addOrderCart(Model model, HttpSession session, 
	@RequestParam("prodNo") int[] prodNo,
	@RequestParam("cartNo") int[] cartNo,
	@RequestParam("prodName") String[] prodName,
	@RequestParam("cartTotalPrice") int cartTotalPrice) throws Exception{
		
		// 다중 구매를 위해서 아이디를 보여주는 란을 마련합니다.
		String prodNos = "";
		String prodNames ="";
		String cartNos ="";
		for(int i = 0 ; i<prodNo.length; i++) {
			prodNos += (i<prodNo.length-1 ? prodNo[i]+"," : prodNo[i] );
			prodNames += (i<prodNo.length-1 ? prodName[i]+"," : prodName[i] );
			cartNos += (i<prodNo.length-1 ? cartNo[i]+"," : cartNo[i] );
		}
		
		// Model 과 View 연결
		model.addAttribute("prodNo", prodNos);
		model.addAttribute("prodName", prodNames);
		model.addAttribute("cartNo", cartNos);
		model.addAttribute("cartTotalPrice", cartTotalPrice);
		
		return "forward:/cart/addCartOrder.jsp";
	}
}