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
	
	///Paging�� ���� Value����
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
							 @RequestParam("senderNick") String senderNick) throws Exception{
		
		System.out.println("/message/addMessage : POST");
		
		messageService.addMessage(message);
		
		System.out.println("message : "+message);
		System.out.println("sender? : "+senderNick);
		
		return "redirect:/message/listMessage?searchCondition=send";
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
	
	@RequestMapping(value="updateMessage", method=RequestMethod.GET)
	public String updateMessage(@RequestParam("messageNo") int messageNo, Model model) throws Exception{
		
		System.out.println("/message/updateMessage : POST");
		
		Message message=messageService.getMessage(messageNo);
		message.setMessageStatus("2");
		messageService.updateMessage(message);
		
		model.addAttribute("message", message);
		
		return "forward:/message/listMessage?searchCondition=delete";
		
	}	

	
	@RequestMapping(value="listMessage")
	public String listMessage(@ModelAttribute("search") Search search,
									 HttpServletRequest request,
									 Model model) throws Exception{
		System.out.println("/message/listMessage");
		
		//������ ����
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		String searchCondition=search.getSearchCondition();
		System.out.println("listMessage 검색조건 : "+searchCondition);
		search.setSearchCondition(searchCondition);
		
		//���ǰ˻��� ���� senderId�� ����
		User user=(User)request.getSession().getAttribute("user");
		
		String nickname=user.getNickname();
		System.out.println("listMessage 검색조건 : "+nickname);
		
		//DB ������ ����Ʈ �̾ƿ���
		Map<String, Object> map=messageService.getMessageList(search, nickname);
		System.out.println("Message ����Ʈ : "+map.toString());
		
		Page resultPage=new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("Message ����Ʈ������ : "+resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("nickname", nickname);
		
//		return "forward:/message/listReceiveMessageView.jsp";
		return "forward:/message/listMessage.jsp";
	}
	
}
