package org.protectedog.service.message.test;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Message;
import org.protectedog.service.domain.User;
import org.protectedog.service.message.MessageService;
import org.protectedog.service.user.UserService;
import org.protectedog.service.user.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;



@RunWith(SpringJUnit4ClassRunner.class)


@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
public class MessageTest {


	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageService messageService;

//	//@Test
//	public void testAddMessage() throws Exception {
//
//		Message message=new Message();
//		message.setMessageNo(10000);
//		message.setMessageTitle("hihi");
//		message.setMessageContent("ÀÌ°Å½¼ Å×½ºÆ®ÀÎ °Å½Ã¿©1");
//		
//		User sender=new User();
//		sender.setId("user01");
//		message.setSender(sender);
//		
//		User receiver=new User();
//		receiver.setId("user02");
//		message.setReceiver(receiver);
//		
//		Date date=new Date();
//		date.setYear(2019);
//		date.setMonth(03);
//		date.setDate(01);
//		message.setSendDate(date);
//		
//		message.setMessageStatus("1");
//		message.setDelCode("0");
//		
//		messageService.addMessage(message);
//		
//		message = messageService.getMessage(10000);
//
//		
//		System.out.println(message);
//		
//
//	}
//	
//	//@Test
//	public void testGetMessage() throws Exception {
//		
//		Message message=new Message();
//		message.setMessageNo(10001);
//		message.setMessageTitle("hihihi");
//		message.setMessageContent("ÀÌ°Å½¼ Å×½ºÆ®ÀÎ °Å½Ã¿©2");
//		
//		User sender=new User();
//		sender.setId("user02");
//		message.setSender(sender);
//		
//		User receiver=new User();
//		receiver.setId("user03");
//		message.setReceiver(receiver);
//		
//		Date date=new Date();
//		date.setYear(2019);
//		date.setMonth(04);
//		date.setDate(22);
//		message.setSendDate(date);
//		
//		message.setMessageStatus("1");
//		message.setDelCode("0");
//		
//		message = messageService.getMessage(10001);
//
//	}
//	
//	//@Test
//	 public void testUpdateMessage() throws Exception{
//		 
//		Message message = messageService.getMessage(10001);
//		Assert.assertNotNull(message);
//
//		message.setMessageStatus("2");
//		Date date=new Date();
//		date.setYear(2019);
//		date.setMonth(05);
//		date.setDate(23);
//		message.setSendDate(date);
//		message.setReceiveDate(date);
//		
//		messageService.updateMessage(message);
//		
//		message = messageService.getMessage(10001);
//		Assert.assertNotNull(message);
//		
//		
//		System.out.println(message);
//			
//
//	 }
//
//	
//
//	 @Test
//	 public void testGetMessageListAll() throws Exception{
//		 
//	 	Search search = new Search();
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(3);
//	 	Map<String,Object> map = messageService.getMessageList(search);
//	 	
//	 	List<Object> list = (List<Object>)map.get("list");
//	 	
//		//==> console È®ï¿½ï¿½
//	 	//System.out.println(list);
//	 	
//	 	Integer totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 	
//	 	System.out.println("=======================================");
//	 	
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(3);
//	 	search.setSearchCondition("0");
//	 	search.setSearchKeyword("");
//	 	map = messageService.getMessageList(search);
//	 	
//	 	list = (List<Object>)map.get("list");
//	
//	 	
//	 	//==> console È®ï¿½ï¿½
//	 	//System.out.println(list);
//	 	
//	 	totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 }
 
}