package org.protectedog.service.coupon.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.common.Search;
import org.protectedog.service.coupon.CouponDAO;
import org.protectedog.service.domain.Coupon;
import org.protectedog.service.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAOImpl implements CouponDAO{

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlsession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public CouponDAOImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addCoupon(Coupon coupon) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("CouponMapper.addCoupon", coupon);
	}

	@Override
	public Coupon getCoupon(int couponNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CouponMapper.getCoupon", couponNo);
	}

	@Override
	public Coupon getMyCoupon(String couponCode, String receiverId) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("couponCode", couponCode+"");
		map.put("receiverId", receiverId+"");
		System.out.println("couponDAO 입장: "+map.toString());
		
//		Map<String, Object> cMap=sqlSession.selectOne("CouponMapper.getMyCoupon", map);
//		System.out.println("couponDAO : "+cMap.get("couponCode"));
//		System.out.println("couponDAO : "+cMap.get("receiverId"));
		Coupon coupon=sqlSession.selectOne("CouponMapper.getMyCoupon", map);
		System.out.println("couponDAO 퇴장: "+coupon);
		
		return coupon; 
	}
	
	@Override
	public List<Coupon> getMyCouponList(Map<String, Object> sMap) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> rMap=new HashMap<String, Object>();
		User user = (User)sMap.get("user");
		rMap.put("receiverId", user.getId());
		Search search=(Search)sMap.get("search");
		rMap.put("startNum", search.getStartRowNum());
		rMap.put("endNum", search.getEndRowNum());
		return sqlSession.selectList("CouponMapper.getMyCouponList", rMap);
	}

	@Override
	public void updateCouponStatus(Coupon coupon) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("CouponMapper.updateCoupon", coupon);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CouponMapper.getTotalCount", search);
	}

	@Override
	public void addCouponManage(Coupon coupon) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("CouponMapper.addCouponManage", coupon);
	}

	@Override
	public List<Coupon> getCouponList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("CouponMapper.getCouponList", search) ;
	}

}
