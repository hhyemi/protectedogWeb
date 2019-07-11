package org.protectedog.service.domain;

import java.util.Date;

public class Report {

	///Field
	private int reportNo;
	private User reporter;
	private User reported;
	private String reportCategory;
	private String reportContent;
	private int reportStatus;
	private Date reportDate;
	private char delCode;
	private String file1;
	private String file2;
	private String file3;
	
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
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public char getDelCode() {
		return delCode;
	}
	public void setDelCode(char delCode) {
		this.delCode = delCode;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getFile2() {
		return file2;
	}
	public void setFile2(String file2) {
		this.file2 = file2;
	}
	public String getFile3() {
		return file3;
	}
	public void setFile3(String file3) {
		this.file3 = file3;
	}
	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reporter=" + reporter + ", reported=" + reported
				+ ", reportCategory=" + reportCategory + ", reportContent=" + reportContent + ", reportStatus="
				+ reportStatus + ", reportDate=" + reportDate + ", delCode=" + delCode + ", file1=" + file1 + ", file2="
				+ file2 + ", file3=" + file3 + "]";
	}


	
	
}
