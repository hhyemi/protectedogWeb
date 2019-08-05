package org.protectedog.web.user;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	///Paging처리를 위한 Value 생성
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	///
	@Value("#{commonProperties['fileUser']}")
	String path;
	
	///Method
	@RequestMapping(value="kakao", method=RequestMethod.GET)
	public String kakao(@RequestParam("kakao") String kakao, HttpServletRequest request, HttpSession session) throws Exception{
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("kakao", kakao);
		
		User user=userService.getKakao(map);
		if(user==null) {
			request.setAttribute("kakao", kakao);
			return "forward:/users/addUsersBase.jsp";
		}else {
			session.setAttribute("user", user);
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="google", method=RequestMethod.GET)
	public String google(@RequestParam("google") String google, 
						@RequestParam("idToken") String idToken, 
//						Model model, 
						HttpServletRequest request, 
						HttpSession session) throws Exception{

		Map<String, Object> map=new HashMap<String, Object>();
		map.put("google", google);
		
		User user=userService.getGoogle(map);
		if(user==null) {
			request.setAttribute("google", google);
			return "forward:/users/addUsersBase.jsp";
		}else {
			session.setAttribute("user", user);
//			request.setAttribute("idToken", idToken);
//			model.addAttribute("idToken", idToken);
			session.setAttribute("idToken", idToken);
			System.out.println("login : "+idToken);
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="naver", method=RequestMethod.GET)
	public String naver(@RequestParam("naver") String naver, HttpServletRequest request, HttpSession session) throws Exception{
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("naver", naver);
		
		User user=userService.getNaver(map);
		if(user==null) {
			request.setAttribute("naver", naver);
			return "forward:/users/addUsersBase.jsp";
		}else {
			session.setAttribute("user", user);
			return "redirect:/";
		}
	}

	
	@RequestMapping(value="addUsersBase", method=RequestMethod.GET)
	public String addUsersBase() throws Exception{
		
		System.out.println("/users/addUsersBase : GET");
		
		return "redirect:/users/addUsersBase.jsp";
	}
	
	@RequestMapping(value="addUsersBase", method=RequestMethod.POST)
	public String addUsersBase(@ModelAttribute("user") User user, @RequestParam("purpose[]") ArrayList<Object> purpose, 
								@RequestParam("id") String id, HttpSession session) throws Exception{
		
		System.out.println("/users/addUsersBase : POST");
		
		System.out.println("addUsersBase purpose : "+purpose.get(0).toString());
		System.out.println("addUsersBase purpose : "+purpose.get(1).toString());
		System.out.println("addUsersBase purpose : "+purpose.get(2).toString());
		
		if(purpose.size() != 0) {
			user.setPurpose1((String)purpose.get(0));
			user.setPurpose2((String)purpose.get(1));
			user.setPurpose3((String)purpose.get(2));
			System.out.println("가입목적 : "+purpose.toString());
		}
		
//		String sessionId=((User)session.getAttribute("user")).getId();
//		System.out.println("세션1? : "+session.getAttribute("user"));
//		System.out.println(sessionId);
//		if(sessionId.equals(user.getId())) {
//			System.out.println("세션? : "+session.getAttribute("user"));
//			session.setAttribute("user", user);
//		}
		
		userService.addUsersBase(user);
		
		session.setAttribute("user", user);
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="addUsersBase2", method=RequestMethod.POST)
	public String addUsersBase2(@ModelAttribute("user") User user, HttpSession Session, @RequestParam("purpose[]") ArrayList<Object> purpose) throws Exception{
		
		System.out.println("/users/addUsersBase2 : POST");
		
		System.out.println("addUsersBase purpose : "+purpose.get(0).toString());
		System.out.println("addUsersBase purpose : "+purpose.get(1).toString());
		System.out.println("addUsersBase purpose : "+purpose.get(2).toString());
		
		if(purpose.size() != 0) {
			user.setPurpose1((String)purpose.get(0));
			user.setPurpose2((String)purpose.get(1));
			user.setPurpose3((String)purpose.get(2));
		}
		
		userService.addUsersBase(user);
		
		Session.setAttribute("user", user);
		
		return "redirect:/users/addUsersAddition.jsp";
	}
	
	@RequestMapping(value="addUsersAdditional", method=RequestMethod.GET)
	public String addUsersAdditional() throws Exception{
		
		System.out.println("/users/addUsersAddtional : GET");
		
		return "redirect:/users/addUsersAddition.jsp";
	}
	
	@RequestMapping(value="addUsersAdditional", method=RequestMethod.POST)
	public String addUsersAddtional(@ModelAttribute("user") User user, @RequestParam("id") String id, HttpSession session) throws Exception{
		
		System.out.println("/users/addUsersAdditional");
		
//		String sessionId=((User)session.getAttribute("user")).getId();
//		if(sessionId.equals(user.getId())) {
//			session.setAttribute("user", user);
//		}
		
		userService.addUsersAdditional(user);
		
		User sessionUser=(User)session.getAttribute("user");
		sessionUser.setEmail(user.getEmail());
		sessionUser.setPhone(user.getPhone());
		sessionUser.setUserAddr(user.getUserAddr());
		sessionUser.setBirthDate(user.getBirthDate());
		sessionUser.setGender(user.getGender());
		session.setAttribute("user", sessionUser);
		System.out.println(session.getAttribute("user"));
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() throws Exception{
		
		System.out.println("/users/login : GET");
		
		return "redirect:/users/login.jsp";
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
		
		System.out.println("현재 IP? : "+ip);
		System.out.println("현재 접속시간? : "+accessTime);
		System.out.println("aaa : "+user.getPw());
		System.out.println("bbb : "+dbUser.getPw());
		
		if(dbUser.getLevelPoint() < 0) {
			return "redirect:/";
		}
		
		if(user.getPw().equals(dbUser.getPw()) && user.getId().equals(dbUser.getId())) {
			String check="true";
			session.setAttribute("user", dbUser);
			request.setAttribute("check", check);
			System.out.println(check);
			System.out.println("session : "+dbUser);
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
		
		return "forward:/users/getUsers.jsp";
		
	}
	
	@RequestMapping(value="updateUsers", method=RequestMethod.GET)
	public String updateUsers(@RequestParam("id") String id, Model model) throws Exception{
		
		System.out.println("/users/updateUsers : GET");
		
		User user=userService.getUsers(id);
		
		model.addAttribute(user);
		
		return "forward:/users/updateUsersView.jsp";
		
	}
	
	@RequestMapping(value="updateUsers", method=RequestMethod.POST)
	public String updateUsers(@ModelAttribute("user") User user, 
								Model model, 
								HttpSession session, 
								@RequestParam("file") MultipartFile file) throws Exception{
		
		System.out.println("/users/updateUsers : POST");
		
		String savePath=path;
		
		String originalFile=file.getOriginalFilename();	
		
		System.out.println(file.isEmpty());
		
		if(!file.isEmpty()) {
			try {
				byte[] bytes=file.getBytes();
				BufferedOutputStream stream=new BufferedOutputStream(new FileOutputStream(new File(savePath, originalFile)));
				stream.write(bytes);
				stream.close();
				model.addAttribute("resultMSG", "업로드 성공");
			} catch(Exception e) {
				model.addAttribute("resultMSG", "업로드 실패");
			} 
		} else {
			model.addAttribute("resultMSG", "올바른 파일을 업로드하십시오.");
		}
	
		user.setProfile(originalFile);
		user.setId(((User)session.getAttribute("user")).getId());
		
		userService.updateUsers(user);
		
		String sessionId=((User)session.getAttribute("user")).getId();
		User dbUser=userService.getUsers(sessionId);
		System.out.println("update : "+sessionId);
		
		if(sessionId.equals(dbUser.getId())) {
			session.removeAttribute("user");
			session.setAttribute("user", dbUser);
		}
		
		return "redirect:/users/getUsers?id="+dbUser.getId();
		
	}
	
}











