package org.protectedog.service.review.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.common.Search;
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

	@Override
	public List<Review> listReview(Search search, String boardCode, String hospitalName) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchCondition",  search.getSearchCondition());
		map.put("searchKeyword",  search.getSearchKeyword());
		map.put("endRowNum",  search.getEndRowNum()+"" );
		map.put("startRowNum",  search.getStartRowNum()+"" );
		map.put("boardCode",boardCode);
		map.put("hospitalName", hospitalName);
		return sqlSession.selectList("ReviewMapper.listReview",map);
	}

	@Override
	public void updateReivew(Review review) throws Exception {
		sqlSession.update("ReviewMapper.updateReview", review);

	}

	@Override
	public void delReivew(int postNo) throws Exception {
		sqlSession.delete("ReviewMapper.delReview", postNo);

	}

	@Override
	public int getTotalCount(Search search, String boardCode,String hospitalName) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("searchCondition",  search.getSearchCondition());
		map.put("searchKeyword",  search.getSearchKeyword());
		map.put("endRowNum",  search.getEndRowNum()+"" );
		map.put("startRowNum",  search.getStartRowNum()+"" );
		map.put("boardCode",boardCode);
		map.put("hospitalName", hospitalName);
		return sqlSession.selectOne("ReviewMapper.getTotalCount",map);
	}

}
