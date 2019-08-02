package org.protectedog.web.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.adopt.AdoptService;
import org.protectedog.service.board.BoardService;
import org.protectedog.service.domain.Board;
import org.protectedog.service.storyfunding.FundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index/*")
public class MainController {
	
	/// Field
		@Autowired
		@Qualifier("fundingServiceImpl")
		private FundingService fundingService;
		
		///Field
		@Autowired
		@Qualifier("adoptServiceImpl")
		private AdoptService adoptService;
		
		@Autowired
		@Qualifier("boardServiceImpl")
		private BoardService boardService;
		
		@Value("#{commonProperties['info']}")
		String boardCode;
		
		@Value("#{commonProperties['pageUnit']}")
		int pageUnit;

		@Value("#{commonProperties['pageSize']}")
		int pageSize;
		
		public MainController() {
			System.out.println(this.getClass());
		}
		
		
		//maincontroller 리스트 출력
		
		//정보공유
		@RequestMapping(value = "listInfo")
		public String listInfo(@ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception {

			System.out.println(" ============================== listInfo ==================================");
			
			System.out.println(request.getRequestURL());
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
			Map<String, Object> map = boardService.listBoardMoreCommentCount(search, boardCode, order);
			
			List<Board> list = boardService.listBoardRankingSearch(boardCode);
			
			Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, search.getPageSize());
			System.out.println(resultPage);

			System.out.println(" listInfo map.get('list') :: "  + map.get("list"));

			// Model 과 View 연결
			model.addAttribute("list", map.get("list"));
			model.addAttribute("listRanking", list);
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("totalCount",map.get("totalCount"));
			model.addAttribute("search", search);

			return "";
		}

		
		


}
