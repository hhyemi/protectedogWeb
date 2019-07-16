package org.protectedog.web.adoptreview;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.protectedog.service.board.BoardService;
import org.protectedog.service.domain.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;




//==> 판매관리 Controller
@Controller
@RequestMapping("/adoptreview/*")
public class AdoptReviewController {
	
	///Field
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	//setter Method 구현 않음
	
//	@Resource(name = "uploadPath")
//	private String uploadPath;

	
	public AdoptReviewController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	

	
	
	
	@RequestMapping( value="addAdoptReview", method=RequestMethod.GET )
	public String addAdoptReview( ) throws Exception {

		System.out.println("/adoptreview/addBoard : GET");

		return "forward:/adoptreview/addAdoptReview.jsp";
	}
	

	
	
	@RequestMapping( value="addAdoptReview", method=RequestMethod.POST )
	public String addAdoptReview(  @ModelAttribute("board") Board board
//											,MultipartHttpServletRequest mtfRequest
											) throws Exception {

		System.out.println("/adoptreview/addAdoptReview : POST");

		//Business Logic
//		product.setFileName(UploadFile.saveFile(mtfRequest.getFile("file"),uploadPath));
//		System.out.println("파일확인 : "+product.getFileName());
		boardService.addBoard(board);
		
		return "forward:/adoptreview/getAdoptReview.jsp";
	}
	
	
	
	// board 글 상세조회+조회수 증가
	@RequestMapping( value="getAdoptReview", method=RequestMethod.GET)
	public String getAdoptReview( @RequestParam("postNo") int postNo , Model model) throws Exception {
		
		System.out.println("/adoptreview/getAdoptReview : GET");
		
		//Business Logic
		Board board = boardService.getBoard(postNo);
		board.setRecommendCount(board.getRecommendCount()+1);
		boardService.updateViewCount(board);
		// Model 과 View 연결
		model.addAttribute("board", board);	
//		System.out.println("파일이름 확인 : "+product.getFileName());
	

		return "forward:/adoptreview/getAdoptReview.jsp";
	}
	
	
	
	
	@RequestMapping( value="updateAdoptReview", method=RequestMethod.GET)
	public String updateAdoptReview( @RequestParam("postNo") int postNo , Model model) throws Exception{

		System.out.println("/adoptreview/updateAdoptReview : GET");
		//Business Logic
		Board board = boardService.getBoard(postNo);
		// Model 과 View 연결
		model.addAttribute("board", board);
		System.out.println("============================================\n"+board);
		

		return "forward:/adoptreview/updateAdoptReview.jsp";
	}
	
	
	
	
	@RequestMapping( value="updateAdoptReview" , method=RequestMethod.POST)
	public String updateAdoptReview( @ModelAttribute("board") Board board, Model model
//								,MultipartHttpServletRequest mtfRequest
												) throws Exception{

		System.out.println("/adoptreview/updateAdoptReview : POST");
		//Business Logic
//		adopt.setFileName(UploadFile.saveFile(mtfRequest.getFile("file"),uploadPath));
//		boolean fileName = adopt.getFileName().endsWith("_");

//		if ( fileName ) {
//			adopt.setFileName((adoptService.getAdopt(adopt.getPostNo())).getFileName());
//		}
		
		boardService.updateBoard(board);
		board = boardService.getBoard(board.getPostNo());
		
		model.addAttribute("board", board);
		

		return "forward:/adoptreview/getAdoptReview.jsp?postNo="+board.getPostNo();
	}
	
	
	@RequestMapping( value="listAdoptReview" )
	public String listAdoptReview(
			//			@ModelAttribute("search") Search search,
//														@RequestParam("menu") String menu  ,
														Model model ) throws Exception{
		
		System.out.println("/adoptreview/listAdoptReview : GET / POST");
		
//		if(search.getCurrentPage() ==0 ){
//			search.setCurrentPage(1);
//		}
		
//		search.setPageSize(pageSize);
//		System.out.println("■■■■■ 검색어 확인 : "+search.getSearchKeyword());
//		System.out.println("■■■■■ 확인 : "+search);
		
		// Business logic 수행
//		Map<String , Object> map=adoptService.listAdopt(search);
//		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
			
//		System.out.println("확인                                 :  "+map);
//		System.out.println("확인     222                            :  "+map.get("list"));
		
		// Model 과 View 연결
//		model.addAttribute("list", map.get("list"));
//		model.addAttribute("resultPage", resultPage);
//		model.addAttribute("search", search);
		

		return "forward:/adoptreview/listAdoptReview.jsp";
	}
	
}