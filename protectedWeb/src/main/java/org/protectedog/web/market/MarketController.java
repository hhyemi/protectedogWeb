package org.protectedog.web.market;

import java.util.ArrayList;
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
import org.protectedog.service.domain.FileDog;
import org.protectedog.service.domain.Funding;
import org.protectedog.service.domain.User;
import org.protectedog.service.file.FileService;
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
@RequestMapping("/market/*")
public class MarketController {

	/// Field
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("fileServiceImpl")
	private FileService fileService;
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	


	// setter Method 구현 않음

	// ==> classpath:config/common.properties ,
	// classpath:config/commonservice.xml 참조 할것
	// ==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@Value("#{commonProperties['market']}")
	String MK;
	
	public MarketController() {
		System.out.println(this.getClass());
	}
	
	//상품글 등록
	@RequestMapping(value="addMarket")
	public String addProdQna(@ModelAttribute("board")Board board, HttpSession session, 
			HttpServletRequest request, @RequestParam("multiFile") ArrayList<String> multiFile, Model model) throws Exception {
		
		System.out.println("shop/market/addMarket : GET/POST");
		
		//board.setId("user01");
		//board.setNickName("스캇");
		//board.setProdNo(10001);
		//board.setPhone("011-1123-4567");
		
		board.setBoardCode(MK);
		board.setViewCount(0);
		//in thumnail
		board.setThumnail(multiFile.get(0));
		
		System.out.println("////////////////////");
		
		
		boardService.addBoard(board);
		
		System.out.println("Product GET : POST/");
		System.out.println(board);
		System.out.println("////////////////////");
		
		///파일업로드 시작/////////////////////////////////////////
		List<FileDog> listFile = new ArrayList<FileDog>();

		//다중파일 업로드
		for (String fileName : multiFile) {

			if (fileName != null && fileName.length() > 0) {

				FileDog files = new FileDog();
				//boardCode Market
				files.setBoardCode(MK);
				files.setFileName(fileName);
				files.setFileCode(0);
				files.setPostNo(board.getPostNo());
				listFile.add(files);
			}
		}
		
		fileService.addFile(listFile);
		model.addAttribute("board", board);
		
		
		return "forward:/shop/market/addMarket.jsp";
	}
	
	//상품리스트
	@RequestMapping( value="listMarket")
	public String listProdQna(@ModelAttribute("search") Search search, @ModelAttribute("board")Board board,
			HttpServletRequest request, 
			Model model, @RequestParam("order") int order) throws Exception {

		
		System.out.println("/listMarket GET / POST");
	
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		
		search.setPageSize(20);
		
		// Business logic 
		Map<String, Object> map = boardService.listBoard(search, MK, 1);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model 연결  View 

		System.out.println("/shop/Maket/listMarket ///////////////////////");
		System.out.println("/listMarket GET / POST");
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/shop/market/listMarket.jsp";
	}
	
	
	@RequestMapping(value ="getMarket", method=RequestMethod.GET)
	public String getProduct(@RequestParam("postNo") int postNo, @ModelAttribute("search") Search search, Model model) throws Exception {

		System.out.println("/product/getProduct : get");
		// Business Logic
		System.out.println(postNo);
		Board board = boardService.getBoard(postNo);
		// Model 연결 View 
		model.addAttribute("board", board);
		
		//조회수
		boardService.updateViewCount(board);
		
	
		Map<String, Object> filePost = new HashMap<String, Object>();
				filePost.put("boardCode", MK);
				filePost.put("postNo", postNo);
				List<FileDog> file = fileService.getFile(filePost);

		model.addAttribute("file", file);
		model.addAttribute("board", board);

		return "forward:/shop/market/getMarket.jsp";
		
	}
		@RequestMapping(value = "updateMarket", method = RequestMethod.GET)
		public String updateMarket(@RequestParam("postNo") int postNo, Model model) throws Exception {

			System.out.println("updateMaket : GET");
			// Business Logic
			
			System.out.println(postNo);
			
			Board board = boardService.getBoard(postNo);

			Map<String, Object> filePost = new HashMap<String, Object>();
			filePost.put("boardCode", MK);
			filePost.put("postNo", postNo);
			List<FileDog> file = fileService.getFile(filePost);

			model.addAttribute("board", board);
			model.addAttribute("file", file);
			
			System.out.println("update GET 진입/////////////////////");

			return "forward:/shop/market/updateMarket.jsp";
		}
		
		@RequestMapping(value = "updateMarket", method = RequestMethod.POST)
		public String updateVoting(@ModelAttribute("board") Board board,
				@RequestParam("multiFile") ArrayList<String> multiFile,
				@RequestParam("deleteFile") ArrayList<String> deleteFile, HttpSession session) throws Exception {

			System.out.println("/market/update//////////// POST");

			if (deleteFile != null) {

				for (String fileName : deleteFile) {
					FileDog files = new FileDog();
					files.setFileName(fileName);
					files.setPostNo(board.getPostNo());

					fileService.delFile(files);
				}
			}
			if (multiFile.size() != 0) {
				List<FileDog> listFile = new ArrayList<FileDog>();

				// 파일디비에넣기
				for (String fileName : multiFile) {

					if (fileName != null && fileName.length() > 0) {

						FileDog files = new FileDog();
						files.setBoardCode(MK);
						files.setFileName(fileName);
						files.setFileCode(0);
						files.setPostNo(board.getPostNo());
						listFile.add(files);
					}
				}
				fileService.addFile(listFile);
			}

			Map<String, Object> filePost = new HashMap<String, Object>();
			filePost.put("boardCode", MK);
			filePost.put("postNo", board.getPostNo());
			List<FileDog> file = fileService.getFile(filePost);

			board.setThumnail(file.get(0).getFileName());
			// 변경여기까지//

			System.out.println(board);
			boardService.updateBoard(board);
			

			return "redirect:/market/getMarket?postNo=" + board.getPostNo();
		}
		
		
		@RequestMapping(value = "delMarket", method = RequestMethod.GET)
		public String delMarket(@ModelAttribute("board") Board board, @RequestParam("postNo") int postNo, Model model) throws Exception {

			System.out.println("marketdelete");

			boardService.delBoard(board);

			Map<String, Object> filePost = new HashMap<String, Object>();
			filePost.put("boardCode", MK);
			filePost.put("postNo", postNo);
			fileService.delAllFile(filePost);

			return "redirect:/market/getMarket?postNo=" + postNo;
		}


}

		
		