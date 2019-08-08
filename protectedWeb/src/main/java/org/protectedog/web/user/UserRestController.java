package org.protectedog.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.protectedog.common.AuthKey;
import org.protectedog.common.SendMail;
import org.protectedog.service.domain.User;
import org.protectedog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
		params.put("text", "[#protected] 휴대전화 인증번호입니다. : ["+authKey+"] ");
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
	
	@RequestMapping(value="json/mailSender", method=RequestMethod.POST)
	public Map<String, Object> mailSender(@RequestBody Map<String, String> email) throws Exception{
		
		System.out.println("/users/json/mailSender : POST");
		
		String authKey=new AuthKey().excuteGenerate();
		System.out.println("mailSender authKey : "+authKey);
		
		String receiver=email.get("email");
		System.out.println("mailSender email : "+email);
		String title="[보호할개] 계정인증 메일입니다";
		String content=" [ "+authKey+" ] 입니다. 본인이 아닐경우 회신바랍니다.";
		
		SendMail.mailSend(title, content, receiver);

		Map<String, Object> map=new HashMap<String, Object>();
		map.put("authKey", authKey);
		
		return map;
	}
	
	@RequestMapping(value="json/login", method=RequestMethod.POST)
	public Map<String, Object> login(@RequestBody Map<String, Object> chkLogin, 
						HttpSession session, 
						HttpServletRequest request) throws Exception{
		
		System.out.println("json-login : POST");
		
		User user=userService.getUsers((String)chkLogin.get("id"));
		System.out.println("session 생성 전 user : "+user);
		System.out.println("session 생성 전 chkLogin pw : "+chkLogin.get("pw"));
		System.out.println("session 생성 전 user pw :"+user.getPw());
		
		if(chkLogin.get("pw").equals(user.getPw())) {
			session.setAttribute("user", user);
			System.out.println("json/login 수행 후 user : "+user);
			System.out.println("json/login 수행 후 sessison"+session.getAttribute("user"));
		}else {
			System.out.println("json/login 수행 후 : "+user);
		}

		System.out.println("json/login URI : "+request.getRequestURI());
		
		/**/
		String prevURI = request.getHeader("referer");
		
		String[] convertURI = prevURI.split("/");
		
		System.out.println(" convertURI " + convertURI[1]);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("user", user);
		returnMap.put("returnURI", convertURI[1]);
		return returnMap;
	}
	
}

