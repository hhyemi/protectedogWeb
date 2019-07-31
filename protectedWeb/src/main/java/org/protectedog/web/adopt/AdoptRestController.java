package org.protectedog.web.adopt;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.adopt.AdoptService;
import org.protectedog.service.domain.Adopt;
import org.protectedog.service.domain.Board;
import org.protectedog.service.domain.FileDog;
import org.protectedog.service.domain.Interest;
import org.protectedog.service.domain.User;
import org.protectedog.service.file.FileService;
import org.protectedog.service.interest.InterestService;
import org.protectedog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


//==> 분양|실종관리 RestController
@RestController
@RequestMapping("/adopt/*")
public class AdoptRestController {
	
	@Autowired
	@Qualifier("adoptServiceImpl")
	private AdoptService adoptService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("interestServiceImpl")
	private InterestService interestService;
	
	@Autowired
	@Qualifier("fileServiceImpl")
	private FileService fileService;
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['fundingPageSize']}")
	int pageSize;

		
	public AdoptRestController(){
		System.out.println(this.getClass());
	}
	

	
	
	// 관심목록 추가
//	@RequestMapping( value="json/addInterest/{postNo}/{id}", method=RequestMethod.GET)
//	public String addInterest( @PathVariable("postNo") int postNo , @PathVariable("id") String id ) throws Exception{
//		
//		System.out.println("/adopt/json/addInterest : GET");
//		Board board = new Board();
//		board.setPostNo(postNo);
//		
//		Interest interest = new Interest();
//		interest.setBoardCode("AD");
//		interest.setInterestId(userService.getUsers(id));
//		interest.setInterestPost(board);
//		
//		interestService.addInterest(interest);
//		
//		return "{\"message\" : \"insertOK\" }";
//	}
	
	
	// 관심목록삭제
//	@RequestMapping( value="json/delInterest/{postNo}/{id}", method=RequestMethod.GET)
//	public String delInterest( @PathVariable("postNo") int postNo , @PathVariable("id") String id ) throws Exception{
//		
//		System.out.println("/adopt/json/delInterest : GET");
//		
//		Map<String,Object> map = new HashMap<>();
//		map.put("id", id);
//		map.put("boardCode", "AD");
//		map.put("searchType", "post");
//		map.put("searchNo", postNo);
//		
//		interestService.delInterest(map);
//		
//		return "{\"message\" : \"delOK\" }";
//	}
	
	
	@RequestMapping( value="json/addAdopt", method=RequestMethod.POST )
	public String addAdopt( 
//			public void addAdopt(
					@RequestParam("files") List<MultipartFile> images,
					@RequestParam Map<String, Object> param
																										) throws Exception {

		System.out.println("/adopt/json/addAdopt : POST \n");
		MultipartFile image = images.get(0);
		String mainF = image.getOriginalFilename();
		Adopt adopt = new Adopt();

		
		adopt.setMainFile(mainF);
		
		adopt.setBoardCode(param.get("boardCode").toString());
		adopt.setId(param.get("id").toString());
		adopt.setPostContent(param.get("postContent").toString());
		adopt.setPhone(param.get("phone").toString());
		adopt.setLocationKr(param.get("locationKr").toString());
		adopt.setDogBreed(param.get("dogBreed").toString());
		adopt.setDogGender(param.get("dogGender").toString());
		adopt.setDogPay( Integer.parseInt(param.get("dogPay").toString()));
		adopt.setDogStatus(param.get("dogStatus").toString());
		adopt.setDogChar(param.get("dogChar").toString());
		adopt.setStatusCode("1");
//		adopt.setDogDate(    param.get("dogDate").toString()    );
//		adopt.setDogDate(  new Date( Integer.parseInt(  param.get("dogDate").toString().replace("-", "")  ) )  );
		
		adoptService.addAdopt(adopt);
		adopt = adoptService.getAdopt(adopt.getPostNo());
		
		
		User user = userService.getUsers(adopt.getId());
		user.setLevelPoint(user.getLevelPoint()+5);
		userService.updateUsers(user);
		
		
		List<FileDog> listFile = new ArrayList<FileDog>();
		
		// 파일디비에넣기
		FileDog files = new FileDog();
		files.setBoardCode(adopt.getBoardCode());
		files.setFileName(mainF);
		files.setFileCode(0);
		files.setPostNo(adopt.getPostNo());
		listFile.add(files);
		fileService.addFile(listFile);
		System.out.println("파일 확인 "+ files);
		
		return "{\"message\" : \"OK\" }";
	}
	
	
	// 글상태 완료로 변경
	@RequestMapping( value="json/updateStatusCode/{postNo}", method=RequestMethod.GET)
	public Adopt updateStatusCode( @PathVariable("postNo") int postNo ) throws Exception{

		System.out.println("/adopt/json/updateStatusCode : GET");
		
		Adopt adopt = adoptService.getAdopt(postNo);	// postNo로 adopt 가져오기	
		adopt.setStatusCode("3");						// 완료상태(3)로 필드값 변경
		adoptService.updateStatusCode(adopt);			// 디비 업데이트

		return adopt;
	}
	
	
	// 글 리스트 조회
	@SuppressWarnings("unchecked")
	@RequestMapping( value="json/listAdopt" )
	public JSONObject listAdopt( @ModelAttribute("search") Search search, @RequestBody Map<String,Object> params,
																			Model model, HttpSession session ) throws Exception{
		
		System.out.println("\n\n/adopt/json/listAdopt : GET / POST "+params.get("boardCode").toString());
		System.out.println(params);
		
		search.setSearchCondition( params.get("searchCondition").toString() );
		if(search.getSearchCondition() == null ) {
			search.setSearchCondition("");
		}
//		System.out.println("확인@@@@ : "+searchCondition+", "+searchKeyword);
		
		search.setSearchKeyword( params.get("searchKeyword").toString() );
		System.out.println("검색어 확인1 : "+search.getSearchKeyword());
		
		if(search.getSearchKeyword() == null ) {
			search.setSearchKeyword("");
//			if(searchKeyword != null) {
//				search.setSearchKeyword(searchKeyword);
//			}
		}
		System.out.println("검색어 확인2 : "+search.getSearchKeyword());
		search.setAreaCondition( params.get("areaCondition").toString() );
		if(search.getAreaCondition().equals("undefined") || search.getAreaCondition().equals("all")) {
			search.setAreaCondition("");
		}else if(search.getAreaCondition().equals("kw")) {
			search.setAreaCondition("강원");
		}else if(search.getAreaCondition().equals("kk")) {
			search.setAreaCondition("경기");
		}else if(search.getAreaCondition().equals("ks")) {
			search.setAreaCondition("경상");
		}else if(search.getAreaCondition().equals("kj")) {
			search.setAreaCondition("광주");
		}else if(search.getAreaCondition().equals("dj")) {
			search.setAreaCondition("대전");
		}else if(search.getAreaCondition().equals("bs")) {
			search.setAreaCondition("부산");
		}else if(search.getAreaCondition().equals("su")) {
			search.setAreaCondition("서울");
		}else if(search.getAreaCondition().equals("us")) {
			search.setAreaCondition("울산");
		}else if(search.getAreaCondition().equals("ic")) {
			search.setAreaCondition("인천");
		}else if(search.getAreaCondition().equals("jr")) {
			search.setAreaCondition("전라");
		}else if(search.getAreaCondition().equals("cc")) {
			search.setAreaCondition("충청");
		}
		search.setVoteCondition("");
		
		search.setCurrentPage( Integer.parseInt( params.get("pazeSize").toString() ) );
		System.out.println(search.getAreaCondition()+"◀확인▶"+Integer.parseInt( params.get("pazeSize").toString() ));
		
		search.setPageSize(pageSize);
		System.out.println("search 확인 : "+search);
		
		Map<String , Object> map=adoptService.listAdopt(search, params.get("boardCode").toString());
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		map.put("list", map.get("list"));
//		System.out.println("■■■■ 리스트 확인 : "+map.get("list"));

		JSONObject jsonObject = new JSONObject();
        jsonObject.put("list", map.get("list"));
        jsonObject.put("areaCondition", map.get("areaCondition"));
        jsonObject.put("startRowNum", map.get("startRowNum"));
        jsonObject.put("searchCondition", map.get("searchCondition"));
        jsonObject.put("endRowNum", map.get("endRowNum"));
        jsonObject.put("boardCode", map.get("boardCode"));
        jsonObject.put("searchKeyword", map.get("searchKeyword"));
        jsonObject.put("totalCount", map.get("totalCount"));

      
//        System.out.println("json5========================================================\n"+jsonObject);
      
		return jsonObject;
	}
	
	
	// 캘린더로 실종글 불러오기
	@SuppressWarnings("unchecked")
	@RequestMapping( value="json/listMissing/{boardCode}" )
	public JSONObject listMissing( @PathVariable("boardCode") String boardCode, Model model, HttpSession session ) throws Exception{
		
		System.out.println("\n\n/adopt/json/listMissing : GET / POST "+boardCode);
		
		Map<String , Object> map=adoptService.listMissing(boardCode);
		map.put("list", map.get("list"));
		System.out.println("■■■■ 리스트 확인 : "+map.get("list"));
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", map.get("list"));
		
//        System.out.println("json5========================================================\n"+jsonObject);
		
		return jsonObject;
	}
	
	// 후기등록 권한
	@SuppressWarnings("unchecked")
	@RequestMapping( value="json/listAdopt2/{id}" )
	public JSONObject listAdopt2( Model model, HttpSession session, @PathVariable("id") String id ) throws Exception{
		
		System.out.println("\n\n/adopt/json/listAdopt2 : GET / POST "+id);

		
		Map<String , Object> map=adoptService.listAdopt2(id);
		map.put("list", map.get("list"));
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", map.get("list"));
		
//        System.out.println("json5========================================================\n"+jsonObject);
		
		return jsonObject;
	}
	
}