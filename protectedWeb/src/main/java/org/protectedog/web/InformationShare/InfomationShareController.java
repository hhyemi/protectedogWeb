package org.protectedog.web.InformationShare;

import javax.servlet.http.HttpSession;

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

	@RequestMapping(value = "addInformation", method = RequestMethod.POST)
	public String addInfo(@ModelAttribute("info") Board board, HttpSession session) throws Exception {
		
		System.out.println(" ============================== addInfo ==================================");
		
		board.setBoardCode("IS");
		//board.set
		System.out.println(" info Board : " + board);
		
		boardService.addBoard(board);
		
		return "redirect:/community/addInfo.jsp";
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
