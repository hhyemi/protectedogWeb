package org.protectedog.service.domain;

public class Report {

	///Field
	private int reportNo;
	private User reporter;
	private User reported;
	private String reportCategory;
	private String reportContent;
	private int reportStatus;
	private String delCode;
	
	///Constructor
	
	///Method
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public User getReporter() {
		return reporter;
	}
	public void setReporter(User reporter) {
		this.reporter = reporter;
	}
	public User getReported() {
		return reported;
	}
	public void setReported(User reported) {
		this.reported = reported;
	}
	public String getReportCategory() {
		return reportCategory;
	}
	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public int getReportStatus() {
		return reportStatus;
	}
	public void setReportStatus(int reportStatus) {
		this.reportStatus = reportStatus;
	}
	public String getDelCode() {
		return delCode;
	}
	public void setDelCode(String delCode) {
		this.delCode = delCode;
	}
	
	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reporter=" + reporter + ", reported=" + reported
				+ ", reportCategory=" + reportCategory + ", reportContent=" + reportContent + ", reportStatus="
				+ reportStatus + ", delCode=" + delCode + "]";
	}
	
	
}
