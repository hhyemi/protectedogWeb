package org.protectedog.service.interest.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Interest;
import org.protectedog.service.interest.InterestDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
@Repository("interestDAOImpl")
public class InterestDAOImpl implements InterestDAO{

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public InterestDAOImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addInterest(Interest interest) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("InterestMapper.addInterest", interest);
	}

	@Override
	public Interest getInterest(int interestNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("InterestMapper.getInterest", interestNo);
	}

	@Override
	public List<Interest> getInterestList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("InterestMapper.getInterestList", search);
	}

	@Override
	public void deleteInterest(Interest interest) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("InterestMapper.deleteInterest", interest);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
