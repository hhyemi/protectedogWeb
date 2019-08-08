package org.protectedog.service.coupon;

import java.util.Map;

import org.protectedog.service.domain.Coupon;

public interface CouponService {

	// ���� ���
	public void addCouponManage(Coupon coupon) throws Exception;
	
	// ���� ����
	public void addCoupon(Coupon coupon) throws Exception;
	
	// ���� ����ȸ
	public Coupon getCoupon(int couponNo) throws Exception;

	
	// ���� ������Ʈ��ȸ
	public Map<String, Object> getCouponList(Map<String, Object> sMap) throws Exception;
	
	// �������� ����
	public void updateCouponStatus(Coupon coupon) throws Exception;
	
	// ���� ��ȿ��üũ
	public int checkCoupon(String couponCode, String receiverId) throws Exception;
	
}
