package org.protectedog.web.user;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.protectedog.service.domain.User;
import org.protectedog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/users/*")
public class UserController {

	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	///Constructor
	public UserController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	///Paging을 위한 Value설정
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	///Method
	@RequestMapping(value="kakao", method=RequestMethod.GET)
	public String kakao(@RequestParam("kakao") String kakao, HttpServletRequest request, HttpSession session) throws Exception{
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("kakao", kakao);
		
		User user=userService.getSocial(map);
		if(user==null) {
			request.setAttribute("kakao", kakao);
			return "forward:/users/addUsersBaseView.jsp";
		}else {
			session.setAttribute("user", user);
			return "redirect:/";
		}
		
	}
	
	@RequestMapping(value="addUsersBase", method=RequestMethod.GET)
	public String addUsersBase() throws Exception{
		
		System.out.println("/users/addUsersBase : GET");
		
		return "redirect:/users/addUsersBaseView.jsp";
	}
	
	@RequestMapping(value="addUsersBase", method=RequestMethod.POST)
	public String addUsersBase(@ModelAttribute("user") User user) throws Exception{
		
		System.out.println("/users/addUsersBase : POST");
		
		userService.addUsersBase(user);
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="addUsersBase2", method=RequestMethod.POST)
	public String addUsersBase2(@ModelAttribute("user") User user, HttpSession Session) throws Exception{
		
		System.out.println("/users/addUsersBase2 : POST");
		
		userService.addUsersBase(user);
		
		Session.setAttribute("user", user);
		
		return "redirect:/users/addUsersAdditionalView.jsp";
	}
	
	@RequestMapping(value="addUsersAdditional", method=RequestMethod.GET)
	public String addUsersAdditional() throws Exception{
		
		System.out.println("/users/addUsersAddtional : GET");
		
		return "redirect:/users/addUsersAdditionalView.jsp";
	}
	
	@RequestMapping(value="addUsersAdditional", method=RequestMethod.POST)
	public String addUsersAddtional(@ModelAttribute("user") User user, @RequestParam("id") String id, HttpSession session) throws Exception{
		
		System.out.println("/users/addUsersAdditional");
		
		String sessionId=((User)session.getAttribute("user")).getId();
		if(sessionId.equals(user.getId())) {
			session.setAttribute("user", user);
		}
		
		userService.addUsersAdditional(user);
		
		return "redirect:/users/loginView.jsp";
	}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() throws Exception{
		
		System.out.println("/users/login : GET");
		
		return "redirect:/users/loginView.jsp";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, 
						HttpSession session, 
						HttpServletRequest request) throws Exception{
		
		System.out.println("/users/login : POST");
		
		User dbUser=userService.getUsers(user.getId());
		
		String ip=request.getHeader("X-FORWARDED-FOR");
		
		if(ip==null || ip.length()==0) {
			ip=request.getHeader("Proxy-Client-IP");
		}
		if(ip==null || ip.length()==0) {
			ip=request.getHeader("WL-Proxy-Client-IP");
		}
		if(ip==null || ip.length()==0) {
			ip=request.getRemoteAddr();
		}
		
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String accessTime=format.format(System.currentTimeMillis());
		
		System.out.println("접속IP? : "+ip);
		System.out.println("접속시간? : "+accessTime);
		System.out.println("aaa : "+user.getPw());
		System.out.println("bbb : "+dbUser.getPw());
		
		boolean check;
		
		if(user.getPw().equals(dbUser.getPw())) {
			check=true;
			session.setAttribute("user", dbUser);
			request.setAttribute("check", check);
			System.out.println(check);
			System.out.println("session : "+dbUser);
			System.out.println(session.getAttribute("user"));
		}else {
			check=false;
			System.out.println("ERROR");
			request.setAttribute("check", check);
			System.out.println(check);
			return "forward:/users/loginView.jsp";
		}
		
		System.out.println("ANG : "+session.getAttribute("user"));
		

		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		System.out.println("/users/logout : GET");
		
		System.out.println("logout session : ");
		
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="getUsers", method=RequestMethod.GET)
	public String getUsers(@RequestParam("id") String id, Model model) throws Exception{
		
		System.out.println("/users/getUsers");
		
		User user=userService.getUsers(id);
		
		model.addAttribute("user", user);
		
		return "forward:/users/getUsersView.jsp";
		
	}
	
	@RequestMapping(value="updateUsers", method=RequestMethod.GET)
	public String updateUsers(@RequestParam("id") String id, Model model) throws Exception{
		
		System.out.println("/users/updateUsers : GET");
		
		User user=userService.getUsers(id);
		
		model.addAttribute(user);
		
		return "forward:/users/updateUsersView.jsp";
		
	}
	
	@RequestMapping(value="updateUsers", method=RequestMethod.POST)
	public String updateUsers(@ModelAttribute("user") User user, Model model, HttpSession session) throws Exception{
		
		System.out.println("/users/updateUsers : POST");
		
		userService.updateUsers(user);
		
		String sessionId=((User)session.getAttribute("user")).getId();
		System.out.println("update : "+sessionId);
		
		if(sessionId.equals(user.getId())) {
			session.setAttribute("user", user);
		}
		
		return "redirect:/users/getUsers?id="+user.getId();
		
	}
	
}
