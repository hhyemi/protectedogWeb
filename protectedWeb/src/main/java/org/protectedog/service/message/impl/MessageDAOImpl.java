package org.protectedog.service.message.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Message;
import org.protectedog.service.message.MessageDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("messageDAOImpl")
public class MessageDAOImpl implements MessageDAO{

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public MessageDAOImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Override
	public void addMessage(Message message) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("MessageMapper.addMessage", message);
	}

	@Override
	public Message getMessage(int messageNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MessageMapper.getMessage", messageNo);
	}

	@Override
	public List<Message> getMessageList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("MessageMapper.getMessageList", search);
	}

	@Override
	public void updateMessage(Message message) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("MessageMapper.updateMessage", message);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MessageMapper.getTotalCount", search);
	}

}
