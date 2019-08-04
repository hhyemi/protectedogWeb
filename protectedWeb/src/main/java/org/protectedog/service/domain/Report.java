package org.protectedog.service.domain;

import java.util.Date;

public class Report {

	///Field
	private int reportNo;
	private String reporterNick;
	private String reportedNick;
	private String reportCategory;
	private String reportContent;
	private int reportStatus;
	private Date reportDate;
	private String delCode;
	
	///Constructor
	
	///Method
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public String getReporterNick() {
		return reporterNick;
	}
	public void setReporterNick(String reporterNick) {
		this.reporterNick = reporterNick;
	}
	public String getReportedNick() {
		return reportedNick;
	}
	public void setReportedNick(String reportedNick) {
		this.reportedNick = reportedNick;
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
	public String getDelCode() {
		return delCode;
	}
	public void setDelCode(String delCode) {
		this.delCode = delCode;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reporterNick=" + reporterNick + ", reportedNick=" + reportedNick
				+ ", reportCategory=" + reportCategory + ", reportContent=" + reportContent + ", reportStatus="
				+ reportStatus + ", reportDate=" + reportDate + ", delCode=" + delCode + "]";
	}


	
	
}
