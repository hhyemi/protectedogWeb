package org.protectedog.service.user;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.User;

public interface UserDAO {
	
	// Insert(기본정보)
	public void addUsersBase(User user) throws Exception;
	
	// Insert(추가정보)
	public void addUsersAdditional(User user) throws Exception;
	
	// Select One
	public User getUsers(String id) throws Exception;
	
	// Select List
	public List<User> getUsersList(Search search) throws Exception;
	
	// Update
	public void updateUsers(User user) throws Exception;
	
	// List paging
	public int getTotalCount(Search search) throws Exception;
	
	// SNS Insert, Select
	public User getSocial(Map<String, Object> map) throws Exception;
	

	
}
