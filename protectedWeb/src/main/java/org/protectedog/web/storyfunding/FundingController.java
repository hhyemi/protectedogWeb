package org.protectedog.web.storyfunding;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.protectedog.service.domain.Funding;
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
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/funding/*")
public class FundingController {

	/// Field
	@Autowired
	@Qualifier("fundingServiceImpl")
	private FundingService fundingService;

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
	
	@RequestMapping(value = "addFunding", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("funding") Funding funding, HttpSession session,@RequestParam("filedata")List<MultipartFile> filedata) throws Exception {

		System.out.println("/funding/addfunding : POST");
		
		System.out.println("imagesimagesimages"+filedata);
		
		 for(MultipartFile image : filedata) {
			 
			 String fileName = image.getOriginalFilename();

				File f = new File(fileroot, fileName);
				// 한번에 한해서 동일한 파일이 존재하면 이름에 (1) ,
				// (나중에)2번째에도 검사해서 이름을 편해보고, 확장자 앞에 다른 이름을 추가하도록 해보자
				if (f.exists()) {
					f = new File(fileroot, fileName + "(1)");
				}

				try {
					image.transferTo(f);
				} catch (IOException e) {
					e.printStackTrace();
				}
	        }
		

		// 나중에 세션으로 변경//
		String id = "user01";
		String nickName = "스캇";
		funding.setId(id);
		funding.setNickName(nickName);
		// 변경여기까지//

		int voteTargetCount = (int) (funding.getFundTargetPay() * 0.001);
		System.out.println("voteTargetCount" + voteTargetCount);
		funding.setVoteTargetCount(voteTargetCount);

		fundingService.addFunding(funding);

		return "redirect:/funding/getFunding?postNo=" + funding.getPostNo();
	}

	@RequestMapping(value = "getFunding", method = RequestMethod.GET)
	public String getFunding(@RequestParam("postNo") int postNo, Model model) throws Exception {

		System.out.println("/funding/getFunding ");

		Funding funding = fundingService.getFunding(postNo);

		model.addAttribute("funding", funding);

		return "forward:/storyfunding/board/getFunding.jsp";
	}

	@RequestMapping(value = "updateFunding", method = RequestMethod.GET)
	public String updateFunding(@RequestParam("postNo") int postNo, Model model) throws Exception {

		System.out.println("/funding/updateFunding : GET");
		// Business Logic

		Funding funding = fundingService.getFunding(postNo);
		
		System.out.println("1111111111111111111"+funding);

		model.addAttribute("funding", funding);

		return "forward:/storyfunding/board/updateFunding.jsp";
	}

	@RequestMapping(value = "updateFunding", method = RequestMethod.POST)
	public String updateFunding(@ModelAttribute("funding") Funding funding,HttpSession session)
			throws Exception {

		System.out.println("/funding/updateFunding : POST"); // Business Logic
		
		System.out.println("뭔데시발"+funding);
		fundingService.updateFunding(funding);

		return "redirect:/funding/getFunding?postNo=" + funding.getPostNo();
	}

}
