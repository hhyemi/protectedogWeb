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

	@Override
	public Map<String, Object> getMessageList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Message> list=messageDAO.getMessageList(search);
		int totalCount=messageDAO.getTotalCount(search);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public void updateMessage(Message message) throws Exception {
		// TODO Auto-generated method stub
		messageDAO.updateMessage(message);
	}

}
