package org.protectedog.web.adoptreview;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.board.BoardService;
import org.protectedog.service.domain.Adopt;
import org.protectedog.service.domain.Board;
import org.protectedog.service.domain.User;
import org.protectedog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;




//==> 분양리뷰관리 Controller
@Controller
@RequestMapping("/adoptReview/*")
public class AdoptReviewController {
	
	///Field
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	//setter Method 구현 않음
	
//	@Resource(name = "uploadPath")
//	private String uploadPath;

	
	public AdoptReviewController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['fundingPageSize']}")
	int pageSize;
	

	
	
	
	@RequestMapping( value="addAdoptReview", method=RequestMethod.GET )
	public String addAdoptReview( Model model, HttpSession session ) throws Exception {

		System.out.println("/adoptReview/addAdoptReview : GET");
		
//		System.out.println("세션확인 "+session.getAttribute("user") );
		if ( session.getAttribute("user") != null) {
			User user = userService.getUsers(((User)session.getAttribute("user")).getId()); 
			model.addAttribute("user", user);
		}

		return "forward:/adoptReview/addAdoptReview.jsp";
	}
	

	
	
	@RequestMapping( value="addAdoptReview", method=RequestMethod.POST )
	public String addAdoptReview(  @ModelAttribute("board") Board board
											,HttpSession session
//											,MultipartHttpServletRequest mtfRequest
											) throws Exception {

		System.out.println("/adoptReview/addAdoptReview : POST");

		//Business Logic
//		product.setFileName(UploadFile.saveFile(mtfRequest.getFile("file"),uploadPath));
//		System.out.println("파일확인 : "+product.getFileName());
		System.out.println("======================"+board);
		
		String thumnail;
		thumnail = board.getPostContent().substring(    board.getPostContent().indexOf("<img src=")+10,  (  board.getPostContent().substring   (   board.getPostContent().indexOf("<img src=")+10   ).indexOf("\"")  +  board.getPostContent().indexOf("<img src=")+10   )) ;
		
		board.setThumnail(thumnail);
		
		board.setId(((User)session.getAttribute("user")).getId());
		board.setNickName(((User)session.getAttribute("user")).getNickname());
		
		User user = userService.getUsers(board.getId());
		user.setLevelPoint(user.getLevelPoint()+5);
		userService.updateUsers(user);

//		String str = "바나나 : 1000원, 사과 : 2000원, 배 : 3000원";
//		String target = "사과";
//		int target_num = str.indexOf("사과"); 
//		String result; result = str.substring       (               str.indexOf("사과"),                    (   str.substring                 (          str.indexOf("사과")).indexOf("원")+str.indexOf("사과")    )         );

		
		boardService.addBoard(board);
//		boardService.getBoard(board.getPostNo());
//		System.out.println("=============="+board);
		
		return "redirect:/adoptReview/getAdoptReview?postNo="+board.getPostNo();
	}
	
	
	
	// board 글 상세조회+조회수 증가
	@RequestMapping( value="getAdoptReview")
	public String getAdoptReview( @RequestParam("postNo") int postNo , Model model, HttpSession session ) throws Exception {
		
		System.out.println("/adoptReview/getAdoptReview : GET");
		
		System.out.println("세션들어왔나 "+session.getAttribute("user") );
		if ( session.getAttribute("user") != null) {
			User user = userService.getUsers(((User)session.getAttribute("user")).getId()); 
			model.addAttribute("user", user);
		}
		System.out.println("------------1---------------"+postNo);
		System.out.println("-------------2--------------"+boardService.getBoard(postNo));
		//Business Logic
		boardService.updateViewCount(boardService.getBoard(postNo));
		System.out.println("==============================");
		Board board = boardService.getBoard(postNo);
		System.out.println("++++++++++++++++++++++++++++++");
		// Model 과 View 연결
		model.addAttribute("board", board);	
		System.out.println("###############################");

		return "forward:/adoptReview/getAdoptReview.jsp";
	}
	
	
	
	
	@RequestMapping( value="updateAdoptReview", method=RequestMethod.GET)
	public String updateAdoptReview( @RequestParam("postNo") int postNo , Model model) throws Exception{

		System.out.println("/adoptReview/updateAdoptReview : GET");
		//Business Logic
		Board board = boardService.getBoard(postNo);
		// Model 과 View 연결
		model.addAttribute("board", board);
		System.out.println("============================================\n"+board);
		

		return "forward:/adoptReview/updateAdoptReview.jsp";
	}
	
	
	
	
	@RequestMapping( value="updateAdoptReview" , method=RequestMethod.POST)
	public String updateAdoptReview( @ModelAttribute("board") Board board, Model model
//								,MultipartHttpServletRequest mtfRequest
												) throws Exception{

		System.out.println("/adoptReview/updateAdoptReview : POST");
		System.out.println("=============================="+board.getBoardCode()+","+board.getId()+","+board.getPostTitle());
		//Business Logic
//		adopt.setFileName(UploadFile.saveFile(mtfRequest.getFile("file"),uploadPath));
//		boolean fileName = adopt.getFileName().endsWith("_");

//		if ( fileName ) {
//			adopt.setFileName((adoptService.getAdopt(adopt.getPostNo())).getFileName());
//		}
		
		String thumnail;
		thumnail = board.getPostContent().substring(    board.getPostContent().indexOf("<img src=")+10,  (  board.getPostContent().substring   (   board.getPostContent().indexOf("<img src=")+10   ).indexOf("\"")  +  board.getPostContent().indexOf("<img src=")+10   )) ;
		
		board.setThumnail(thumnail);
		
		
		boardService.updateBoard(board);
		System.out.println("업데이트까지는 됨"+board.getPostNo());
//		board = boardService.getBoard(board.getPostNo());
		

		return "forward:/adoptReview/getAdoptReview?postNo="+board.getPostNo();
	}
	
	
	
	// 글 삭제
	@RequestMapping( value="delAdoptReview" , method=RequestMethod.GET)
	public String delAdoptReview(@RequestParam("postNo") int postNo ,
									@ModelAttribute("board") Board board ) throws Exception{
		
		System.out.println("/adoptReview/delAdoptReview : POST  "+board);

		boardService.delBoard(board);

		return "redirect:/adoptReview/listAdoptReview";
	}
	
		
		
	@RequestMapping( value="listAdoptReview" )
	public String listAdoptReview(
						@ModelAttribute("search") Search search,
//														@RequestParam("boardCode") String boardCode  ,
														Model model ) throws Exception{
		
		System.out.println("/adoptReview/listAdoptReview : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		System.out.println("■■■■■ 검색어 확인 : "+search.getSearchKeyword());
		System.out.println("■■■■■ 확인 : "+search);
		
		// Business logic 수행
		Map<String , Object> map=boardService.listBoard(search, "AR", 0 );
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
			
		System.out.println("확인                                 :  "+map);
		System.out.println("확인     222                            :  "+map.get("list"));
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/adoptReview/listAdoptReview.jsp";
	}
	
}