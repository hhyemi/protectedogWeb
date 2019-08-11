package org.protectedog.web.message;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.protectedog.service.domain.Message;
import org.protectedog.service.message.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/message/*")
public class MessageRestController {

	///Field
	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageService messageService;
	
	///Constructor
	public MessageRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	
	///Method
	@RequestMapping(value="json/getUnreadMessage", method=RequestMethod.POST)
	public Map<String, Object> getUnreadMessage(@RequestBody Map<String, String> msgId) throws Exception{
		
		System.out.println("/message/json/getUnreadMessage : POST");
		
		//Business Logic
		String receiverId=msgId.get("id");
		System.out.println("receiverId : "+receiverId);
		int result=messageService.getUnreadMessage(receiverId);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("result", new Integer(result));
		System.out.println("getUnreadMessage result : "+map.get("result"));

		return map;
		
	}
	
	@RequestMapping(value="json/getMessage/{messageNo}", method=RequestMethod.GET)
	public Map<String, Object> getMessage(@PathVariable int messageNo) throws Exception{
		
		System.out.println("/message/json/getMessage : GET");

		Date date=new Date();
		Message message=messageService.getMessage(messageNo);
		date=message.getSendDate();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yy-MM-dd");
		String sendDate=dateFormat.format(date);
		
		message.setMessageStatus("1");
		messageService.updateMessage(message);
		System.out.println("흠좀무 : "+message.getMessageStatus());
		
		Map<String , Object> map=new HashMap<String, Object>();
		map.put("sendDate", sendDate);
		map.put("message", messageService.getMessage(messageNo));
		
		return map;
		
	}
	
	@RequestMapping(value="json/getReceiveTotalCount", method=RequestMethod.POST)
	public int getReceiveTotalCount(@RequestBody Map<String, String> rcvNick) throws Exception{
		
		System.out.println("/message/json/getReceiveTotalCount : POST");
		
		String receiverNick=rcvNick.get("nickname");
		System.out.println("getReceiveTotalCount : "+receiverNick);
		int result=messageService.getReceiveTotalCount(receiverNick);
		System.out.println("리절트 언제 찍히는건지 궁금하다");
		return result;
		
	}
	
	
	
}

















