package org.protectedog.web.adoptreview;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.adopt.AdoptService;
import org.protectedog.service.board.BoardService;
import org.protectedog.service.domain.Adopt;
import org.protectedog.service.domain.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;



//==> 분양후기관리 Controller
@RestController
@RequestMapping("/adoptReview/*")
public class AdoptReviewRestController {
	
	///Field
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;

		
	public AdoptReviewRestController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['fundingPageSize']}")
	int pageSize;
	
	


	
	// 글 리스트 조회
	@SuppressWarnings("unchecked")
	@RequestMapping( value="json/listAdoptReview" )
	public JSONObject listAdoptReview( @ModelAttribute("search") Search search, @RequestBody Map<String,Object> params,
																			Model model, HttpSession session ) throws Exception{
		
		System.out.println("\n\n/adoptReview/json/listAdoptReview : GET / POST "+params.get("searchKeyword").toString());
		
		if(params.get("searchCondition") == null || params.get("searchCondition").toString().equals("") ) {
			search.setSearchCondition("");
		} else {
			search.setSearchCondition( params.get("searchCondition").toString() );
		}

		if(params.get("searchKeyword") == null || params.get("searchKeyword").toString().equals("") ) {
			search.setSearchKeyword("");
		} else {
			search.setSearchKeyword( params.get("searchKeyword").toString() );
		}
		
		search.setAreaCondition("");
		search.setVoteCondition("");
		
		search.setCurrentPage( Integer.parseInt( params.get("pazeSize").toString() ) );
//		System.out.println(search.getAreaCondition()+"◀확인▶"+Integer.parseInt( params.get("pazeSize").toString() ));
		
		search.setPageSize(pageSize);
//		System.out.println("search 확인 : "+search);
		
		Map<String , Object> map=boardService.listBoard(search, params.get("boardCode").toString(), 0);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		map.put("list", map.get("list"));
//		System.out.println("■■■■ 리스트 확인 : "+map.get("list"));

		JSONObject jsonObject = new JSONObject();
        jsonObject.put("list", map.get("list"));
        jsonObject.put("startRowNum", map.get("startRowNum"));
        jsonObject.put("searchCondition", map.get("searchCondition"));
        jsonObject.put("endRowNum", map.get("endRowNum"));
        jsonObject.put("boardCode", map.get("boardCode"));
        jsonObject.put("searchKeyword", map.get("searchKeyword"));
        jsonObject.put("totalCount", map.get("totalCount"));

      
//        System.out.println("json5========================================================\n"+jsonObject);
      
		return jsonObject;
	}	
	
}