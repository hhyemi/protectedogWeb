package org.protectedog.service.report;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Report;

public interface ReportService {

	// 신고글등록
	public void addReport(Report report) throws Exception;
	
	// 신고글상세보기
	public Report getReport(int reportNo) throws Exception;
	
	// 신고글목록조회
	public Map<String, Object> getReportList(Search search) throws Exception;
	
	// 신고글상태변경
	public void updateReportStatus(Report report) throws Exception;
	
	
	
}
