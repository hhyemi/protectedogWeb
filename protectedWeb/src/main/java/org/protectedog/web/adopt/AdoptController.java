package org.protectedog.web.adopt;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.adopt.AdoptService;
import org.protectedog.service.domain.Adopt;
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




//==> 분양|실종관리 Controller
@Controller
@RequestMapping("/adopt/*")
public class AdoptController {
	
	///Field
	@Autowired
	@Qualifier("adoptServiceImpl")
	private AdoptService adoptService;
	
	//setter Method 구현 않음
	
//	@Resource(name = "uploadPath")
//	private String uploadPath;
	
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	

	
	
	public AdoptController(){
		System.out.println(this.getClass());
	}
	
	
	
	
	@RequestMapping( value="addAdopt", method=RequestMethod.GET )
	public String addAdopt(  @RequestParam("boardCode") String boardCode, HttpSession session  ) throws Exception {

		System.out.println("/adopt/addAdopt : GET : "+boardCode);
		
//		adopt.setId(((User)session.getAttribute("user")).getId());
//		adopt.setPhone(((User)session.getAttribute("user")).getPhone());
		
		// 분양이면 약관동의, 실종이면 글쓰기로
		if(boardCode.equals("AD")) {
			return "forward:/adopt/getTerms.jsp";
		}else {
//			return "forward:/adopt/test.jsp";
			return "forward:/adopt/addAdopt.jsp?=MS";
		}
	}
	

	
	// 글 등록하고 상세조회 화면으로 
	@RequestMapping( value="addAdopt", method=RequestMethod.POST )
	public String addAdopt( @ModelAttribute("adopt") Adopt adopt, Model model
//											,MultipartHttpServletRequest mtfRequest
											) throws Exception {

		System.out.println("/adopt/addAdopt : POST 컨트롤러들어옴");
		System.out.println(adopt);

		// 파일
//		product.setFileName(UploadFile.saveFile(mtfRequest.getFile("file"),uploadPath));
//		System.out.println("파일확인 : "+product.getFileName());
		adoptService.addAdopt(adopt);
		model.addAttribute("adopt", adopt);
		
		return "forward:/adopt/getAdopt.jsp";
	}
	
	
	
	// 글 상세조회
	@RequestMapping( value="getAdopt", method=RequestMethod.GET)
	public String getAdopt( @RequestParam("postNo") int postNo , Model model) throws Exception {
		
		System.out.println("/adopt/getAdopt : GET");
		
		Adopt adopt = adoptService.getAdopt(postNo);
		model.addAttribute("adopt", adopt);	
//		System.out.println("파일이름 확인 : "+product.getFileName());
	
		return "forward:/adopt/getAdopt.jsp";
	}
	
	
	
	// 글 수정화면으로
	@RequestMapping( value="updateAdopt", method=RequestMethod.GET)
	public String updateAdopt( @RequestParam("postNo") int postNo , Model model) throws Exception{

		System.out.println("/adopt/updateAdopt : GET");
		
		Adopt adopt = adoptService.getAdopt(postNo);
		model.addAttribute("adopt", adopt);
		
		return "forward:/adopt/updateAdopt.jsp";
	}
	
	
	
	// 글 수정하고 조회
	// 글상태확인은 jsp에서
	@RequestMapping( value="updateAdopt" , method=RequestMethod.POST)
	public String updateAdopt( @ModelAttribute("adopt") Adopt adopt, Model model
//								, MultipartHttpServletRequest mtfRequest
																		) throws Exception{

		System.out.println("/adopt/updateAdopt : POST");
		
		// 파일
//		adopt.setFileName(UploadFile.saveFile(mtfRequest.getFile("file"),uploadPath));
//		boolean fileName = adopt.getFileName().endsWith("_");

//		if ( fileName ) {
//			adopt.setFileName((adoptService.getAdopt(adopt.getPostNo())).getFileName());
//		}
		
		adoptService.updateAdopt(adopt);
		adopt = adoptService.getAdopt(adopt.getPostNo());
		model.addAttribute("adopt", adopt);		

		return "forward:/adopt/getAdopt.jsp?postNo="+adopt.getPostNo();
	}
	
	
	
	// 글 삭제
	@RequestMapping( value="updateStatusCode" , method=RequestMethod.POST)
	public String updateStatusCode( @ModelAttribute("adopt") Adopt adopt ) throws Exception{
		
		System.out.println("/adopt/updateStatusCode : POST");

		adopt.setStatusCode("0");
		adoptService.updateStatusCode(adopt);
		
		// 파라미터값으로 보드코드? 
		return "forward:/adopt/listAdopt";
	}
	
	
	
	
	// 글 리스트 조회
	@RequestMapping( value="listAdopt" )
	public String listAdopt( @ModelAttribute("search") Search search,
							 @RequestParam("boardCode") String boardCode, Model model ) throws Exception{
		
		System.out.println("/adopt/listAdopt : GET / POST");
		
		if (search.getCurrentPage() ==0 ) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		System.out.println("■■■■ 검색어 확인 : "+search.getSearchKeyword()
						+"  ■■■■ search 확인 : "+search);
		
		Map<String , Object> map=adoptService.listAdopt(search, boardCode);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
			
		System.out.println("■■■■ map 확인 : "+map
						+"  ■■■■ map.get(\"list\") 확인  : "+map.get("list"));
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		// 파라미터값으로 보드코드? 
		return "forward:/adopt/listAdopt.jsp";
	}
	
	
}