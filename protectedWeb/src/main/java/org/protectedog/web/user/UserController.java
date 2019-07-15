package org.protectedog.web.user;

import javax.servlet.http.HttpSession;

import org.protectedog.service.domain.User;
import org.protectedog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
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
	public String login(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		
		System.out.println("/users/login : POST");
		
		User dbUser=userService.getUsers(user.getId());
		
		if(user.getPw().equals(dbUser.getPw())) {
			session.setAttribute("user", dbUser);
			System.out.println("session : "+dbUser);
		}
		
		return "redirect:/index.jsp";
		
	}
	
}
