package org.protectedog.web.InformationShare;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.board.BoardService;
import org.protectedog.service.domain.Board;
import org.protectedog.service.domain.Funding;
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

	public InfomationShareController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "addInformation")
	public String addInfo(@ModelAttribute("board") Board board, HttpSession session, HttpServletRequest request) throws Exception {
		
		System.out.println(" ============================== addInfo ==================================");
		
		board.setBoardCode("IS");
		board.setId("user02");
		board.setNickName("호랭이");
		
		//request.setCharacterEncoding("euc_kr");
		
		//System.out.println(" info Content : " + content);
		//board.set
		System.out.println(" info Board : " + board);
		
		boardService.addBoard(board);
		
		return "redirect:/community/addInfo.jsp";
	}
	
	@RequestMapping(value = "listInfo")
	public String listInfo( @ModelAttribute("search") Search search, Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/listProduct");
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		
		if(request.getParameter("pageSize") == null) {
			search.setPageSize(pageSize);
		} else {
			String repageSize = (String)request.getParameter("pageSize");
			search.setPageSize(Integer.parseInt(repageSize));
		}
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("search",search);
		
		if(request.getParameter("order") == null) {
			searchMap.put("order", "p.prod_no");
		} else if(request.getParameter("order").equals("1")) {
			searchMap.remove("order");
			searchMap.put("order", "p.PRICE DESC");
		} else if(request.getParameter("order").equals("2")){
			searchMap.remove("order");
			searchMap.put("order", "p.PRICE ASC");
		}	
			
		System.out.println(" getParameter : " + request.getParameter("menu"));
		
		System.out.println(search + " :: ");
		System.out.println(search.getStartRowNum()+" "+search.getEndRowNum());
		
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
	
	@RequestMapping(value = "getFunding", method = RequestMethod.GET)
	public String getFunding(@RequestParam("postNo") int postNo, Model model) throws Exception {

		return null;
	}

	@RequestMapping(value = "updateFunding", method = RequestMethod.POST)
	public String updateFunding(@ModelAttribute("funding") Funding funding,HttpSession session)
			throws Exception {

		return "redirect:/funding/getFunding?postNo=" + funding.getPostNo();
	}

}
