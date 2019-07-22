package org.protectedog.web.user;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.protectedog.common.AuthKey;
import org.protectedog.service.domain.User;
import org.protectedog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@RestController
@RequestMapping("/users/*")
public class UserRestController {

	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	///Constructor
	public UserRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	///Method
	@RequestMapping( value="json/checkId", method=RequestMethod.POST )
	public Map<String, Object> checkId( @RequestBody Map<String, String> checkId) throws Exception{
		
		System.out.println("/users/json/checkId : POST");
		//Business Logic
		String id=checkId.get("id");
		System.out.println("CheckId : "+id);
		int result=userService.checkId(id);

		Map<String, Object> map=new HashMap<String, Object>();
		map.put("result", new Integer(result));
		map.put("id", id);


		return map;
	}
	
	@RequestMapping(value="json/checkNick", method=RequestMethod.POST )
	public Map<String, Object> checkNick( @RequestBody Map<String, String> checkNick) throws Exception{
		
		System.out.println("/users/json/checkNick : POST");
		//Business Logic
		String nickname=checkNick.get("nickname");
		System.out.println("checkNick : "+nickname);
		int result=userService.checkNick(nickname);

		Map<String, Object> map=new HashMap<String, Object>();
		map.put("result", new Integer(result));
		map.put("nickname", nickname);


		return map;
	}
	
	
	
	@RequestMapping(value="json/sendSMS", method=RequestMethod.POST)
	public Map<String, Object> sendSMS(@RequestBody String phone) throws Exception{
		System.out.println("sendSMS : "+phone);
		String api_key = "NCSOUAIMR8GFH5N6";
		String api_secret = "UPBGXCTKKAU0ZYXLQ3WOWTMU7KMTYRF4";
		Message coolsms = new Message(api_key, api_secret);
		String authKey=new AuthKey().excuteGenerate();

		    // 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phone);
		params.put("from", "01047576528");
		params.put("type", "SMS");
		params.put("text", "보호할개 인증번호 여섯자리입니다. : ["+authKey+"] ");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
		JSONObject obj = (JSONObject) coolsms.send(params);
		System.out.println(obj.toString());
		} catch (CoolsmsException e) {
		System.out.println(e.getMessage());
		System.out.println(e.getCode());
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("authKey", authKey);
		return map;
	}
	
	@RequestMapping(value="json/login", method=RequestMethod.POST)
	public User login(@RequestBody Map<String, Object> chkLogin) throws Exception{
		
		System.out.println("json-login : POST");
		
		User user=userService.getUsers((String)chkLogin.get("id"));
		
		return user;
	}
	
}
