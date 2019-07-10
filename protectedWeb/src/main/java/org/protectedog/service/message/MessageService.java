package org.protectedog.service.message;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Message;

public interface MessageService {
	
	//쪽지작성
	public void addMessage(Message message) throws Exception;
	
	//쪽지읽기
	public Message getMessage(int messageNo) throws Exception;
	
	//쪽지리스트
	public Map<String, Object> getMessageList(Search search) throws Exception;
	
	//쪽지상태 업데이트
	public void updateMessage(Message message) throws Exception;

}
