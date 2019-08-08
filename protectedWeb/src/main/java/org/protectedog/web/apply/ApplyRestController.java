package org.protectedog.web.apply;

import java.util.Map;

import org.json.simple.JSONObject;
import org.protectedog.common.Search;
import org.protectedog.service.adopt.AdoptService;
import org.protectedog.service.apply.ApplyService;
import org.protectedog.service.domain.Apply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;




//==> 입양신청관리 RestController
@RestController
@RequestMapping("/apply/*")
public class ApplyRestController {
	
	///Field
	@Autowired
	@Qualifier("applyServiceImpl")
	private ApplyService applyService;
	@Autowired
	@Qualifier("adoptServiceImpl")
	private AdoptService adoptService;

		
	public ApplyRestController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	

	//신청서 조회
	@RequestMapping( value="json/getApply/{applyNo}", method=RequestMethod.POST)
	public Apply getApply( @PathVariable("applyNo") int applyNo ) throws Exception {
		
		System.out.println("/apply/json/getApply : GET");
			
		return applyService.getApply(applyNo);
	}

	//신청서 삭제
	@RequestMapping( value="json/delApply/{applyNo}", method=RequestMethod.GET)
	public void delApply( 	@PathVariable("applyNo") int applyNo ) throws Exception{

		System.out.println("/apply/json/delApply : GET");
		
		Apply apply = applyService.getApply(applyNo);
	
		apply.setStatusCode("0");	// 신청서 삭제
		
		//Business Logic
		applyService.delApply(apply);
	}
	
	
	
	// 리스트 조회
	@SuppressWarnings("unchecked")
	@RequestMapping( value="json/listApply/{adoptNo}")
	public JSONObject listApply( @PathVariable("adoptNo") int adoptNo
//			public Map<String,Object> listApply( @PathVariable("adoptNo") int adoptNo
//											,@RequestBody Search search ,HttpSession session
																							) throws Exception{
		
		System.out.println("/apply/json/listApply : GET / POST");
		
		Search search = new Search();
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map= applyService.listApply(search, adoptNo);
		// Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);

		// Model 과 View 연결
		map.put("list", map.get("list"));

		map.remove("adoptNo");
		map.remove("startRowNum");
		map.remove("endRowNum");
		map.remove("totalCount");
		System.out.println("map확인 : "+map);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list", map.get("list"));
        
        System.out.println("json\n"+jsonObject);
        
        return jsonObject;
	}
	
	
	// 리스트 조회
	@SuppressWarnings("unchecked")
	@RequestMapping( value="json/listApply2/{adoptNo}")
	public JSONObject listApply2( @PathVariable("adoptNo") String id ) throws Exception{
		
		System.out.println("/apply/json/listApply2 : GET / POST" +id);
		
		// Business logic 수행
		Map<String , Object> map= applyService.listApply2(id);
	
		// Model 과 View 연결
		map.put("list", map.get("list"));
//		List<Adopt> list = (List)map.get("list");
//		System.out.println( list );
//		
//		for (int i=0; i< list.size(); i++) {
//			String str = list.get(i);
//			System.out.println(str);
//		}
		

		System.out.println("map확인 : "+map);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", map.get("list"));
		
		System.out.println("json\n"+jsonObject);
		
		return jsonObject;
	}
	
	
}