package org.protectedog.web.storyfunding;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.domain.FileDog;
import org.protectedog.service.domain.Funding;
import org.protectedog.service.domain.Participate;
import org.protectedog.service.domain.User;
import org.protectedog.service.file.FileService;
import org.protectedog.service.participate.ParticipateService;
import org.protectedog.service.storyfunding.FundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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

	@Autowired
	@Qualifier("participateServiceImpl")
	private ParticipateService participateService;

	public FundingController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['fundingPageSize']}")
	int pageSize;

	@Value("#{commonProperties['fileSF']}")
	String fileroot;

	@Value("#{commonProperties['funding']}")
	String fundBoardCode;

	@Value("#{commonProperties['fundingReview']}")
	String fundReviewBoardCode;

	@Value("#{commonProperties['SFTermsOne']}")
	String SFTermsOne;

	@Value("#{commonProperties['SFTermsTwo']}")
	String SFTermsTwo;

	@Value("#{commonProperties['SFTermsThree']}")
	String SFTermsThree;

	@Value("#{commonProperties['SFTermsFour']}")
	String SFTermsFour;

	@Value("#{commonProperties['SFTermsFive']}")
	String SFTermsFive;

	/////////////// 약관보기 /////////////////////

	// 약관보기
	@RequestMapping(value = "getTerms", method = RequestMethod.GET)
	public String getTerms(@RequestParam("termsTitle") String termsTitle, @RequestParam("postNo") String postNo,
			Model model, HttpSession session) throws Exception {

		System.out.println("/funding/getTerms");

		List<String> termsList = new ArrayList<String>();
		termsList.add(SFTermsOne);
		termsList.add(SFTermsTwo);
		termsList.add(SFTermsThree);
		termsList.add(SFTermsFour);
		termsList.add(SFTermsFive);

		if (termsTitle.equals("SFPost")) {
			termsTitle = "후원신청글";
		} else if (termsTitle.equals("SFVote")) {
			termsTitle = "투표하기";
		} else if (termsTitle.equals("SFFund")) {
			termsTitle = "후원하기";
		}

		model.addAttribute("termsList", termsList);
		model.addAttribute("termsTitle", termsTitle);
		model.addAttribute("postNo", postNo);

		return "forward:/funding/getTerms.jsp";
	}

	/////////////// FUNDING 후원신청게시판 /////////////////////

	// 펀딩 글 작성
	@RequestMapping(value = "addVoting", method = RequestMethod.GET)
	public String addVoting(HttpSession session, Model model) throws Exception {

		System.out.println("/funding/addVoting : GET");

		// 세션
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);

		return "redirect:/funding/addVoting.jsp";
	}

	// 펀딩 글 등록
	@RequestMapping(value = "addVoting", method = RequestMethod.POST)
	public String addVoting(@RequestParam("multiFile") ArrayList<String> multiFile,
			@ModelAttribute("funding") Funding funding, HttpSession session) throws Exception {

		System.out.println("/funding/addVoting : POST");

		// 세션
		User user = (User) session.getAttribute("user");
		funding.setId(user.getId());
		funding.setNickname(user.getNickname());

		int voteTargetCount = (int) (funding.getFundTargetPay() * 0.0001);

		funding.setMainFile(multiFile.get(0));
		funding.setVoteTargetCount(voteTargetCount);

		System.out.println(funding);
		fundingService.addVoting(funding);

		List<FileDog> listFile = new ArrayList<FileDog>();

		// 파일디비에넣기
		for (String fileName : multiFile) {

			if (fileName != null && fileName.length() > 0) {

				FileDog files = new FileDog();
				files.setBoardCode(fundBoardCode);
				files.setFileName(fileName);
				files.setFileCode(0);
				files.setPostNo(funding.getPostNo());
				listFile.add(files);
			}
		}
		fileService.addFile(listFile);

		return "redirect:/funding/getVoting?postNo=" + funding.getPostNo();
	}

	// 펀딩 글 확인
	@RequestMapping(value = "getVoting", method = RequestMethod.GET)
	public String getVoting(@ModelAttribute("search") Search search, @RequestParam("postNo") int postNo, Model model,
			HttpSession session) throws Exception {

		System.out.println("/funding/getVoting ");

		// 조회수 증가
		Funding voteViewFunding = new Funding();
		voteViewFunding.setPostNo(postNo);
		voteViewFunding.setVoteViewCount(1);
		fundingService.updateStatusCode(voteViewFunding);

		// 글 가져오기
		Funding funding = fundingService.getVoting(postNo);

		// 파일가져오기
		Map<String, Object> filePost = new HashMap<String, Object>();
		filePost.put("boardCode", fundBoardCode);
		filePost.put("postNo", postNo);
		List<FileDog> file = fileService.getFile(filePost);

		// 세션
		User user = (User) session.getAttribute("user");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = participateService.listNoticeComment(search, postNo, "1");

		// Page resultPage = new Page(search.getCurrentPage(), ((Integer)
		// map.get("totalCount")).intValue(), pageUnit,pageSize);

		model.addAttribute("file", file);
		model.addAttribute("funding", funding);
		model.addAttribute("user", user);
		// 댓글
		model.addAttribute("list", map.get("list"));
		// model.addAttribute("resultPage", resultPage);
		// model.addAttribute("search", search);

		return "forward:/funding/getVoting.jsp";
	}

	// 펀딩 글 수정작성
	@RequestMapping(value = "updateVoting", method = RequestMethod.GET)
	public String updateVoting(@RequestParam("postNo") int postNo, Model model) throws Exception {

		System.out.println("/funding/updateVoting : GET");
		// Business Logic

		Funding funding = fundingService.getVoting(postNo);

		Map<String, Object> filePost = new HashMap<String, Object>();
		filePost.put("boardCode", fundBoardCode);
		filePost.put("postNo", postNo);
		List<FileDog> file = fileService.getFile(filePost);

		model.addAttribute("funding", funding);
		model.addAttribute("file", file);

		return "forward:/funding/updateVoting.jsp";
	}

	// 펀딩 글 수정등록
	@RequestMapping(value = "updateVoting", method = RequestMethod.POST)
	public String updateVoting(@ModelAttribute("funding") Funding funding,
			@RequestParam("multiFile") ArrayList<String> multiFile,
			@RequestParam("deleteFile") ArrayList<String> deleteFile, HttpSession session) throws Exception {

		System.out.println("/funding/updateVoting : POST");

		if (deleteFile != null) {

			for (String fileName : deleteFile) {
				FileDog files = new FileDog();
				files.setFileName(fileName);
				files.setPostNo(funding.getPostNo());

				fileService.delFile(files);
			}
		}
		if (multiFile.size() != 0) {
			List<FileDog> listFile = new ArrayList<FileDog>();

			// 파일디비에넣기
			for (String fileName : multiFile) {

				if (fileName != null && fileName.length() > 0) {

					FileDog files = new FileDog();
					files.setBoardCode(fundBoardCode);
					files.setFileName(fileName);
					files.setFileCode(0);
					files.setPostNo(funding.getPostNo());
					listFile.add(files);
				}
			}
			fileService.addFile(listFile);
		}

		// 세션
		User user = (User) session.getAttribute("user");
		funding.setId(user.getId());
		funding.setNickname(user.getNickname());

		Map<String, Object> filePost = new HashMap<String, Object>();
		filePost.put("boardCode", fundBoardCode);
		filePost.put("postNo", funding.getPostNo());
		List<FileDog> file = fileService.getFile(filePost);

		funding.setMainFile(file.get(0).getFileName());
		// 변경여기까지//

		int voteTargetCount = (int) (funding.getFundTargetPay() * 0.0001);
		funding.setVoteTargetCount(voteTargetCount);

		fundingService.updateVoting(funding);

		return "redirect:/funding/getVoting?postNo=" + funding.getPostNo();
	}

	// 펀딩 글 삭제
	@RequestMapping(value = "delVoting")
	public String delVoting(@RequestParam("postNo") int postNo, Model model) throws Exception {

		System.out.println("/funding/delVoting");

		fundingService.delVoting(postNo);

		Map<String, Object> filePost = new HashMap<String, Object>();
		filePost.put("boardCode", fundBoardCode);
		filePost.put("postNo", postNo);
		fileService.delAllFile(filePost);

		return "forward:/funding/listVoting";
	}

	// 펀딩 글 리스트
	@RequestMapping(value = "listVoting")
	public String listVoting(@ModelAttribute("search") Search search, Model model, HttpSession session)
			throws Exception {

		System.out.println("/funding/listVoting : GET / POST");

		String originSearch = null;

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		if (search.getSearchKeyword() == null) {
			search.setSearchKeyword("");
		} else {
			if (!search.getSearchKeyword().equals("")) {
				originSearch = search.getSearchKeyword();
				String likeSearch = "%" + search.getSearchKeyword() + "%";
				search.setSearchKeyword(likeSearch);
			}
		}

		if (search.getSearchCondition() == null) {
			search.setSearchCondition("");
		}

		Map<String, Object> map = fundingService.listVoting(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		search.setSearchKeyword(originSearch);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/funding/listVoting.jsp";
	}

	/////////////// FUNDING 후원게시게시판 /////////////////////

	// 펀딩 글 리스트
	@RequestMapping(value = "listFunding")
	public String listFunding(@ModelAttribute("search") Search search, Model model, HttpSession session)
			throws Exception {

		System.out.println("/funding/listFunding : GET / POST");

		String originSearch = null;

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		if (search.getSearchKeyword() == null) {
			search.setSearchKeyword("");
		} else {
			if (!search.getSearchKeyword().equals("")) {
				originSearch = search.getSearchKeyword();
				String likeSearch = "%" + search.getSearchKeyword() + "%";
				search.setSearchKeyword(likeSearch);
			}
		}

		if (search.getSearchCondition() == null) {
			search.setSearchCondition("");
		}

		Map<String, Object> map = fundingService.listFunding(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		search.setSearchKeyword(originSearch);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/funding/listFunding.jsp";
	}

	// 펀딩 글 확인
	@RequestMapping(value = "getFunding", method = RequestMethod.GET)
	public String getFunding(@RequestParam("postNo") int postNo, Model model, HttpSession session, Search search)
			throws Exception {

		System.out.println("/funding/getFunding ");

		// 조회수 증가
		Funding voteViewFunding = new Funding();
		voteViewFunding.setPostNo(postNo);
		voteViewFunding.setFundViewCount(1);
		fundingService.updateStatusCode(voteViewFunding);

		// 글 가져오기
		Funding funding = fundingService.getVoting(postNo);

		// 파일가져오기
		Map<String, Object> filePost = new HashMap<String, Object>();
		filePost.put("boardCode", fundBoardCode);
		filePost.put("postNo", postNo);
		List<FileDog> file = fileService.getFile(filePost);

		// 세션
		User user = (User) session.getAttribute("user");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = participateService.listNoticeComment(search, postNo, "2");

		// Page resultPage = new Page(search.getCurrentPage(), ((Integer)
		// map.get("totalCount")).intValue(), pageUnit,pageSize);

		// 리뷰
		Map<String, Object> fileReviewPost = new HashMap<String, Object>();
		fileReviewPost.put("boardCode", fundReviewBoardCode);
		fileReviewPost.put("postNo", postNo);
		List<FileDog> fileReview = fileService.getFile(fileReviewPost);

		model.addAttribute("file", file);
		model.addAttribute("fileReview", fileReview);
		model.addAttribute("funding", funding);
		model.addAttribute("user", user);
		// 댓글
		model.addAttribute("list", map.get("list"));
		// model.addAttribute("resultPage", resultPage);
		// model.addAttribute("search", search);

		return "forward:/funding/getFunding.jsp";
	}
	/////////////// FUNDING 참여/////////////////////

	// 투표참여
	@RequestMapping(value = "addVote", method = RequestMethod.GET)
	public String addVote(@RequestParam("postNo") int postNo, HttpSession session) throws Exception {

		System.out.println("/funding/addVote : GET");

		Participate participate = new Participate();
		participate.setPostNo(postNo);
		// 세션
		User user = (User) session.getAttribute("user");
		participate.setId(user.getId());
		participate.setNickname(user.getNickname());
		// participate 레코드 추가 ( 1 : 투표 )
		participate.setStatusCode("1");

		participateService.addParticipate(participate);

		// funding테이블 voter_count += 1
		Funding funding = fundingService.getVoting(postNo);

		// 투표완료 될상황
		if (funding.getVoterCount() + 1 == funding.getVoteTargetCount()) {
			funding.setStatusCode("3");
		} else {
			funding.setStatusCode("1");
		}

		funding.setVoterCount(1);
		fundingService.updateStatusCode(funding);

		return "redirect:/funding/getVoting?postNo=" + postNo;
	}

	// 투표와 후원참여 결제하는 페이지
	@RequestMapping(value = "addFund", method = RequestMethod.GET)
	public String addFunding(@RequestParam("postNo") int postNo, Model model, HttpSession session) throws Exception {

		System.out.println("/funding/addFund : GET");

		Funding funding = fundingService.getVoting(postNo);

		model.addAttribute("funding", funding);

		return "forward:/funding/addFundView.jsp";
	}

	// 후원참여
	@RequestMapping(value = "addFund", method = RequestMethod.POST)
	public String addFunding(@ModelAttribute("participate") Participate participate, Model model, HttpSession session)
			throws Exception {

		System.out.println("/funding/addFund : POST");

		User user = (User) session.getAttribute("user");
		participate.setId(user.getId());
		participate.setNickname(user.getNickname());
		// participate 레코드 추가 ( 2 : 후원 )
		participate.setStatusCode("2");

		participateService.addParticipate(participate);

		// funding테이블 voter_count += 1
		Funding funding = new Funding();

		funding.setSponsorCount(1);
		funding.setFundPay(participate.getFundPay());
		funding.setPostNo(participate.getPostNo());
		funding.setStatusCode("3");
		fundingService.updateStatusCode(funding);

		Funding funding2 = fundingService.getVoting(participate.getPostNo());

		model.addAttribute("funding", funding2);
		model.addAttribute("participate", participate);

		return "forward:/funding/addFund.jsp";
	}

	//////////////////////////////// 후기///////////////////////////////////////////////

	// 후기 글 작성
	@RequestMapping(value = "addReview", method = RequestMethod.GET)
	public String addReview(@RequestParam("postNo") int postNo, Model model, HttpSession session) throws Exception {

		System.out.println("/funding/addReview : GET");

		Funding funding = fundingService.getVoting(postNo);

		model.addAttribute("funding", funding);

		return "forward:/funding/addReview.jsp";
	}

	// 후기 글 등록
	@RequestMapping(value = "addReview", method = RequestMethod.POST)
	public String addReview(@RequestParam("multiFile") ArrayList<String> multiFile,
			@ModelAttribute("funding") Funding funding, HttpSession session) throws Exception {

		System.out.println("/funding/addReview : POST");

		// 세션
		User user = (User) session.getAttribute("user");
		funding.setId(user.getId());
		funding.setNickname(user.getNickname());

		// 변경여기까지//

		fundingService.addReview(funding);

		List<FileDog> listFile = new ArrayList<FileDog>();

		// 파일디비에넣기
		for (String fileName : multiFile) {

			if (fileName != null && fileName.length() > 0) {

				FileDog files = new FileDog();
				files.setBoardCode(fundReviewBoardCode);
				files.setFileName(fileName);
				files.setFileCode(0);
				files.setPostNo(funding.getPostNo());
				listFile.add(files);
			}
		}
		fileService.addFile(listFile);

		return "redirect:/funding/getFunding?postNo=" + funding.getPostNo();
	}

	// 후기 글 수정작성
	@RequestMapping(value = "updateReview", method = RequestMethod.GET)
	public String updateReview(@RequestParam("postNo") int postNo, Model model) throws Exception {

		System.out.println("/funding/updateReview : GET");
		// Business Logic

		Funding funding = fundingService.getVoting(postNo);

		Map<String, Object> filePost = new HashMap<String, Object>();
		filePost.put("boardCode", fundReviewBoardCode);
		filePost.put("postNo", postNo);
		List<FileDog> file = fileService.getFile(filePost);

		model.addAttribute("funding", funding);
		model.addAttribute("file", file);

		return "forward:/funding/updateReview.jsp";
	}

	// 후기 글 수정 등록
	@RequestMapping(value = "updateReview", method = RequestMethod.POST)
	public String updateReview(@ModelAttribute("funding") Funding funding,
			@RequestParam("multiFile") ArrayList<String> multiFile,
			@RequestParam("deleteFile") ArrayList<String> deleteFile, HttpSession session) throws Exception {

		System.out.println("/funding/updateReview : POST");

		if (deleteFile != null) {

			for (String fileName : deleteFile) {
				FileDog files = new FileDog();
				files.setFileName(fileName);
				files.setPostNo(funding.getPostNo());

				fileService.delFile(files);
			}
		}
		if (multiFile.size() != 0) {
			List<FileDog> listFile = new ArrayList<FileDog>();
			// 파일디비에넣기
			for (String fileName : multiFile) {

				if (fileName != null && fileName.length() > 0) {

					FileDog files = new FileDog();
					files.setBoardCode(fundBoardCode);
					files.setFileName(fileName);
					files.setFileCode(0);
					files.setPostNo(funding.getPostNo());
					listFile.add(files);
				}
			}
			fileService.addFile(listFile);
		}

		// 세션
		User user = (User) session.getAttribute("user");
		funding.setId(user.getId());
		funding.setNickname(user.getNickname());

		Map<String, Object> filePost = new HashMap<String, Object>();
		filePost.put("boardCode", fundReviewBoardCode);
		filePost.put("postNo", funding.getPostNo());
		List<FileDog> file = fileService.getFile(filePost);

		funding.setMainFile(file.get(0).getFileName());
		// 변경여기까지//

		fundingService.updateReview(funding);

		return "redirect:/funding/getFunding?postNo=" + funding.getPostNo();
	}

	// 후기 글 삭제
	@RequestMapping(value = "delReview", method = RequestMethod.GET)
	public String delReview(@RequestParam("postNo") int postNo, Model model) throws Exception {

		System.out.println("/funding/delReview");

		fundingService.delReview(postNo);

		Map<String, Object> filePost = new HashMap<String, Object>();
		filePost.put("boardCode", fundReviewBoardCode);
		filePost.put("postNo", postNo);
		fileService.delAllFile(filePost);

		return "redirect:/funding/getFunding?postNo=" + postNo;
	}

	@RequestMapping(value = "json/getThumbnailList/{thumbCurrentPage}", method = RequestMethod.GET)
	public String getThumbnailList(@PathVariable("thumbCurrentPage") int thumbCurrentPage, HttpServletRequest request)
			throws Exception {
		System.out.println("json/getThumbnailList");
		Search search = new Search();
		search.setCurrentPage(thumbCurrentPage);
		search.setPageSize(pageSize);

		Map<String, Object> map = fundingService.listVoting(search);
		request.setAttribute("map", map);

		return "forward:/funding/thumbnailVotingList.jsp";
	}
}
