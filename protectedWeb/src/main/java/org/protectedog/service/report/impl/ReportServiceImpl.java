package org.protectedog.service.report.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Report;
import org.protectedog.service.report.ReportDAO;
import org.protectedog.service.report.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("reportServiceImpl")
public class ReportServiceImpl implements ReportService{

	///Field
	@Autowired
	@Qualifier("reportDAOImpl")
	private ReportDAO reportDAO;
	public void setReportDAO(ReportDAO reportDAO) {
		this.reportDAO = reportDAO;
	}
	
	///Constructor
	public ReportServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addReport(Report report) throws Exception {
		// TODO Auto-generated method stub
		reportDAO.addReport(report);
	}

	@Override
	public Report getReport(int reportNo) throws Exception {
		// TODO Auto-generated method stub
		return reportDAO.getReport(reportNo);
	}

	@Override
	public Map<String, Object> getReportList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Report> list=reportDAO.getReportList(search);
		int totalCount=reportDAO.getTotalCount(search);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;
	}

	@Override
	public void updateReportStatus(Report report) throws Exception {
		// TODO Auto-generated method stub
		reportDAO.updateReportStatus(report);
	}

}
