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
import org.protectedog.service.domain.Board;
import org.protectedog.service.domain.FileDog;
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
	

	@RequestMapping(value="addMarket")
	public String addProdQna(@ModelAttribute("board")Board board, HttpSession session, 
			HttpServletRequest request, @RequestParam("multiFile") ArrayList<String> multiFile, Model model) throws Exception {
		
		System.out.println("shop/market/addMarket : GET/POST");
		
		board.setId("user01");
		board.setNickName("스캇");
		board.setBoardCode(MK);
		board.setViewCount(0);
		board.setProdNo(10001);
		board.setPhone("011-1123-4567");
		
		System.out.println("////////////////////");
		
		
		boardService.addBoard(board);
		
		System.out.println("Product GET : POST/");
		System.out.println(board);
		System.out.println("////////////////////");
		
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
		model.addAttribute("board", board);
		
		
		return "forward:/shop/market/addMarket.jsp";
	}
	
	@RequestMapping( value="listMarket")
	public String listProdQna(@ModelAttribute("search") Search search, HttpServletRequest request, 
			Model model, @RequestParam("order") int order) throws Exception {

		
		System.out.println("/listMarket GET / POST");
	
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String, Object> map = boardService.listBoard(search, MK, 1);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model 과 View 연결

		System.out.println("/shop/Maket/listMarket ///////////////////////");
		System.out.println("/listMarket GET / POST");
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/shop/market/listMarket.jsp";
	}
	
	@RequestMapping(value ="getMarket", method=RequestMethod.GET)
	public String getProduct(@RequestParam("postNo") int postNo, Model model) throws Exception {

		System.out.println("/product/getProduct : get");
		// Business Logic
		System.out.println(postNo);
		Board board = boardService.getBoard(postNo);
		// Model 과 View 연결
		model.addAttribute("board", board);
		
		// 파일가져오기
		Map<String, Object> filePost = new HashMap<String, Object>();
				filePost.put("boardCode", MK);
				filePost.put("postNo", postNo);
				List<FileDog> file = fileService.getFile(filePost);

		model.addAttribute("file", file);
		model.addAttribute("board", board);

		return "forward:/shop/market/getMarket.jsp";
		
	}
	
	
	
	
}
	
		