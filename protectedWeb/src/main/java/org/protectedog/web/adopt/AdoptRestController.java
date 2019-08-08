package org.protectedog.web.adopt;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.protectedog.common.Search;
import org.protectedog.service.adopt.AdoptService;
import org.protectedog.service.domain.Adopt;
import org.protectedog.service.domain.FileDog;
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
	
	
	@SuppressWarnings("deprecation")
	@RequestMapping( value="json/addMissing", method=RequestMethod.POST )
	public String addMissing( 
									@RequestParam("files") List<MultipartFile> images
									,@RequestParam Map<String, Object> param
																										) throws Exception {

		System.out.println("/adopt/json/addMissing : POST \n");
		MultipartFile image = images.get(0);
		String mainF = image.getOriginalFilename();
		Adopt adopt = new Adopt();
		
		adopt.setMainFile(mainF);
		
		adopt.setBoardCode(param.get("boardCode").toString());
		adopt.setId(param.get("id").toString());
		adopt.setNickname(param.get("nickname").toString());
		adopt.setPostContent(param.get("postContent").toString());
		adopt.setPhone(param.get("phone").toString());
		adopt.setLocationKr(param.get("locationKr").toString());
		adopt.setDogBreed(param.get("dogBreed").toString());
		adopt.setDogGender(param.get("dogGender").toString());
		adopt.setDogPay( Integer.parseInt(param.get("dogPay").toString()));
		adopt.setDogStatus(param.get("dogStatus").toString());
		adopt.setDogChar(param.get("dogChar").toString());
		adopt.setStatusCode("1");
		adopt.setDogDate(  new Date( Integer.parseInt(param.get("dogDate").toString().split("-")[0])-1900, Integer.parseInt(param.get("dogDate").toString().split("-")[1])-1 , Integer.parseInt(param.get("dogDate").toString().split("-")[2]) )  );
		

		adoptService.addAdopt(adopt);
		adopt = adoptService.getAdopt(adopt.getPostNo());
		
		User user = userService.getUsers(adopt.getId());
		if ( ! user.getLevels().equals("미인증회원")) {
			user.setLevelPoint(user.getLevelPoint()+5);
			userService.updateUsers(user);
		}

		
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
	
	
	// 실종글 가져와서 모달에 띄우기(update하려고)
	@RequestMapping( value="json/getMissing/{postNo}", method=RequestMethod.GET)
	public Adopt  getMissing( @PathVariable("postNo") int postNo ) throws Exception{
		
		System.out.println("/adopt/json/getMissing : GET");

		return adoptService.getAdopt(postNo);
	}
	
	
	@SuppressWarnings("deprecation")
	@RequestMapping( value="json/updateMissing", method=RequestMethod.POST )
	public String updateMissing( 
									@RequestParam(value="files", required = false ) List<MultipartFile> images
									,@RequestParam Map<String, Object> param
																										) throws Exception {

		System.out.println("/adopt/json/updateMissing : POST \n");
		
		String mainF = "";
		Adopt adopt = new Adopt();
		
		// 이미지 수정 했을 때
		if (   !(images.isEmpty())  ) {
			MultipartFile image = images.get(0);
			mainF = image.getOriginalFilename();
			adopt.setMainFile(mainF);		
		} else {
			adopt.setMainFile( adoptService.getAdopt(Integer.parseInt(param.get("postNo").toString())).getMainFile()  );
		}
		
		
		adopt.setPostContent(param.get("postContent").toString());
		adopt.setPhone(param.get("phone").toString());
		adopt.setLocationKr(param.get("locationKr").toString());
		adopt.setDogBreed(param.get("dogBreed").toString());
		adopt.setDogGender(param.get("dogGender").toString());
		adopt.setDogPay( Integer.parseInt(param.get("dogPay").toString()));
		adopt.setDogStatus(param.get("dogStatus").toString());
		adopt.setDogChar(param.get("dogChar").toString());
		adopt.setPostNo( Integer.parseInt(param.get("postNo").toString()));
		adopt.setDogDate(  new Date( Integer.parseInt(param.get("dogDate").toString().split("-")[0])-1900, Integer.parseInt(param.get("dogDate").toString().split("-")[1])-1 , Integer.parseInt(param.get("dogDate").toString().split("-")[2]) )  );
	
		adoptService.updateAdopt(adopt);
		adopt = adoptService.getAdopt(adopt.getPostNo());
		
		
		if (   !(images.isEmpty())  ) {
			List<FileDog> listFile = new ArrayList<FileDog>();
			// 파일디비에넣기
			FileDog files = new FileDog();
			files.setBoardCode("MS");
			files.setFileName(mainF);
			files.setFileCode(0);
			files.setPostNo( adopt.getPostNo());
			listFile.add(files);
			fileService.addFile(listFile);
			System.out.println("파일 확인 "+ files);
		}
		
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
		
		System.out.println("\n\n/adopt/json/listAdopt : GET / POST ");

		
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
		
		if( params.get("areaCondition") == null || params.get("areaCondition").toString().equals("")|| params.get("areaCondition").toString().equals("undefined") || params.get("areaCondition").toString().equals("all")) {
			search.setAreaCondition("");
		} else {
			search.setAreaCondition( params.get("areaCondition").toString() );
		}
		
		search.setVoteCondition("");
		
		search.setCurrentPage( Integer.parseInt( params.get("pazeSize").toString() ) );
		System.out.println(search.getAreaCondition()+"◀확인▶"+Integer.parseInt( params.get("pazeSize").toString() ));
		
		search.setPageSize(pageSize);
		System.out.println("search 확인 : "+search);
		
		Map<String , Object> map=adoptService.listAdopt(search, "AD");
//		Map<String , Object> map=adoptService.listAdopt(search, params.get("boardCode").toString());
//		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		map.put("list", map.get("list"));
		System.out.println("■■■■ 리스트 확인 : "+map.get("list"));

		JSONObject jsonObject = new JSONObject();
        jsonObject.put("list", map.get("list"));
        jsonObject.put("areaCondition", map.get("areaCondition"));
        jsonObject.put("startRowNum", map.get("startRowNum"));
        jsonObject.put("searchCondition", map.get("searchCondition"));
        jsonObject.put("endRowNum", map.get("endRowNum"));
        jsonObject.put("boardCode", map.get("boardCode"));
        jsonObject.put("searchKeyword", map.get("searchKeyword"));
        jsonObject.put("totalCount", map.get("totalCount"));

      
        System.out.println("json5========================================================\n"+jsonObject);
      
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