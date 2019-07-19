package org.protectedog.web.coupon;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.protectedog.common.AuthKey;
import org.protectedog.service.coupon.CouponService;
import org.protectedog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@RestController
@RequestMapping("/coupon/*")
public class CouponRestController {

	///Field
	@Autowired
	@Qualifier("couponServiceImpl")
	private CouponService couponService;
	
	///Constructor
	public CouponRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	///Method
	
	@RequestMapping(value="json/checkCoupon", method=RequestMethod.POST)
	public Map<String, Object> checkCoupon(@RequestBody Map<String, Object> checkCoupon) throws Exception{
		
		System.out.println("/coupon/json/checkCoupon : POST");
		
		String couponCode=(String)checkCoupon.get("couponCode");
		String receiverId=(String)checkCoupon.get("receiverId");
		int result=couponService.checkCoupon(couponCode, receiverId);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("result", new Integer(result));
		map.put("couponCode", couponCode);
		map.put("receiver", receiverId);
		
		return map;
		
	}
	
}
