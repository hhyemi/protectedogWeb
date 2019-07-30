package org.protectedog.web.InformationShare;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.protectedog.service.board.BoardService;
import org.protectedog.service.domain.Board;
import org.protectedog.service.domain.Interest;
import org.protectedog.service.domain.User;
import org.protectedog.service.interest.InterestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/info/*")
public class InformationShareRestController {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("interestServiceImpl")
	private InterestService interestService;
	
	@Value("#{commonProperties['info']}")
	String boardCode;
	
	public InformationShareRestController() {
		System.out.println("InformationShareRestController Defualt Constructor");
	}
	
	@RequestMapping( value="json/updateRecommandCnt/{postNo}", method=RequestMethod.POST)
	public Board updateRecommandCnt(@PathVariable("postNo") int postNo, HttpSession session) throws Exception {

		System.out.println(" ============================== rest updateRecommandCnt ==================================");
		
		System.out.println("postNo : " + postNo);
		
		User user = (User) session.getAttribute("user");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("postNo", postNo);
				
		Board board = new Board();
		board.setPostNo(postNo);
		
		boardService.updateRecommendCount(board);
		
		Interest interest = new Interest();
		interest.setBoardCode(boardCode);
		interest.setInterestPost(board);
		interest.setInterestId(user);

		interestService.addInterest(interest);
		
		board = boardService.getBoard(postNo);
		
		return board;
	}
	
	
	@RequestMapping( value="json/check/{postNo}/{id}", method=RequestMethod.POST)
	public int check(@PathVariable("postNo") int commentNo, @PathVariable("id") String checkId) throws Exception {

		System.out.println(" ============================== rest updateLikeCnt ==================================");
		
		System.out.println("commentNo : " + commentNo);
		System.out.println("id : " + checkId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id",checkId);
		map.put("searchNo",commentNo);
		map.put("searchType","post");
		map.put("boardCode",boardCode);
		
		int result = interestService.getInterestCheck(map);
		
		return result;
	}
}
