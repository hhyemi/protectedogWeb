package org.protectedog.web.message;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Message;
import org.protectedog.service.domain.User;
import org.protectedog.service.message.MessageService;
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
@RequestMapping("/message/*")
public class MessageController {

	///Field
	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageService messageService;
	
	///Constructor
	public MessageController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	///Paging을 위한 Value설정
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	///Method
	@RequestMapping(value="addMessage", method=RequestMethod.GET)
	public String addMessage() throws Exception{
		
		System.out.println("/message/addMessage : GET");

		return "redirect:/message/addMessageView.jsp";
		
	}
	
	
	@RequestMapping(value="addMessage", method=RequestMethod.POST)
	public String addMessage(@ModelAttribute("message") Message message,
							 @RequestParam("senderId") String senderId) throws Exception{
		
		System.out.println("/message/addMessage : POST");
		
		messageService.addMessage(message);
		
		System.out.println("message : "+message);
		System.out.println("sender? : "+senderId);
		
		return "/message/listSendMessage?senderId="+senderId;
//		return "redirect:/index.jsp";
		
	}
	
	@RequestMapping(value="getMessage")
	public String getMessage(@RequestParam("messageNo") int messageNo, Model model) throws Exception{
		
		System.out.println("/message/getMessage");
		
		Message message=messageService.getMessage(messageNo);
		message.setMessageStatus("1");
		messageService.updateMessage(message);
		
		model.addAttribute("message", message);
		
		return "forward:/message/getMessageView.jsp";
		
	}
	
	@RequestMapping(value="listSendMessage")
	public String listSendMessage(@ModelAttribute("search") Search search,
								 HttpServletRequest request, 
								Model model) throws Exception{
		
		System.out.println("/message/listSendMessage");
		
		//페이지 관련
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println("sendMessage : "+search.toString());
		
		//조건검색을 위한 senderId값 추출
		User user=(User)request.getSession().getAttribute("user");
		String senderId=user.getId();
		System.out.println("sendMessage : "+user);
		System.out.println("sendMessage : "+senderId);
		
		//DB 데이터 리스트 뽑아오기
		Map<String, Object> map=messageService.getSendMessageList(search, senderId);
		System.out.println("Message 리스트 : "+map.toString());
		
		Page resultPage=new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("Message 리스트페이지 : "+resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("senderId", senderId);
		
		return "forward:/message/listSendMessageView.jsp";
		
	}
	
	@RequestMapping(value="listReceiveMessage")
	public String listReceiveMessage(@ModelAttribute("search") Search search,
									 HttpServletRequest request,
									 Model model) throws Exception{
		System.out.println("/message/listReceiveMessage");
		
		//페이지 관련
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//조건검색을 위한 senderId값 추출
		User user=(User)request.getSession().getAttribute("user");
		String receiveId=user.getId();
		
		//DB 데이터 리스트 뽑아오기
		Map<String, Object> map=messageService.getReceiveMessageList(search, receiveId);
		System.out.println("Message 리스트 : "+map.toString());
		
		Page resultPage=new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("Message 리스트페이지 : "+resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("receiveId", receiveId);
		
		return "forward:/message/listReceiveMessageView.jsp";
	}
	
}
