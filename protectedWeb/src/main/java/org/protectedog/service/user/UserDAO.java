package org.protectedog.service.user;

import java.util.List;

import org.protectedog.common.Search;
import org.protectedog.service.domain.User;

public interface UserDAO {
	
	// Insert(�⺻����)
	public void addUsersBase(User user) throws Exception;
	
	// Insert(�߰�����)
	public void addUsersAdditional(User user) throws Exception;
	
	// Select One
	public User getUsers(String id) throws Exception;
	
	// Select List
	public List<User> getUsersList(Search search) throws Exception;
	
	// Update
	public void updateUsers(User user) throws Exception;
	
	// List pageó��
	public int getTotalCount(Search search) throws Exception;
	
}
