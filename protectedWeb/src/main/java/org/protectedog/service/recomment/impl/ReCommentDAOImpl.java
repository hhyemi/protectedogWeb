package org.protectedog.service.recomment.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.service.domain.Comment;
import org.protectedog.service.domain.ReComment;
import org.protectedog.service.recomment.ReCommentDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("reCommentDAOImpl")
public class ReCommentDAOImpl implements ReCommentDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void addReComment(ReComment reComment) throws Exception {
		sqlSession.insert("ReCommentMapper.addReComment", reComment);
	}

	@Override
	public ReComment getReComment(int reCommentNo) throws Exception {
		
		return sqlSession.selectOne("ReCommentMapper.getReComment", reCommentNo);
	}

	@Override
	public void updateReComment(ReComment reComment) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ReComment> listReComment(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("ReCommentMapper.listReComment", map);
	}

	@Override
	public void delReComment(int reCommentNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getTotalCount(int postNo) throws Exception {
		return sqlSession.selectOne("ReCommentMapper.getTotalCount", postNo);
	}
}
