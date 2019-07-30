package org.protectedog.service.message.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Message;
import org.protectedog.service.message.MessageDAO;
import org.protectedog.service.message.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("messageServiceImpl")
public class MessageServiceImpl implements MessageService{

	///Field
	@Autowired
	@Qualifier("messageDAOImpl")
	private MessageDAO messageDAO;
	public void setMessageDAO(MessageDAO messageDAO) {
		this.messageDAO = messageDAO;
	}
	
	///Constructor
	public MessageServiceImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addMessage(Message message) throws Exception {
		// TODO Auto-generated method stub
		messageDAO.addMessage(message);
	}

	@Override
	public Message getMessage(int messageNo) throws Exception {
		// TODO Auto-generated method stub
		return messageDAO.getMessage(messageNo);
	}

//	@Override
//	public Map<String, Object> getSendMessageList(Search search, String senderId) throws Exception {
//		// TODO Auto-generated method stub
//		List<Message> list=messageDAO.getSendMessageList(search, senderId);
//		int totalCount=messageDAO.getSendTotalCount(search, senderId);
//		
//		Map<String, Object> map=new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("totalCount", new Integer(totalCount));
//		
//		return map;
//	}
	
//	@Override
//	public Map<String, Object> getReceiveMessageList(Search search, String receiverId) throws Exception {
//		// TODO Auto-generated method stub
//		List<Message> list=messageDAO.getReceiveMessageList(search, receiverId);
//		int totalCount=messageDAO.getReceiveTotalCount(search, receiverId);
//		
//		Map<String, Object> map=new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("totalCount", new Integer(totalCount));
//		
//		return map;		
//	}
	
	@Override
	public Map<String, Object> getMessageList(Search search, String id) throws Exception {
		// TODO Auto-generated method stub
		List<Message> list=messageDAO.getMessageList(search, id);
		int totalCount=messageDAO.getTotalCount(search, id);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;		
	}

	@Override
	public void updateMessage(Message message) throws Exception {
		// TODO Auto-generated method stub
		messageDAO.updateMessage(message);
	}
	
	@Override
	public int getUnreadMessage(String receiverId) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("�� �ȵ�����?");
		int result=0;
		
		Message message=messageDAO.getUnreadMessage(receiverId);
		System.out.println("message ����? : "+message);
		if(message != null) {
			result=1;
		}
		
		return result;
	}
	
	@Override
	public int getReceiveTotalCount(String receiverId) throws Exception {
		// TODO Auto-generated method stub
		int result=0;
		
		int search=messageDAO.getReceiveTotalCount(receiverId);
		if(search != 0) {
			result=search;
		}
		return result;
	}

}
