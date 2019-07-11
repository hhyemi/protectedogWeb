package org.protectedog.service.message;

import java.util.List;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Message;

public interface MessageDAO {

	// Insert
	public void addMessage(Message message) throws Exception;
	
	// Select One
	public Message getMessage(int messageNo) throws Exception;
	
	// Select List
	public List<Message> getMessageList(Search search) throws Exception;
	
	// Update
	public void updateMessage(Message message) throws Exception;
	
	// List Paging
	public int getTotalCount(Search	search) throws Exception;
	
}
