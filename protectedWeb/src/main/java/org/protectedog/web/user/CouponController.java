package org.protectedog.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.coupon.CouponService;
import org.protectedog.service.domain.Coupon;
import org.protectedog.service.domain.User;
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
@RequestMapping("/coupon/*")
public class CouponController {

	///Field
	@Autowired
	@Qualifier("couponServiceImpl")
	private CouponService couponService;
	
	///Constructor
	public CouponController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	///Paging을 위한 Value설정
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	///Method
	@RequestMapping(value="addCouponManage", method=RequestMethod.GET)
	public String addCouponManage() throws Exception{
		
		System.out.println("/coupon/addCouponManage : GET");
		
		return "redirect:/coupon/addCouponManageView.jsp";
		
	}
	
	@RequestMapping(value="addCouponManage", method=RequestMethod.POST)
	public String addCouponManage(@ModelAttribute("coupon") Coupon coupon) throws Exception{
		
		System.out.println("/coupon/addCouponManage : POST");
		
		couponService.addCouponManage(coupon);
		
		return "/coupon/listCoupon";
	}

	
	@RequestMapping(value="addCoupon", method=RequestMethod.GET)
	public String addCoupon(@RequestParam("receiveId") String id, 
							@RequestParam("couponNo") int couponNo, 
							@RequestParam("couponStatus") char couponStatus) throws Exception{
		
		System.out.println("/coupon/addCoupon : POST");
		
		Coupon coupon=couponService.getCoupon(couponNo);

		coupon.setReceiveId(id);
		coupon.setCouponStatus(couponStatus);
		
		System.out.println("addCoupon : "+coupon);
		
		couponService.addCoupon(coupon);
		
		return "/coupon/listCoupon";
		
	}
	
	@RequestMapping(value="listCoupon")
	public String listCoupon(@ModelAttribute("search") Search search, Model model, HttpSession session) throws Exception{
		
		System.out.println("/coupon/listCoupon");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		User user=(User)session.getAttribute("user");
		
		Map<String, Object> sMap=new HashMap<String, Object>();
		
		sMap.put("user", user);
		sMap.put("search", search);
		
		Map<String, Object> map=couponService.getCouponList(sMap);
		System.out.println("Coupon 리스트 : "+map.toString());
		
		Page resultPage=new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("Coupon 리스트 페이지 : "+resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("sList", map.get("sList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/coupon/listCouponView.jsp";
		
	}
	
	@RequestMapping(value="updateCoupon")
	public String updateCoupon(@RequestParam("couponStatus") char couponStatus,  
								@RequestParam("couponNo") int couponNo, 
								HttpServletRequest request) throws Exception{
		
		System.out.println("/coupon/updateCoupon");
		
		Coupon coupon=couponService.getCoupon(couponNo);
		
		coupon.setCouponStatus(couponStatus);
		
		couponService.updateCouponStatus(coupon);
		
		request.setAttribute("coupon", coupon);
		
		return "/coupon/listCoupon";
	}
	
}
