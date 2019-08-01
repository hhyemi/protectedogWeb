package org.protectedog.web.order;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Board;
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
		
		
	
		//폰번호 병합 String
		String receiverPhone1="";
		String receiverPhone2="";
		String receiverPhone3="";
		String receiverPhone="";
		
		//주소 병합 String
		String receiverAddr1="";
		String receiverAddr2="";
		String receiverAddr3="";
		String receiverAddr4="";
		String receiverAddr="";
				
		
		//model 안먹어서 self
		Order order=new Order();
		
		order.setId(request.getParameter("id"));
		System.out.println("1번 아이디/////////////////////");
		order.setReceiverName(request.getParameter("receiverName"));
		System.out.println("2번 받는이/////////////////////");
		//폰 병합
		receiverPhone1=request.getParameter("receiverPhone1");
		receiverPhone2=request.getParameter("receiverPhone2");
		receiverPhone3=request.getParameter("receiverPhone3");
		receiverPhone=(receiverPhone1+"-"+receiverPhone2+"-"+receiverPhone3);
		
		//주소병합
		receiverAddr1=request.getParameter("receiverAddr1");
		receiverAddr2=request.getParameter("receiverAddr2");
		receiverAddr3=request.getParameter("receiverAddr3");
		receiverAddr4=request.getParameter("receiverAddr4");
		receiverAddr=(receiverAddr1+receiverAddr2+receiverAddr3+receiverAddr4);
		
		

		order.setReceiverPhone(receiverPhone);
		System.out.println("3번 받는이 연락처/////////////////////");
		order.setReceiverAddr(receiverAddr);
		System.out.println("4번 받는이 주소/////////////////////");
		order.setOrderRequest(request.getParameter("orderRequest"));
		System.out.println("5번 배송요청사항/////////////////////");
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
		System.out.println(total);
		System.out.println("총액 들어갔나요");
		System.out.println(order.getTotalPrice());
		
		//수량조절
		int quantity=(product.getQuantity()-order.getOrderQuantity());
		product.setQuantity(quantity);
		System.out.println(quantity);
		System.out.println(product.getQuantity());
		System.out.println("수량조절 되고 있나요");
		
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
	
	//주문내역 리스트 출력
	@RequestMapping(value="listOrder")
	public String listOrder( @ModelAttribute("search") Search search, HttpSession session, Model model) throws Exception{
		
		System.out.println("/listOrder");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// 회원 아이디를 GET하기 위한 Session 불러오기
		User user = (User)session.getAttribute("user");
		
		System.out.println(user);
		System.out.println("session value 확인");
		
		// Business logic 수행
		Map<String , Object> map=orderService.listOrder(search, user.getId());
		
		System.out.println(user.getId());
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		
		return "forward:/shop/order/listOrder.jsp";
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
	
