package org.protectedog.service.message;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Message;

public interface MessageService {
	
	//�����ۼ�
	public void addMessage(Message message) throws Exception;
	
	//�����б�
	public Message getMessage(int messageNo) throws Exception;
	
//	//������������Ʈ
//	public Map<String, Object> getSendMessageList(Search search, String senderId) throws Exception;
	
//	//������������Ʈ
//	public Map<String, Object> getReceiveMessageList(Search search, String receiverId) throws Exception;
	
	//뭐라고썼지??
	public Map<String, Object> getMessageList(Search search, String nickname) throws Exception;
	
	//�������� ������Ʈ
	public void updateMessage(Message message) throws Exception;

	//������ ���� üũ
	public int getUnreadMessage(String receiverNick) throws Exception;

	public int getReceiveTotalCount(String receiverNick) throws Exception;

}
