package org.protectedog.web.storyfunding;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.protectedog.service.storyfunding.FundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/funding/*")
public class FundingRestController {

	/// Field
	@Autowired
	@Qualifier("fundingServiceImpl")
	private FundingService fundingService;

	public FundingRestController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['fileroot']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	String fileroot;

	@RequestMapping(value="json//imageupload",method=RequestMethod.POST)
	public int multiImageUpload(@RequestParam("files")List<MultipartFile> images) {
		
		System.out.println("/product/json/imageupload : POST");
		
		
		 for(MultipartFile image : images) {
			 
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
		
		return 1;
	}

}
