package org.protectedog.web.apply;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.apply.ApplyService;
import org.protectedog.service.domain.Apply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;




//==> 분양신청관리 RestController
@RestController
@RequestMapping("/apply/*")
public class ApplyRestController {
	
	///Field
	@Autowired
	@Qualifier("applyServiceImpl")
	private ApplyService applyService;

		
	public ApplyRestController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	

	//신청서 조회
	@RequestMapping( value="json/getApply/{applyNo}", method=RequestMethod.GET)
	public Apply getApply( @RequestParam("applyNo") int applyNo ) throws Exception {
		
		System.out.println("/apply/json/getApply : GET");
			
		return applyService.getApply(applyNo);
	}
	
	
	
	//신청서 삭제
	@RequestMapping( value="json/delApply/{applyNo}", method=RequestMethod.GET)
	public void delApply( 	@RequestParam("applyNo") int applyNo ) throws Exception{

		System.out.println("/apply/json/delApply : GET");
		
		Apply apply = applyService.getApply(applyNo);
	
		apply.setStatusCode("0");	// 신청서 삭제
		
		//Business Logic
		applyService.delApply(apply);
	}
	
	
	
	// 리스트 조회
	@RequestMapping( value="json/listApply/{adoptNo}")
	public Map<String , Object> listApply( @RequestParam("adoptNo") int adoptNo,
			@RequestBody Search search ,HttpSession session
			) throws Exception{
		
		System.out.println("/apply/json/listApply : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
				
		// Business logic 수행
		Map<String , Object> map= applyService.listApply(search, adoptNo);
//		Map<String , Object> map= new HashMap<String, Object>();
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);
		map.put("message","purchaseOK");
		
		return map;
	}
	
	
}