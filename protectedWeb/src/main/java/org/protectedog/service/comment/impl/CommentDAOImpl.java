package org.protectedog.service.comment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.common.Search;
import org.protectedog.service.comment.CommentDAO;
import org.protectedog.service.domain.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("commentDAOImpl")
public class CommentDAOImpl implements CommentDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void addComment(Comment comment) throws Exception {
		sqlSession.insert("CommentMapper.addComment", comment);
	}

	@Override
	public Comment getComment(int commentNo) throws Exception {		
		return sqlSession.selectOne("CommentMapper.getComment", commentNo);
	}

	@Override
	public void updateComment(Comment comment) throws Exception {
		sqlSession.update("CommentMapper.updateComment", comment);
	}

	@Override
	public List<Comment> listComment(int postNo, Search search) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postNo", postNo);
		map.put("startRowNum", search.getStartRowNum());
		map.put("endRowNum",search.getEndRowNum());
		
		List<Comment> list = sqlSession.selectList("CommentMapper.listComment", map);
		
		return list;
	}

	@Override
	public void delComment(int commentNo) throws Exception {
		sqlSession.update("CommentMapper.delComment", commentNo);		
	}

	@Override
	public int getTotalCount(int postNo) throws Exception {
		System.out.println(" CommentDAOImpl getTotlaCount postNo : " + postNo);
		return sqlSession.selectOne("CommentMapper.getTotalCount", postNo);
	}

	@Override
	public void reportComment(int commentNo) throws Exception {
		sqlSession.insert("CommentMapper.addReport", commentNo);
	}

	@Override
	public void updateLikeCnt(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
