package org.protectedog.web.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.protectedog.common.Search;
import org.protectedog.service.comment.CommentService;
import org.protectedog.service.domain.Comment;
import org.protectedog.service.domain.Interest;
import org.protectedog.service.domain.User;
import org.protectedog.service.interest.InterestService;
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
	
//	@Autowired
//	@Qualifier("reCommentServiceImpl")
//	private ReCommentService reCommentService;
	
	@Autowired
	@Qualifier("interestServiceImpl")
	private InterestService interestService;
	
//	@Value("#{commonProperties['info']}")
//	String boardCode;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	
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
		comment.setProfile(user.getProfile());
		
		// Set Code

		//comment.setBoardCode(boardCode);
		commentService.addComment(comment);
		
		comment = commentService.getComment(comment.getCommentNo(), comment.getBoardCode());
		
		return comment;
	}
	
	@RequestMapping("json/getComment/{commentNo}/{boardCode}")
	public Comment getComment(@PathVariable("commentNo") int commentNo, @PathVariable("boardCode") String boardCode) throws Exception {

		System.out.println(" ============================== rest getComment ==================================");

		Comment comment = commentService.getComment(commentNo, boardCode);

		return comment;
	}
	
	@RequestMapping( value="json/updateComment/", method=RequestMethod.POST)
	public Comment updateComment(@RequestBody Comment comment, HttpSession session) throws Exception {

		System.out.println(" ============================== rest updateComment ==================================");
		
		User user = (User)session.getAttribute("user");
		
		comment.setId(user.getId());
		comment.setNickName(user.getNickname());
		//comment.setBoardCode(boardCode);
		
		System.out.println(" comment : " + comment );
		
		commentService.updateComment(comment);
		
		comment = commentService.getComment(comment.getCommentNo(), comment.getBoardCode());
		
		return comment;
	}
	
	@RequestMapping( value="json/delComment/{commentNo}/{boardCode}", method=RequestMethod.POST)
	public int delComment(@PathVariable("commentNo") int commentNo, @PathVariable("boardCode") String boardCode) throws Exception {

		System.out.println(" ============================== rest delComment ==================================");
		
		System.out.println(" commentNo : " + commentNo );
		System.out.println(" boardCode : " + boardCode );
		
		commentService.delComment(commentNo, boardCode);
		
		return commentNo;
	}
	
	
	@RequestMapping( value="json/updateLikeCnt/{commentNo}/{check}/{boardCode}", method=RequestMethod.POST)
	public Comment updateLikeCnt(@PathVariable("commentNo") int commentNo,@PathVariable("boardCode") String boardCode, @PathVariable("check") String check, HttpSession session) throws Exception {

		System.out.println(" ============================== rest updateLikeCnt ==================================");
		
		System.out.println("commentNo : " + commentNo);
		System.out.println("check : " + check);
		
		User user = (User) session.getAttribute("user");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("commentNo", commentNo);
		map.put("boardCode", boardCode);
		
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
		interest.setInterestId(user);

		interestService.addInterest(interest);
		
		comment = commentService.getComment(commentNo, boardCode);
		
		return comment;
	}
	
	@RequestMapping( value="json/check/{commentNo}/{id}/{boardCode}", method=RequestMethod.POST)
	public int check(@PathVariable("commentNo") int commentNo, @PathVariable("boardCode") String boardCode,@PathVariable("id") String checkId) throws Exception {

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
	
	@RequestMapping( value="json/listComment/{postNo}/{currentPage}/{boardCode}", method=RequestMethod.POST)
	public Map<String, Object> listComment(@PathVariable("postNo") int postNo, @ModelAttribute("search") Search search, @PathVariable("currentPage") int currentPage, @PathVariable("boardCode") String boardCode) throws Exception {
		
		System.out.println(" ============================== rest listComment ==================================");
		
		if ( search.getCurrentPage() == 0 ) {
			search.setCurrentPage(1);
		}
		// pageSize 5 고정
		search.setPageSize(5);
		
		System.out.println("search.getCommentEndRowNum : " + search.getCommentEndRowNum());
		
		// Comment Paging Map ��ü ����
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("postNo",postNo);
//		map.put("commentEndRowNum",search.getCommentEndRowNum());
//		map.put("startRowNum", search.getStartRowNum());
//		map.put("endRowNum", search.getEndRowNum());
		
		// �����
		System.out.println("postNo :" + postNo);
		
		// ������ �������� BL ����
		Map<String, Object> commentMap = commentService.listComment(postNo, search, boardCode);
		int totalCount = commentService.getTotalCount(postNo,boardCode);
		//Map<String, Object> reMap = reCommentService.listReComment(map);
		
		// return�� Map ��ü�� put
		//map.put("reList", reMap.get("list"));
		map.put("list", commentMap.get("list"));
		map.put("totalCount", totalCount);
		map.put("search",search);
		
		return map;
	}
}
