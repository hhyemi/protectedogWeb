package org.protectedog.web.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.protectedog.common.Search;
import org.protectedog.service.comment.CommentService;
import org.protectedog.service.domain.Comment;
import org.protectedog.service.domain.Interest;
import org.protectedog.service.domain.ReComment;
import org.protectedog.service.domain.User;
import org.protectedog.service.interest.InterestService;
import org.protectedog.service.recomment.ReCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@Autowired
	@Qualifier("reCommentServiceImpl")
	private ReCommentService reCommentService;
	
	@Autowired
	@Qualifier("interestServiceImpl")
	private InterestService interestService;
	
	@Value("#{commonProperties['info']}")
	String boardCode;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	public CommentRestController() {
		System.out.println("commentRestController Defualt Constructor");
	}

	@RequestMapping(value="json/addComment/", method=RequestMethod.POST)
	public Comment addComment(@RequestBody Comment comment, HttpSession session) throws Exception {

		System.out.println(" ============================== rest addComment ==================================");

		User user = (User) session.getAttribute("user");
		
		// Set User
		comment.setId(user.getId());
		comment.setNickName(user.getNickname());
		comment.setBoardCode(boardCode);

		commentService.addComment(comment);
		
		comment = commentService.getComment(comment.getCommentNo());
		
		return comment;
	}
	
	@RequestMapping("json/getComment/{commentNo}")
	public Comment getCommentView(@PathVariable("commentNo") int commentNo) throws Exception {

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
	
	
	@RequestMapping( value="json/updateLikeCnt/{commentNo}/{check}", method=RequestMethod.POST)
	public Comment updateLikeCnt(@PathVariable("commentNo") int commentNo, @PathVariable("check") String check, HttpSession session) throws Exception {

		System.out.println(" ============================== rest updateLikeCnt ==================================");
		
		System.out.println("commentNo : " + commentNo);
		System.out.println("check : " + check);
		
		User user = (User) session.getAttribute("user");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("commentNo", commentNo);
		
		if(check.equals("plus")) {
			map.put("check", check);
		} else {
			map.put("check", check);
		}

		commentService.updateLikeCnt(map);
		
		Comment comment = new Comment();
		comment.setCommentNo(commentNo);
		
		Interest interest = new Interest();
		interest.setBoardCode(boardCode);
		interest.setInterestComment(comment);
		interest.setinterestId(user);

		interestService.addInterest(interest);
		
		comment = commentService.getComment(commentNo);
		
		return comment;
	}
	
	@RequestMapping( value="json/check/{commentNo}/{id}", method=RequestMethod.POST)
	public int check(@PathVariable("commentNo") int commentNo, @PathVariable("id") String checkId) throws Exception {

		System.out.println(" ============================== rest updateLikeCnt ==================================");
		
		System.out.println("commentNo : " + commentNo);
		System.out.println("id : " + checkId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id",checkId);
		map.put("searchNo",commentNo);
		map.put("searchType","comment");
		map.put("boardCode",boardCode);
		
		int result = interestService.getInterestCheck(map);
		
		return result;
	}
	
	@RequestMapping( value="json/listComment/{postNo}/{pageSize}", method=RequestMethod.POST)
	public Map<String, Object> listComment(@PathVariable("postNo") int postNo, @ModelAttribute("search") Search search, @PathVariable("pageSize") int pageSize) throws Exception {
		
		System.out.println(" ============================== rest listComment ==================================");
		
		if ( search.getCurrentPage() == 0 ) {
			search.setCurrentPage(1);
		}
		// pageSize 확인
		System.out.println("pageSize : " + pageSize);
		search.setPageSize(pageSize);
		System.out.println("search.getCommentEndRowNum : " + search.getCommentEndRowNum());
		
		// Comment Paging Map 객체 생성
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postNo",postNo);
		map.put("commentEndRowNum",search.getCommentEndRowNum());
		map.put("startRowNum", search.getStartRowNum());
		map.put("endRowNum", search.getEndRowNum());
		
		// 디버깅
		System.out.println("postNo :" + postNo);
		
		// 데이터 가져오는 BL 수행
		List<Comment> list = commentService.listCommentMoreView(map);
		int totalCount = commentService.getTotalCount(postNo);
		Map<String, Object> reMap = reCommentService.listReComment(map);
		
		
		// return할 Map 객체에 put
		map.put("reList", reMap.get("list"));
		map.put("list", list);
		map.put("totalCount", totalCount);
		map.put("search",search);
		
		return map;
	}
}
