package org.protectedog.web.storyfunding;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.protectedog.service.file.FileService;
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

	@Value("#{commonProperties['fileSF']}")
	String fileroot;

	@RequestMapping(value = "json/imageupload", method = RequestMethod.POST)
	public void imageupload(@RequestParam("files") List<MultipartFile> images) throws Exception {

		System.out.println("/product/json/imageupload : POST");

		for (MultipartFile image : images) {
			String fileName = image.getOriginalFilename();

			// 이클립스에 저장
			File f = new File(fileroot, fileName);

			try {
				image.transferTo(f);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
