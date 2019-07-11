package org.protectedog.service.coupon;

import java.util.List;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Coupon;

public interface CouponDAO {

	// Insert
	public void addCoupon(Coupon coupon) throws Exception;
	
	// Select One
	public Coupon getCoupon(int couponNo) throws Exception;
	
	// Select List
	public List<Coupon> getCouponList(Search search) throws Exception;
	
	// Update
	public void updateCouponStatus(Coupon coupon) throws Exception;
	
	// List paging
	public int getTotalCount(Search search) throws Exception;
	
}
