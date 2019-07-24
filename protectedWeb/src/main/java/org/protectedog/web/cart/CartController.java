package org.protectedog.web.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.protectedog.service.cart.CartService;
import org.protectedog.service.domain.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/cart/*")
public class CartController {

	/// Field
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService cartService;

	public CartController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	// 1. 장바구니 추가
	@RequestMapping("addCart")
	public String addCart(@ModelAttribute("cart")Cart cart, HttpSession session) throws Exception{
	
		String id = (String) session.getAttribute("userId");
		cart.setId(id);
		
		
		// 장바구니에 기존 상품이 있는지 검사
		int count = cartService.countCart(cart.getProdNo(), id);
		//count == 0 ? cartService.updateCart(cart) : cartService.addCart(cart);
		if(count == 0){
			// 없으면 insert
		cartService.addCart(cart);
		
		} else {
			// 있으면 update
		cartService.updateCart(cart);
		}
		return "redirect:/shop/cart/listCart";
		}

	// 2. 장바구니 목록
	@RequestMapping("listCart")
	public String listCart(HttpSession session, Model model) throws Exception {

		String id = (String) session.getAttribute("id"); // session에 저장된 userId
		Map<String, Object> map = new HashMap<String, Object>();
		List<Cart> list = cartService.listCart(id); // 장바구니 정보
		int totalPrice = cartService.totalPrice(id); // 장바구니 전체 금액 호출

		map.put("count", list.size()); // 장바구니 상품의 유무
		map.put("totalPrice", totalPrice); // 장바구니 전체 금액

		model.addAttribute("map", map);
		return "cart/listCart";
	}

	// 3. 장바구니 삭제
	@RequestMapping("delCart")
	public String delCart(@RequestParam int cartNo) throws Exception{
	cartService.delCart(cartNo);
	return "redirect:/cart/listCart";
	}

	// 4. 장바구니 수정
	@RequestMapping("updateCart")
	public String updateCart(@RequestParam int[] quantity, @RequestParam int[] prodNo, HttpSession session) throws Exception {
	// session의 id
	String id = (String) session.getAttribute("id");
	// 레코드의 갯수 만큼 반복문 실행
	for(int i=0; i<prodNo.length; i++){

	
	Cart cart = new Cart();
	
	cart.setId(id);
	cart.setQuantity(quantity[i]);
	cart.setProdNo(prodNo[i]);
	cartService.modifyCart(cart);
	}
	return "redirect:/shop/cart/listCart";
	}
}

