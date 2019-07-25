package org.protectedog.service.review.impl;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.service.domain.Review;
import org.protectedog.service.review.ReviewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository("reviewDAOImpl")
public class ReviewDAOImpl implements ReviewDAO {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
			
	public void setSqlSession(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
		
	///Constructor
	public ReviewDAOImpl(){
		System.out.println(this.getClass());
	}

	@Override
	public void addReview(Review review) throws Exception {
		sqlSession.insert("ReviewMapper.addReview", review);

	}

	@Override
	public Review getReview(int postNo) throws Exception {
		return sqlSession.selectOne("ReviewMapper.getReview", postNo);
	}
//
//	@Override
//	public List<Review> listReview(Search search, String boardCode) throws Exception {
//		// TODO Auto-generated method stub
//		Map<String, Object> map=new HashMap<String, Object>();
//		map.put("search", search);
//		map.put("boardCode", boardCode);
//		return sqlSession.selectList("reviewMapper.listReview",map);
//	}
//
//	@Override
//	public void updateReivew(Review review) throws Exception {
//		// TODO Auto-generated method stub
//		sqlSession.update("reviewMapper.updateReview", review);
//
//	}
//
//	@Override
//	public void delReivew(Review review) throws Exception {
//		// TODO Auto-generated method stub
//		sqlSession.delete("reviewMapper.delReview", review);
//
//	}
//
//	@Override
//	public int getTotalCount(Search search) throws Exception {
//		// TODO Auto-generated method stub
//		return 0;
//	}

}
