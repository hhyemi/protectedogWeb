package org.protectedog.web.message;

import java.util.HashMap;
import java.util.Map;

import org.protectedog.service.message.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
	public Map<String, Object> getUnreadMessage(@RequestBody Map<String, String> id) throws Exception{
		
		System.out.println("/message/json/getUnreadMessage : POST");
		
		//Business Logic
		String receiverId=id.get("id");
		System.out.println("receiverId : "+receiverId);
		int result=messageService.getUnreadMessage(receiverId);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("result", new Integer(result));

		return map;
		
	}
	
}

















