package org.protectedog.web.user;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Report;
import org.protectedog.service.report.ReportService;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/report/*")
public class ReportController {
	
	///Field
	@Autowired
	@Qualifier("reportServiceImpl")
	private ReportService reportService;
	
	
	///Constructor
	public ReportController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	///Paging을 위한 Value설정
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	@Value("{commonProperties['flieReport']}")
	String fileReportRoot;
	
	///Method
	@RequestMapping(value="addReport", method=RequestMethod.GET)
	public String addReport(@RequestParam("id") String id) throws Exception{
		
		System.out.println("/report/addReport : GET");
		
		return "/report/addReport?reportedId="+id;
		
	} 
	
	@RequestMapping(value="addReport", method=RequestMethod.POST)
	public String addReport(@ModelAttribute("report") Report report, 
							HttpServletRequest req, 
							MultipartHttpServletRequest request ) throws Exception{

		System.out.println("/report/addReport : POST");
		
		String fileName=req.getParameter("multiFile");
		System.out.println("multiFile : "+fileName);
		if(fileName != null) {
			String[] files=fileName.split(",");
			report.setFile1(files[0]);
			if(files.length > 1) {
				report.setFile2(files[1]);
				if(files.length > 2) {
					report.setFile3(files[2]);
				}
			}
		};

		//현재 파일업로드는 안됨
		String path=fileReportRoot;
		List<MultipartFile> fileList=request.getFiles("multiFile");
		for(MultipartFile mf : fileList) {
			
			String originFile=mf.getOriginalFilename();
			long fileSize=mf.getSize();
			
			System.out.println("fileName : "+originFile);
			System.out.println("fileSize : "+fileSize);
			
			String safeFile=path+System.currentTimeMillis()+originFile;
			
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException ie) {
				ie.printStackTrace();
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}
		}
		
		reportService.addReport(report);
		
		request.setAttribute("report", report);
		
		System.out.println("report : "+request.getRequestURI());
		
		return "redirect:/index.jsp";
		
		
	}
	
	
	@RequestMapping(value="listReport")
	public String listReport(@ModelAttribute("search") Search search, Model model, HttpSession session) throws Exception{
		
		System.out.println("/report/listReport");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map=reportService.getReportList(search);
		System.out.println("Coupon 리스트 : "+map.toString());
		
		Page resultPage=new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("Coupon 리스트 페이지 : "+resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/report/listReportView.jsp";
		
	}
	
	@RequestMapping(value="getReport")
	public String getReport(@RequestParam("reportNo") int reportNo, Model model) throws Exception{
		
		System.out.println("/report/getReport");
		
		Report report=reportService.getReport(reportNo);
		
		model.addAttribute("report", report);
		
		return "forward:/report/getReportView.jsp";
		
	}
	
	@RequestMapping(value="updateReport")
	public String updateReport(@ModelAttribute("report") Report report, 
								@RequestParam("reportStatus") int reportStatus, 
								@RequestParam("delCode") char delCode, 
								@RequestParam("reportNo") int reportNo, 
								Model model) throws Exception{
		
		System.out.println("/report/updateReport");
		
		report=reportService.getReport(reportNo);
		report.setReportStatus(reportStatus);
		report.setDelCode(delCode);
		
		reportService.updateReportStatus(report);
		
		return "forward:/report/listReport";
		
	}
	
}
