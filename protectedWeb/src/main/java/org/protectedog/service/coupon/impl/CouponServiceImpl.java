package org.protectedog.service.coupon.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.coupon.CouponDAO;
import org.protectedog.service.coupon.CouponService;
import org.protectedog.service.domain.Coupon;
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
	public Map<String, Object> getCouponList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Coupon> list=couponDAO.getCouponList(search);
		int totalCount=couponDAO.getTotalCount(search);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;
	}

	@Override
	public void updateCouponStatus(Coupon coupon) throws Exception {
		// TODO Auto-generated method stub
		couponDAO.updateCouponStatus(coupon);
	}


	
}
