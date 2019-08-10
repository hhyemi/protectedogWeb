package org.protectedog.service.user;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.User;

public interface UserService {

	//ȸ������(�⺻����)
	public void addUsersBase(User user) throws Exception;
	
	//ȸ������(�߰�����)
	public void addUsersAdditional(User user) throws Exception;
	
	//�α���, ����������
	public User getUsers(String id) throws Exception;
	public User getUsersByNick(String nickname) throws Exception;
	
	//��üȸ������
	public Map<String, Object> getUsersList(Search search) throws Exception;
	
	//ȸ����������
	public void updateUsers(User user) throws Exception;
	
	//���̵� �ߺ�üũ
	public int checkId(String id) throws Exception;
	
	//SNS ����
	public User getKakao(Map<String, Object> map) throws Exception;
	public User getGoogle(Map<String, Object> map) throws Exception;
	public User getNaver(Map<String, Object> map) throws Exception;

	//�г��� �ߺ�üũ
	public int checkNick(String nickname) throws Exception;
	

	
}
