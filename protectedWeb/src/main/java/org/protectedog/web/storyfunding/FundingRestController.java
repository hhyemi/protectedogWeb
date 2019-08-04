package org.protectedog.web.storyfunding;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Funding;
import org.protectedog.service.domain.Participate;
import org.protectedog.service.domain.User;
import org.protectedog.service.participate.ParticipateService;
import org.protectedog.service.storyfunding.FundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/funding/*")
public class FundingRestController {

	/// Field
	@Autowired
	@Qualifier("fundingServiceImpl")
	private FundingService fundingService;
	
	@Autowired
	@Qualifier("participateServiceImpl")
	private ParticipateService participateService;
	
	public FundingRestController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@Value("#{commonProperties['fileSF']}")
	String fileroot;

	//autocomplete
	@RequestMapping(value = "json/autocomplete/", method = RequestMethod.POST)
	public List<String> autocomplete(@RequestBody Search search, HttpServletRequest request) throws Exception {

		System.out.println("/funding/json/autocomplete");

		String keyword = search.getSearchKeyword();

		search.setSearchKeyword(keyword);

		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchKeyword", search.getSearchKeyword());
		searchMap.put("searchCondition", Integer.parseInt(search.getSearchCondition()));
		searchMap.put("statusCode", search.getVoteCondition());
		
		if (Integer.parseInt(search.getSearchCondition()) == 0) {
			searchMap.put("field", "POST_TITLE");
		} else if (Integer.parseInt(search.getSearchCondition()) == 1) {
			searchMap.put("field", "NICKNAME");
		}

		List<String> list = fundingService.getAutoVoting(searchMap);
		return list;
	}
			
	// 한달에 한번 글 작성 확인
	@RequestMapping(value = "json/addVoting", method = RequestMethod.GET)
	public int addVoting(HttpSession session) throws Exception {

		System.out.println("/funding/json/addVoting");
		
		User user = (User) session.getAttribute("user");
		Funding funding = fundingService.getPost(user.getId());
		
		if(funding != null) {
			return 1;
		}

		return 0;
	}		
	
	// 글에 한번 투표 확인
	@RequestMapping(value = "json/addVote/{postNo}", method = RequestMethod.GET)
	public int addVote(@PathVariable int postNo,HttpSession session) throws Exception {

		System.out.println("/funding/json/addVote");
		
		Participate participate = new Participate();
		User user = (User) session.getAttribute("user");
		participate.setPostNo(postNo);
		participate.setId(user.getId());
		participate.setStatusCode("1");
		
		Participate participate2 = participateService.getPostParticipate(participate);
		
		if(participate2 != null) {
			return 1;
		}

		return 0;
	}			

	// 무한스크롤
	@RequestMapping(value = "json/listVoting/", method = RequestMethod.POST)
	public Map<String, Object> listVoting(@RequestBody Search search, HttpServletRequest request) throws Exception {

		System.out.println("/funding/json/listVoting");

		String originSearch = null;

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(6);

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
		
		Map<String, Object> map2 = new HashMap<String,Object>();
		map2.put("list", map.get("list"));
	

		return map2;
	}
			
}
