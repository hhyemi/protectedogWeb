package org.protectedog.web.coupon;

import java.util.HashMap;
import java.util.Map;

import org.protectedog.service.coupon.CouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/coupon/*")
public class CouponRestController {

	///Field
	@Autowired
	@Qualifier("couponServiceImpl")
	private CouponService couponService;
	
	///Constructor
	public CouponRestController() {
		System.out.println(this.getClass());
	}
	
	///Method
	
	@RequestMapping(value="json/checkCoupon", method=RequestMethod.POST)
	public Map<String, Object> checkCoupon(@RequestBody Map<String, Object> checkCoupon) throws Exception{
		
		System.out.println("/coupon/json/checkCoupon : POST");

		String couponCode=(String)checkCoupon.get("couponCode");

		String receiverId=(String)checkCoupon.get("receiverId");
		System.out.println("json/checkCoupon(forward) : "+couponCode);
		System.out.println("json/checkCoupon(forward) : "+receiverId);
	
		int result=couponService.checkCoupon(couponCode, receiverId);

		System.out.println("json/checkCoupon : "+couponCode);
		System.out.println("json/checkCoupon : "+receiverId);
		System.out.println("json/checkCoupon : "+result);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("result", new Integer(result));
		map.put("couponCode", couponCode);
		map.put("receiverId", receiverId);
		
		System.out.println("json/checkCoupon : "+map.toString());
		
		return map;
		
	}
	
}
