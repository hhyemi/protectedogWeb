package org.protectedog.web.apply;

import java.io.File;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.adopt.AdoptService;
import org.protectedog.service.apply.ApplyService;
import org.protectedog.service.domain.Adopt;
import org.protectedog.service.domain.Apply;
import org.protectedog.service.domain.User;
import org.protectedog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;





//==> 입양신청관리 Controller
@Controller
@RequestMapping("/apply/*")
public class ApplyController {
	
	///Field
	@Autowired
	@Qualifier("applyServiceImpl")
	private ApplyService applyService;
	
	@Autowired
	@Qualifier("adoptServiceImpl")
	private AdoptService adoptService;

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	
	public ApplyController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	

	
	
	// 약관동의후->신청
	@RequestMapping( value="addApply", method=RequestMethod.GET)
	public String addApply(@ModelAttribute("apply") Apply apply, 
												@RequestParam("postNo") int postNo,
												Model model,  HttpServletRequest request,
												HttpSession session) throws Exception {

		System.out.println("/apply/addApply : GET");
		
		apply.setAdoptNo(postNo);
		apply.setId(  ((User)session.getAttribute("user")).getId() );
		User user = userService.getUsers(apply.getId());
		
		model.addAttribute("apply", apply);//adoptNo 넘기기
		model.addAttribute("user", user);
		
		//세션조건도 추가
		if ( adoptService.getAdopt(postNo).getStatusCode().equals("3") ) {
			return "redirect:/adopt/getAdopt?postNo="+postNo;
		}else {
			return "forward:/apply/addApply.jsp";
		}
		
	}
	

	
	// 신청 등록하고 다시 분양글 상세조회로
	@RequestMapping( value="addApply", method=RequestMethod.POST )
	public String addApply( @ModelAttribute("apply") Apply apply, HttpSession session, Model model ) throws Exception {

		System.out.println("/apply/addApply : POST");
		
		apply.setId(((User)session.getAttribute("user")).getId());
		apply.setNickname(((User)session.getAttribute("user")).getNickname());
		
		applyService.addApply(apply);
		Adopt adopt = adoptService.getAdopt(apply.getAdoptNo());
		adopt.setStatusCode("2");
		adoptService.updateStatusCode(adopt);    //신청서 등록했으니 분양글 상태코드 2로 변경
		
		User user = userService.getUsers(apply.getId());
		if ( ! user.getLevels().equals("미인증회원")) {
			user.setLevelPoint(user.getLevelPoint()+3);
			userService.updateUsers(user);
		}
		
		model.addAttribute("adopt", adopt);
		
		return "redirect:/adopt/getAdopt?postNo="+apply.getAdoptNo();
	}
	
	

	// 신청글 목록
	@RequestMapping( value="listApply" )
	public String listApply( @RequestParam("adoptNo") int adoptNo,
							 @ModelAttribute("search") Search search, Model model ) throws Exception{
		
		System.out.println("/apply/listApply : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		System.out.println("■■■■■ 검색어 확인 : "+search.getSearchKeyword());
		System.out.println("■■■■■ 확인 : "+search);
		
		// Business logic 수행
		Map<String , Object> map=applyService.listApply(search, adoptNo );
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
			
		System.out.println("확인                                 :  "+map);
		System.out.println("확인     222                            :  "+map.get("list"));
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		System.out.println("4========================================================"+map.get("list"));
		

		return "forward:/apply/listApply.jsp";
	}
	
	
}