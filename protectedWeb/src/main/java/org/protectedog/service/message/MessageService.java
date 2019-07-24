package org.protectedog.service.message;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Message;

public interface MessageService {
	
	//쪽지작성
	public void addMessage(Message message) throws Exception;
	
	//쪽지읽기
	public Message getMessage(int messageNo) throws Exception;
	
	//보낸쪽지리스트
	public Map<String, Object> getSendMessageList(Search search, String senderId) throws Exception;
	
	//받은쪽지리스트
	public Map<String, Object> getReceiveMessageList(Search search, String receiverId) throws Exception;
	
	//쪽지상태 업데이트
	public void updateMessage(Message message) throws Exception;

	//안읽은 쪽지 체크
	public int getUnreadMessage(String receiverId) throws Exception;

}
