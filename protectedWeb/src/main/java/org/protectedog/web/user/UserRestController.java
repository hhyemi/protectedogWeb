package org.protectedog.web.user;

import java.util.HashMap;
import java.util.Map;

import org.protectedog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
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
	@RequestMapping( value="json/checkDuplication", method=RequestMethod.POST )
	public Map<String, Object> checkDuplication( @RequestBody Map<String, String> checkId) throws Exception{
		
		System.out.println("/users/json/checkDuplication : POST");
		//Business Logic
		String id=checkId.get("id");
		int result=userService.checkDuplication(id);

		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("result", new Integer(result));
		map.put("id", id);


		return map;
	}
	
}
