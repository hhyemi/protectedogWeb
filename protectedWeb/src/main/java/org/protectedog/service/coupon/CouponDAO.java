package org.protectedog.service.coupon;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Coupon;

public interface CouponDAO {

	// Insert by Manager
	public void addCouponManage(Coupon coupon) throws Exception;
	
	// Insert by User
	public void addCoupon(Coupon coupon) throws Exception;
	
	// Select One
	public Coupon getCoupon(int couponNo) throws Exception;
	
	// Select One(MyCoupon)
	public Coupon getMyCoupon(String couponCode, String receiverId) throws Exception;
	
	// Select List
	public List<Coupon> getCouponList(Search search) throws Exception;
	
	// Select MyList
	public List<Coupon> getMyCouponList(Map<String, Object> sMap) throws Exception;
	
	// Update
	public void updateCouponStatus(Coupon coupon) throws Exception;
	
	// List paging
	public int getTotalCount(Search search) throws Exception;
	
}
