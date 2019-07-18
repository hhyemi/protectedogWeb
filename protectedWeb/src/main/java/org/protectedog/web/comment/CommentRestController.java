package org.protectedog.web.comment;

import javax.servlet.http.HttpSession;

import org.protectedog.service.comment.CommentService;
import org.protectedog.service.domain.Comment;
import org.protectedog.service.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/comment/*")
public class CommentRestController {

	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	@Value("#{commonProperties['info']}")
	String boardCode;
	
	public CommentRestController() {
		System.out.println("commentRestController Defualt Constructor");
	}

	@RequestMapping("json/getComment/{commentNo}")
	public Comment updateCommentView(@PathVariable("commentNo") int commentNo) throws Exception {

		System.out.println(" ============================== rest getComment ==================================");

		Comment comment = commentService.getComment(commentNo);

		return comment;
	}
	
	@RequestMapping( value="json/updateComment/", method=RequestMethod.POST)
	public Comment updateComment(@RequestBody Comment comment, HttpSession session) throws Exception {

		System.out.println(" ============================== rest updateComment ==================================");
		
		User user = (User)session.getAttribute("user");
		
		comment.setId(user.getId());
		comment.setNickName(user.getNickname());
		comment.setBoardCode(boardCode);
		
		System.out.println(" comment : " + comment );
		commentService.updateComment(comment);
		
		comment = commentService.getComment(comment.getCommentNo());

		return comment;
	}
	
	@RequestMapping( value="json/delComment/{commentNo}", method=RequestMethod.POST)
	public int updateComment(@PathVariable int commentNo) throws Exception {

		System.out.println(" ============================== rest delComment ==================================");
		
		commentService.delComment(commentNo);
		
		return commentNo;
	}

}
