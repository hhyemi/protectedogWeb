package org.protectedog.service.coupon.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.common.Search;
import org.protectedog.service.coupon.CouponDAO;
import org.protectedog.service.domain.Coupon;
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
	public List<Coupon> getCouponList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("CouponMapper.getCouponList", search);
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

}
