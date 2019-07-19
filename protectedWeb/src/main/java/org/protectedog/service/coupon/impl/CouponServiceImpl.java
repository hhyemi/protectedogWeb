package org.protectedog.service.coupon.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.coupon.CouponDAO;
import org.protectedog.service.coupon.CouponService;
import org.protectedog.service.domain.Coupon;
import org.protectedog.service.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("couponServiceImpl")
public class CouponServiceImpl implements CouponService{

	///Field
	@Autowired
	@Qualifier("couponDAOImpl")
	private CouponDAO couponDAO;
	public void setCouponDAO(CouponDAO couponDAO) {
		this.couponDAO = couponDAO;
	}
	
	///Constructor
	public CouponServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addCoupon(Coupon coupon) throws Exception {
		// TODO Auto-generated method stub
		couponDAO.addCoupon(coupon);
	}

	@Override
	public Coupon getCoupon(int couponNo) throws Exception {
		// TODO Auto-generated method stub
		return couponDAO.getCoupon(couponNo);
	}
	

	@Override
	public Map<String, Object> getCouponList(Map<String, Object> sMap) throws Exception {
		// TODO Auto-generated method stub
		List<Coupon> sList=couponDAO.getMyCouponList(sMap);
		Search search =(Search)sMap.get("search");
		List<Coupon> list=couponDAO.getCouponList(search);
		int totalCount=couponDAO.getTotalCount(search);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		map.put("sList", sList);
		return map;
	}

	@Override
	public void updateCouponStatus(Coupon coupon) throws Exception {
		// TODO Auto-generated method stub
		couponDAO.updateCouponStatus(coupon);
	}

	@Override
	public void addCouponManage(Coupon coupon) throws Exception {
		// TODO Auto-generated method stub
		couponDAO.addCouponManage(coupon);
	}

	@Override
	public int checkCoupon(String couponCode, String receiverId) throws Exception {
		// TODO Auto-generated method stub
		int result=0;
		Coupon coupon=(Coupon)couponDAO.getMyCoupon(couponCode, receiverId);
		
		if(coupon.getReceiverId()!=null) {
			result=1;
		}
		return result;
	}
	
}
