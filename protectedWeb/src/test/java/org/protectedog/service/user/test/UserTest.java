package org.protectedog.service.user.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.protectedog.common.Search;
import org.protectedog.service.domain.User;
import org.protectedog.service.user.UserService;
import org.protectedog.service.user.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;





@RunWith(SpringJUnit4ClassRunner.class)


@ContextConfiguration(locations = { "classpath:config/context-*.xml" })

public class UserTest {


	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	//@Test
	public void testAddUsersBase() throws Exception {
		
		User user = new User();
		user.setUserNo(10008);
		user.setId("testUserId");
		user.setUserName("testUser");
		user.setPw("testPass");
		user.setNickname("testNickname");
		user.setLevelPoint(0);
		user.setLevels("미인증회원");
		user.setRole("user");
		user.setPurpose1(null);
		user.setPurpose2(null);
		user.setPurpose3(null);
		
		userService.addUsersBase(user);
		
		user = userService.getUsers("testUserId");


		System.out.println(user);
		

	}
	
	//@Test
	public void testGetUser() throws Exception {
		
		User user = new User();
		user.setUserNo(10009);
		user.setId("testUserId2");
		user.setUserName("testUser2");
		user.setPw("testPass");
		user.setNickname("testNick2");
		user.setLevelPoint(0);
		user.setLevels("미인증회원");
		user.setRole("user");
		user.setPurpose1(null);
		user.setPurpose2(null);
		user.setPurpose3(null);
		
		user = userService.getUsers("testUserId2");

		System.out.println(user);

	}
	
//	@Test
	 public void testUpdateUser() throws Exception{
		 
		User user = userService.getUsers("testUserId");
		Assert.assertNotNull(user);

		user.setUserName("testUser1");
		user.setPw("TestPass");
		user.setNickname("testNick");
		user.setEmail("abc@naver.com");
		user.setPhone("111-2222-3333");
		user.setUserAddr("섬진강 화개장터");
		user.setAccount("110-000-111111");
		user.setProfile("gdgd.jpg");
		
		userService.updateUsers(user);
		
		user = userService.getUsers("testUserId");
		Assert.assertNotNull(user);

		System.out.println(user);

	 }
	 
//	//@Test
//	public void testCheckDuplication() throws Exception{
//
//		
//			User user = new User();
//			user.setUserId("testUserId");
//			user.setUserName("testUserName");
//			user.setPassword("testPasswd");
//			user.setSsn("1111112222222");
//			user.setPhone("111-2222-3333");
//			user.setAddr("��⵵");
//			user.setEmail("test@test.com");
//			
//			userService.addUser(user);
//		
//		//==> console Ȯ��
//		//System.out.println(userService.checkDuplication("testUserId"));
//		//System.out.println(userService.checkDuplication("testUserId"+System.currentTimeMillis()) );

//	}
	

	 //@Test
	 public void testGetUserListAll() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = userService.getUsersList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	

	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = userService.getUsersList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	

	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }

}