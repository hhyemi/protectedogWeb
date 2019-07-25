package org.protectedog.service.message.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Message> getSendMessageList(Search search, String senderId) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("search", search);
		map.put("senderId", senderId);
		return sqlSession.selectList("MessageMapper.getSendMessageList", map);
	}
	
	@Override
	public List<Message> getReceiveMessageList(Search search, String receiverId) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("search", search);
		map.put("receiverId", receiverId);
		return sqlSession.selectList("MessageMapper.getReceiverMessageList", map);
	}

	@Override
	public void updateMessage(Message message) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("MessageMapper.updateMessage", message);
	}

	@Override
	public int getSendTotalCount(Search search, String senderId) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("search", search);
		map.put("senderId", senderId);
		return sqlSession.selectOne("MessageMapper.getSendTotalCount", map);
	}
	
	@Override
	public int getReceiveTotalCount(Search search, String receiverId) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("search", search);
		map.put("receiverId", receiverId);
		return sqlSession.selectOne("MessageMapper.getReceiveTotalCount", map);
	}
	
	@Override
	public Message getUnreadMessage(String receiverId) {
		// TODO Auto-generated method stub
		System.out.println("³Í ½ÇÇàÀÌ µÇ³Ä");
		Message message=sqlSession.selectOne("MessageMapper.getUnreadMessage", receiverId);
		System.out.println("³ª¿ÍºÁ¶ó : "+message);
		return message;

	}

}
