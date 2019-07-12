package org.protectedog.web.storyfunding;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.protectedog.service.domain.FileDog;
import org.protectedog.service.domain.Funding;
import org.protectedog.service.file.FileService;
import org.protectedog.service.storyfunding.FundingService;
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
@RequestMapping("/funding/*")
public class FundingController {

	/// Field
	@Autowired
	@Qualifier("fundingServiceImpl")
	private FundingService fundingService;
	
	@Autowired
	@Qualifier("fileServiceImpl")
	private FileService fileService;
	
	public FundingController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@Value("#{commonProperties['fileSF']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	String fileroot;
	
	@Value("#{commonProperties['funding']}")
	String boardCode;
	
	@RequestMapping(value = "addFunding", method = RequestMethod.POST)
	public String addUser(@RequestParam("multiFile") ArrayList<String> multiFile,
			@ModelAttribute("funding") Funding funding, HttpSession session) throws Exception {

		System.out.println("/funding/addfunding : POST");

		System.out.println(multiFile);

		// 나중에 세션으로 변경//
		String id = "user01";
		String nickName = "스캇";
		funding.setId(id);
		funding.setNickName(nickName);
		// 변경여기까지//

		int voteTargetCount = (int) (funding.getFundTargetPay() * 0.001);

		funding.setVoteTargetCount(voteTargetCount);

		fundingService.addFunding(funding);
		
		List<FileDog> listFile = new ArrayList<FileDog>();

		// 파일디비에넣기
		for (String fileName : multiFile) {
			
			FileDog files = new FileDog();
			files.setBoardCode(boardCode);
			files.setFileName(fileName);
			files.setFileCode(0);
			files.setPostNo(funding.getPostNo());
			listFile.add(files);
		}
		fileService.addFile(listFile);

		return "redirect:/funding/getFunding?postNo=" + funding.getPostNo();
	}

	@RequestMapping(value = "getFunding", method = RequestMethod.GET)
	public String getFunding(@RequestParam("postNo") int postNo, Model model) throws Exception {

		System.out.println("/funding/getFunding ");

		Funding funding = fundingService.getFunding(postNo);
		FileDog file = fileService.getFile(postNo);


		model.addAttribute("file",file);
		model.addAttribute("funding", funding);

		return "forward:/funding/getFunding.jsp";
	}

	@RequestMapping(value = "updateFunding", method = RequestMethod.GET)
	public String updateFunding(@RequestParam("postNo") int postNo, Model model) throws Exception {

		System.out.println("/funding/updateFunding : GET");
		// Business Logic

		Funding funding = fundingService.getFunding(postNo);

		System.out.println("1111111111111111111" + funding);

		model.addAttribute("funding", funding);

		return "forward:/funding/board/updateFunding.jsp";
	}

	@RequestMapping(value = "updateFunding", method = RequestMethod.POST)
	public String updateFunding(@ModelAttribute("funding") Funding funding, HttpSession session) throws Exception {

		System.out.println("/funding/updateFunding : POST"); // Business Logic

		System.out.println("뭔데시발" + funding);
		fundingService.updateFunding(funding);

		return "redirect:/funding/getFunding?postNo=" + funding.getPostNo();
	}

}
