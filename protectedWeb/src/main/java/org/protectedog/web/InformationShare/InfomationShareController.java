package org.protectedog.web.InformationShare;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.board.BoardService;
import org.protectedog.service.comment.CommentService;
import org.protectedog.service.domain.Board;
import org.protectedog.service.domain.Comment;
import org.protectedog.service.domain.Funding;
import org.protectedog.service.recomment.ReCommentService;
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
@RequestMapping("/info/*")
public class InfomationShareController {

	/// Field
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	@Autowired
	@Qualifier("reCommentServiceImpl")
	private ReCommentService reCommentService;

	public InfomationShareController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['info']}")
	String boardCode;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;


	@RequestMapping(value = "addInformation")
	public String addInfo(@ModelAttribute("board") Board board, HttpSession session, HttpServletRequest request)
			throws Exception {

		System.out.println(" ============================== addInfo ==================================");

		board.setBoardCode(boardCode);
		board.setId("user02");
		board.setNickName("호랭이");

		System.out.println(" info Board : " + board);

		boardService.addBoard(board);

		return "redirect:/info/getInfo?postNo="+board.getPostNo();
	}

	@RequestMapping(value = "listInfo")
	public String listInfo(@ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception {

		System.out.println(" ============================== listInfo ==================================");
		
		int order;
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		// 페이지 사이즈
		if(request.getParameter("pageSize") == null) {
			search.setPageSize(pageSize);
		} else {
			System.out.println("listInfo pageSize : " + request.getParameter("pageSize") );
			search.setPageSize(Integer.parseInt(request.getParameter("pageSize")));
		}
		
		if(request.getParameter("order") == null) {
			order = 0 ;
		} else {
			order = Integer.parseInt(request.getParameter("order"));
			System.out.println(" listInfo order : " + order);
		}
		

		System.out.println(" listInfo searchKeyword " + search.getSearchKeyword());
		System.out.println(" listInfo search : " + search);

		// 게시글 목록 조회
		Map<String, Object> map = boardService.listBoard(search, boardCode, order);
		
		List<Board> list = boardService.listBoardRankingSearch(boardCode);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, search.getPageSize());
		System.out.println(resultPage);

		System.out.println(" listInfo map.get('list') :: "  + map.get("list"));

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("listRanking", list);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/community/listInfo.jsp";
	}

	@RequestMapping(value = "getInfo", method = RequestMethod.GET)
	public String getInfo(@RequestParam("postNo") int postNo, @ModelAttribute("search") Search search, Model model) throws Exception {
		
		System.out.println(" ============================== getInfo ==================================");
		
		// 첫 페이지 1로 고정
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		// 댓글 페이지 사이즈 5로 고정
		search.setPageSize(5);
		// Search 디버깅
		System.out.println(" listInfo search : " + search);
				
		// 게시글 불러오기
		Board board = boardService.getBoard(postNo);
		
		// 조회수 증가
		boardService.updateViewCount(board);
		
		// 댓글 불러오기
		Map<String, Object> map = commentService.listComment(postNo, search);
		// 대댓글 불러오기
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("postNo",postNo);
		searchMap.put("startRowNum",search.getStartRowNum());
		searchMap.put("endRowNum",search.getEndRowNum());
		Map<String, Object> reCommmetMap = reCommentService.listReComment(searchMap);

		// 페이징 
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		// 페이지 디버깅
		System.out.println(resultPage);
		
		// 게시글 디버깅
		System.out.println(" getInfo board : " + board);
		
		// 댓글 디버깅
		System.out.println(" getInfo listComment : " +map.get("list"));
		System.out.println(" getInfo listReComment : " +reCommmetMap.get("list"));
		System.out.println(" getInfo totalCount : " +map.get("totalCount"));
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("relist", reCommmetMap.get("list"));
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("board", board);
		
		return "forward:/community/getInfo.jsp";
	}
	
	@RequestMapping(value = "updateView")
	public String updateView(@RequestParam("postNo") int postNo, Model model) throws Exception {		
		
		System.out.println(" ============================== updateView ==================================");
		
		Board board = boardService.getBoard(postNo);
		
		model.addAttribute("board", board);
		
		return "forward:/community/updateInfo.jsp";
	}
	
	@RequestMapping(value = "updateInfo")
	public String updateInfo(@ModelAttribute("board") Board board, HttpServletRequest request, Model model) throws Exception {
		
		System.out.println(" ============================== updateInfo ==================================");
		
		board.setBoardCode(boardCode);
		board.setId("user02");
		board.setNickName("호랭이");
		
		boardService.updateBoard(board);
		
		model.addAttribute("board", board);
		return "redirect:/info/getInfo?postNo="+board.getPostNo();
	}
	
	@RequestMapping(value = "delInfo")
	public String delInfo(@ModelAttribute("board") Board board, HttpSession session) throws Exception {
		
		System.out.println(" ============================== delInfo ==================================");
	
		System.out.println(" delInfo : " + board );
		
		boardService.delBoard(board);
		
		return "redirect:/info/listInfo";
	}
	

}
