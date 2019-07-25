package org.protectedog.web.comment;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.protectedog.service.comment.CommentService;
import org.protectedog.service.domain.Comment;
import org.protectedog.service.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/comment/*")
public class CommentController {

	/// Field
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	public CommentController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['info']}")
	String boardCode;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;


	@RequestMapping(value = "addComment", method = RequestMethod.POST)
	public String addComment(@ModelAttribute("comment") Comment comment, HttpSession session, HttpServletRequest request) throws Exception {

		System.out.println(" ============================== addComment ==================================");
		
		System.out.println(" commentContent : " + comment.getCommentContent());
		
		User user = (User) session.getAttribute("user");
		comment.setId(user.getId());
		comment.setNickName(user.getNickname());
		comment.setBoardCode(boardCode);
	
		int postNo = Integer.parseInt( request.getParameter("postNo") ) ; 
		comment.setPostNo( postNo );
		
		System.out.println(" addComment : " + comment);

		commentService.addComment(comment);

		return "redirect:/info/getInfo?postNo="+postNo ;
	}
		
}
