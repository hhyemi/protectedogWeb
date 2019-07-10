package org.protectedog.service.user;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.User;

public interface UserService {

	//ȸ������ �⺻�Է�
	public void addUsersBase(User user) throws Exception;
	
	//ȸ������ �߰��Է�
	public void addUsersAdditional(User user) throws Exception;
	
	//�α���, ������Ȯ��
	public User getUsers(String id) throws Exception;
	
	//ȸ������ ����Ʈ
	public Map<String, Object> getUsersList(Search search) throws Exception;
	
	//ȸ����������
	public void updateUsers(User user) throws Exception;
	
	//ȸ������ �ߺ�üũ
	public int checkDuplication(String id) throws Exception;
	
}
