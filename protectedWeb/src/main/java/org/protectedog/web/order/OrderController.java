package org.protectedog.web.order;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Order;
import org.protectedog.service.domain.Product;
import org.protectedog.service.domain.User;
import org.protectedog.service.order.OrderService;
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


//==> 회원관리 Controller
@Controller
@RequestMapping("/order/*")
public class OrderController {

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
	
	public OrderController() {
		System.out.println(this.getClass());
	}

	// ==> classpath:config/common.properties ,
	// classpath:config/commonservice.xml 참조 할것
	// ==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	

	@RequestMapping(value="addOrder", method=RequestMethod.GET)
	public String addPurchaseView(@RequestParam("prodNo") int prodNo, Model model) throws Exception{
		System.out.println("addOrder");
		
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product", product);
		System.out.println("뭐가나오죵");
		
		return "forward:/shop/order/addOrder.jsp";

	}
	
	@RequestMapping(value="addOrder", method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("order") Order order, 
			@RequestParam("prodNo") int prodNo, HttpSession session) throws Exception{
		
		System.out.println("/addPurchase");
		
		User user = (User)session.getAttribute("user");
		Product product = productService.getProduct(prodNo);
		order.setProdNo(product);
		order.setId(user);
		System.out.println("뭐가 나오나오");
		
		orderService.addOrder(order);
		
		
		return "forward:/order/getOrder?orderNo="+order.getOrderNo();
	}
	
	@RequestMapping("/listOrder")
	public String listPurchaes(@ModelAttribute("search") Search search, 
			@ModelAttribute("user") User user, 
			Model model , HttpSession session) throws Exception {

		System.out.println("/listOrder");

		String id = ((User)session.getAttribute("user")).getId();
		
		System.out.println(id);
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String, Object> map = orderService.listOrder(search, id);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);


		return "forward:/purchase/listPurchase.jsp";
	}
	
	@RequestMapping("/updateOrderView")
	public String updatePurchaseView(@ModelAttribute("purchase") Order order, Model model) throws Exception{
		
		System.out.println("/updatePurchaseView");
				
		order = orderService.getOrder(order.getOrderNo());
		
	
		System.out.println(order);
		
		model.addAttribute("order", order);
		
		return "forward:/order/updateOrder.jsp";
	}

	
	
	@RequestMapping("/updateOrder")
	public String updatePurchase(@ModelAttribute("order") Order order ,@RequestParam("prodNo") int prodNo, 	@ModelAttribute("user") User user, 
			Model model , HttpSession session) throws Exception{
		
		System.out.println("/updatePurchase");
		String id = ((User)session.getAttribute("user")).getId();
		System.out.println(prodNo);
		System.out.println(id);
		System.out.println();
		//order.setProdNo(productService.getProduct(prodNo));
		System.out.println(order +"purchase");
		
		orderService.updateOrder(order);
		
		
		
		
		
		return "redirect:/shop/order/getOrder?orderNo="+order.getOrderNo();
	}
}
//	//@RequestMapping("updateTranCode.do")
//	@RequestMapping(value="updateTranCode")
//	public String updateTranCode(@ModelAttribute("order") Order order, @RequestParam("tranCode") String tranCode,
//			@RequestParam("buyerId") String buyerId) throws Exception{
//		
//		purchase.setTranCode(tranCode);
//		
//		ModelAndView modelAndView=new ModelAndView();
//		purchaseService.updateTranCode(purchase);
//		modelAndView.setViewName("redirect:/purchase/listPurchase?buyerId="+buyerId);
//		
//		return modelAndView;
//	}
//	
//	@RequestMapping(value="deletePurchase",method=RequestMethod.GET)
//	public String deletePurchaseView( @RequestParam("tranNo") int tranNo , Model model, HttpSession session ) throws Exception{
//
//		System.out.println("/deletePurchaseView.do");
//		//Business Logic
//		
//		Purchase purchase = purchaseService.getPurchase(tranNo);
//		model.addAttribute("purchase", purchase);
//		
//		// Model 과 View 연결
//
//		return "forward:/purchase/deletePurchaseView.jsp";
//	}
//	
//	@RequestMapping(value="deletePurchase", method=RequestMethod.POST)
//	public String deletePurchase (@RequestParam("tranNo") int tranNo, Model model) throws Exception{
//		System.out.println("/deletePurchase.do");
//		
//		purchaseService.deletePurchase(tranNo);
//		
//		return "forward:/purchase/deletePurchase.jsp";
//	}
