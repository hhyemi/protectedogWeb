package org.protectedog.web.order;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
	public String addOrder(@RequestParam("prodNo") int prodNo, Model model) throws Exception{
		System.out.println("/addPurchaseView.do");
		
		Product product = productService.getProduct(prodNo);
		System.out.println("Order GET/////////////////////////");
		
		model.addAttribute("product", product);
		
		return "forward:/shop/order/addOrder.jsp";

	}
	
	@RequestMapping(value="addOrder")
	public String addOrder(@RequestParam("prodNo") int prodNo,
			@RequestParam("id") String id, Model model,
			HttpServletRequest request) throws Exception {

		System.out.println("/addOrder POST/////////////////////////");
		
		
		//model 안먹어서 self
		
		Order order=new Order();
		
		order.setId(request.getParameter("id"));
		System.out.println("1번/////////////////////");
		order.setReceiverName(request.getParameter("receiverName"));
		System.out.println("2번/////////////////////");
		order.setReceiverPhone(request.getParameter("receiverPhone"));
		System.out.println("3번/////////////////////");
		order.setReceiverAddr(request.getParameter("receiverAddr"));
		System.out.println("4번/////////////////////");
		order.setOrderRequest(request.getParameter("orderRequest"));
		System.out.println("String ORDER");
		order.setPhone(request.getParameter("phone"));
		System.out.println("다들 들어갔나요?");
		order.setOrderQuantity(Integer.parseInt(request.getParameter("orderQuantity")));
		System.out.println("수량 들어갔나요?");
		order.setOrderCode(1);
		order.setProdNo(Integer.parseInt(request.getParameter("prodNo")));
		order.setPaymentCode(Integer.parseInt(request.getParameter("paymentCode")));
		System.out.println("결제수단 들어갔나요?");
		Product product=new Product();
		product=productService.getProduct(prodNo);
		
		//totalPrice IN
		int total=(product.getDiscountPrice()*order.getOrderQuantity());
		order.setTotalPrice(total);
		
		//수량조절
		int quantity=(product.getQuantity()-order.getOrderQuantity());
		product.setQuantity(quantity);
		
		//null값처리
		if(order.getCouponNo() == 0) {
			order.setCouponNo(10001);
		}
		
		if(order.getMileageNo() ==0){
			order.setMileageNo(10000);
		}
		
		

		orderService.addOrder(order);

		System.out.println(order.getOrderNo());
		System.out.println(order);
		System.out.println("order Post////////////////////");

		model.addAttribute("order", order);

		return "forward:/shop/order/addOrder.jsp";
		
	}
	

	
		@RequestMapping(value="getOrder")
		public String getOrder(@RequestParam("orderNo") int orderNo,  @RequestParam("prodNo") int prodNo,
				Model model) throws Exception {

			System.out.println("getOrder");
			
			
			productService.getProduct(prodNo);
			Order order = orderService.getOrder(orderNo);
		
			order.setProdNo(prodNo);
			
			System.out.println(order);
			model.addAttribute("order", order);

			return "forward:/shop/order/getOrder.jsp";

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
		
		// Business logic
		Map<String, Object> map = orderService.listOrder(search, id);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);


		return "forward:/shop/order/listOrder.jsp";
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
		order.setId(id);
		order.setProdNo(prodNo);
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
//		// Model �� View ����
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
//}