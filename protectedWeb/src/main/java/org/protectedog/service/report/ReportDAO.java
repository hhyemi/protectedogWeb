package org.protectedog.service.report;

import java.util.List;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Report;

public interface ReportDAO {

	// Insert
	public void addReport(Report report) throws Exception;
	
	// Select One
	public Report getReport(int reportNo) throws Exception;
	
	// Select List
	public List<Report> getReportList(Search search) throws Exception;
	
	// Update
	public void updateReportStatus(Report report) throws Exception;
	
	// List Paging
	public int getTotalCount(Search search) throws Exception;
	
}
