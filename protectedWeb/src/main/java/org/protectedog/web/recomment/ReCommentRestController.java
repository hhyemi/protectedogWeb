package org.protectedog.web.recomment;

import javax.servlet.http.HttpSession;

import org.protectedog.service.comment.CommentService;
import org.protectedog.service.domain.Comment;
import org.protectedog.service.domain.ReComment;
import org.protectedog.service.domain.User;
import org.protectedog.service.interest.InterestService;
import org.protectedog.service.recomment.ReCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/recomment/*")
public class ReCommentRestController {

	@Autowired
	@Qualifier("reCommentServiceImpl")
	private ReCommentService reCommentService;

	@Autowired
	@Qualifier("interestServiceImpl")
	private InterestService interestService;

	@Value("#{commonProperties['info']}")
	String boardCode;

	public ReCommentRestController() {
		System.out.println("ReCommentRestController Defualt Constructor");
	}

	@RequestMapping(value = "json/addReComment/", method = RequestMethod.POST)
	public ReComment addComment(@RequestBody ReComment reComment ,HttpSession session) throws Exception {

		System.out.println(" ============================== rest addComment ==================================");

		User user = (User) session.getAttribute("user");
		

		// Set User
		reComment.setId(user.getId());
		reComment.setNickName(user.getNickname());
		
		System.out.println(" reComment : " + reComment);
		
		reCommentService.addReComment(reComment);

		reComment = reCommentService.getReComment(reComment.getRecommentNo());

		return reComment;
	}
}
