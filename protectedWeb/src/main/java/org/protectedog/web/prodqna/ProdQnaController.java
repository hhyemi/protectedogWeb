package org.protectedog.web.prodqna;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.board.BoardService;
import org.protectedog.service.domain.Board;
import org.protectedog.service.product.ProductService;
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
@RequestMapping("/prodQna/*")
public class ProdQnaController {

	/// Field
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	// setter Method 구현 않음

	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@Value("#{commonProperties['qna']}")
	// @Value("#{commonProperties[''] ?: 2}")
	String qna;
	
	public ProdQnaController() {
		System.out.println(this.getClass());
	}
	

	@RequestMapping(value="addProdQna")
	public String addProdQna(@ModelAttribute("board")Board board, HttpSession session, 
			HttpServletRequest request) throws Exception {
		
		System.out.println("shop/prodQna/addProdQna : GET/POST");
		
		board.setId("user01");
		board.setNickName("스캇");
		board.setBoardCode(qna);
		board.setProdNo(10001);
		
		System.out.println("////////////////////");
		
		boardService.addBoard(board);
		
		System.out.println("Product GET : POST/");
		System.out.println(board);
		System.out.println("////////////////////");
		
		return "forward:/shop/prodQna/addProdQna.jsp";
	}
	
	
	@RequestMapping( value="listProdQna")
	public String listProdQna(@ModelAttribute("search") Search search, HttpServletRequest request, 
			Model model, @RequestParam("order") int order) throws Exception {

		
		System.out.println("/listProdQna GET / POST");
	
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String, Object> map = boardService.listBoard(search, qna, 1);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model �� View ����

		System.out.println("/shop/prodQna/listProdQna ///////////////////////");
		System.out.println("/listProdQna GET / POST");


		
	
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/shop/prodQna/listProdQna.jsp";
	}
	
	

		@RequestMapping(value="getProdQna", method=RequestMethod.GET)
		public String getProdQna(@ModelAttribute("board") Board board, @RequestParam("postNo") int postNo , Model model) throws Exception {
			
			System.out.println("/adoptreview/getAdoptReview : GET");
			

			board = boardService.getBoard(postNo);
			System.out.println(board);
			System.out.println("/////////ProdQna GET////POST //////////////");
			model.addAttribute("board", board);	
			System.out.println("/////////ProdQna GET////POST//////////////");

		

			return "forward:/shop/prodQna/getProdQna.jsp";
		}
		
		@RequestMapping( value="updateProdQna", method=RequestMethod.GET)
		public String updateProdQna(@ModelAttribute("board") Board board , Model model) throws Exception{

			System.out.println("/shop/Product Q/A update : GET");
			//Business Logic
			boardService.updateBoard(board);
			// Model �� View ����
			model.addAttribute(board);
			System.out.println("/////////////////////////////////");
			System.out.println("/shop/Product Q/A update : GET");
			

			return "forward:/shop/prodQna/updateProdQna.jsp";
		}
		
	
}
