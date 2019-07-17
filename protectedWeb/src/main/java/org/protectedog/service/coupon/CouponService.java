package org.protectedog.service.coupon;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Coupon;

public interface CouponService {

	// 쿠폰 등록
	public void addCouponManage(Coupon coupon) throws Exception;
	
	// 쿠폰 수령
	public void addCoupon(Coupon coupon) throws Exception;
	
	// 쿠폰 상세조회
	public Coupon getCoupon(int couponNo) throws Exception;
	
	// 쿠폰 마리스트조회
	public Map<String, Object> getCouponList(Map<String, Object> sMap) throws Exception;
	
	// 쿠폰상태 수정
	public void updateCouponStatus(Coupon coupon) throws Exception;
	
}
