package org.protectedog.web.interest;

import java.util.HashMap;
import java.util.Map;

import org.protectedog.service.domain.Board;
import org.protectedog.service.domain.Interest;
import org.protectedog.service.interest.InterestService;
import org.protectedog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

//==> 분양|실종관리 RestController
@RestController
@RequestMapping("/interest/*")
public class InterestRestController {

	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("interestServiceImpl")
	private InterestService interestService;
	

		
	public InterestRestController(){
		System.out.println(this.getClass());
	}
	

	// 관심목록 추가
	@RequestMapping( value="json/addInterest/{boardCode}/{postNo}/{id}", method=RequestMethod.GET)
	public String addInterest( @PathVariable("boardCode") String boardCode, 
											@PathVariable("postNo") int postNo , 
											@PathVariable("id") String id ) throws Exception{
		
		System.out.println("/interest/json/addInterest : GET");
		Board board = new Board();
		board.setPostNo(postNo);
		
		Interest interest = new Interest();
		interest.setBoardCode(boardCode);
		interest.setInterestId(userService.getUsers(id));
		interest.setInterestPost(board);
		
		interestService.addInterest(interest);
		
		return "{\"message\" : \"insertOK\" }";
	}
	
	
	// 관심목록삭제
	@RequestMapping( value="json/delInterest/{boardCode}/{postNo}/{id}", method=RequestMethod.GET)
	public String delInterest( @PathVariable("boardCode") String boardCode, 
											@PathVariable("postNo") int postNo , 
											@PathVariable("id") String id ) throws Exception{
		
		System.out.println("/interest/json/delInterest : GET");
		
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("boardCode", boardCode);
		map.put("searchType", "post");
		map.put("searchNo", postNo);
		
		interestService.delInterest(map);
		
		return "{\"message\" : \"delOK\" }";
	}

	
}