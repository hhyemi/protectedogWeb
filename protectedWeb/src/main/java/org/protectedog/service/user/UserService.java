package org.protectedog.service.user;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.User;

public interface UserService {

	//회원가입(기본정보)
	public void addUsersBase(User user) throws Exception;
	
	//회원가입(추가정보)
	public void addUsersAdditional(User user) throws Exception;
	
	//로그인, 내정보보기
	public User getUsers(String id) throws Exception;
	
	//전체회원보기
	public Map<String, Object> getUsersList(Search search) throws Exception;
	
	//회원정보수정
	public void updateUsers(User user) throws Exception;
	
	//아이디 중복체크
	public int checkId(String id) throws Exception;
	
	//SNS 연동
	public User getKakao(Map<String, Object> map) throws Exception;
	public User getGoogle(Map<String, Object> map) throws Exception;
	public User getNaver(Map<String, Object> map) throws Exception;

	//닉네임 중복체크
	public int checkNick(String nickname) throws Exception;
	

	
}
