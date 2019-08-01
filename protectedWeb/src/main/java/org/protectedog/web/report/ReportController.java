package org.protectedog.web.report;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.domain.FileDog;
import org.protectedog.service.domain.Report;
import org.protectedog.service.domain.User;
import org.protectedog.service.file.FileService;
import org.protectedog.service.report.ReportService;
import org.protectedog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/report/*")
public class ReportController {
	
	///Field
	@Autowired
	@Qualifier("reportServiceImpl")
	private ReportService reportService;
	
	@Autowired
	@Qualifier("fileServiceImpl")
	private FileService fileService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
	///Constructor
	public ReportController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	///Paging�� ���� Value����
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	///File Upload�� ���� path, �Խ��� Code ����
	@Value("#{commonProperties['flieReport']}")
	String fileroot;
	@Value("#{commonProperties['report']}")
	String reportBoardCode;
	
	///Method
	@RequestMapping(value="addReport", method=RequestMethod.GET)
	public String addReport(@RequestParam("id") String id) throws Exception{
		
		System.out.println("/report/addReport : GET");
		
		return "/report/addReport?reportedId="+id;
		
	} 
	
	@RequestMapping(value="addReport", method=RequestMethod.POST)
	public String addReport(@ModelAttribute("report") Report report, 
							@RequestParam("multiFile") ArrayList<String> multiFile) throws Exception{

		System.out.println("/report/addReport : POST");
		
		reportService.addReport(report);
		System.out.println("addReport add? : "+report);
		
		report=reportService.getReport(report.getReportNo());
		System.out.println("addReport reportNo : "+report);
		
		List<FileDog> listFile = new ArrayList<FileDog>();
		
		// ���ϵ�񿡳ֱ�
		for (String fileName : multiFile) {
		
			if (fileName != null && fileName.length() > 0) {
		
					FileDog files = new FileDog();
					files.setBoardCode(reportBoardCode);
					files.setFileName(fileName);
					files.setFileCode(0);
					files.setPostNo(report.getReportNo());
					System.out.println("addReport postNo : "+report.getReportNo());
					listFile.add(files);
					System.out.println("addReport listFile : "+listFile.toString());
			}
		}
		
		fileService.addFile(listFile);
		
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
//		System.out.println("Coupon ����Ʈ : "+map.toString());
		
		Page resultPage=new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println("Coupon ����Ʈ ������ : "+resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/report/listReport.jsp";
		
	}
	
	@RequestMapping(value="getReport")
	public String getReport(@RequestParam("reportNo") int reportNo, Model model) throws Exception{
		
		System.out.println("/report/getReport");
		
		Report report=reportService.getReport(reportNo);
		
		Map<String, Object> filePost = new HashMap<String, Object>();
		filePost.put("boardCode", reportBoardCode);
		filePost.put("postNo", reportNo);
		List<FileDog> file = fileService.getFile(filePost);
		
		model.addAttribute("report", report);
		model.addAttribute("file", file);
		
		return "forward:/report/getReportView.jsp";
		
	}
	
	@RequestMapping(value="updateReport", method=RequestMethod.POST)
	public String updateReport(@ModelAttribute("report") Report report, 
								@RequestParam("reportedId") String reportedId,
								@RequestParam("addPoint") int addPoint,
								Model model) throws Exception{
		
		System.out.println("/report/updateReport");
		System.out.println("updateReport report값 : "+report);
		
		report=reportService.getReport(report.getReportNo());

		reportService.updateReportStatus(report);
		System.out.println("updateReport report값1 : "+report);
		
		if(reportedId == null) {
			System.out.println("updateReport 비처리 입장 : "+report);
			return "forward:/report/listReport";
		}else {
			if(addPoint == -1) {
				System.out.println("updateReport 블랙처리 입장 : "+report);
				User user=userService.getUsers(reportedId);
				user.setLevelPoint(-1);
				userService.updateUsers(user);
				System.out.println("updateReport 블랙처리 퇴장 : "+user);
			} else {
				System.out.println("updateReport 점수깎기 입장 : "+report);
				User user=userService.getUsers(reportedId);
				int levelPoint=user.getLevelPoint();
				user.setLevelPoint(levelPoint-addPoint);
				userService.updateUsers(user);
				System.out.println("updateReport 점수깎기 입장 : "+user);
			}
		}
		return "forward:/report/listReport";
		
	}
	
}
