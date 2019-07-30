package org.protectedog.service.domain;

import java.sql.Date;


//==>회원정보를 모델링(추상화/캡슐화)한 Bean
public class Apply {
	
	///Field
	private int applyNo;
	private int adoptNo;
	private String id;
	private String phone;
	private String job;
	private String addr;
	private String mate;
	private String mateAgree;
	private String raise;
	private String currently;
	private String plan;
	private String pay;
	private String reason;
	private String situation;
	private Date regDate;
	private String statusCode;
	
	
	public int getAdoptNo() {
		return adoptNo;
	}
	public void setAdoptNo(int adoptNo) {
		this.adoptNo = adoptNo;
	}
	public int getApplyNo() {
		return applyNo;
	}
	public void setApplyNo(int applyNo) {
		this.applyNo = applyNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMate() {
		return mate;
	}
	public void setMate(String mate) {
		this.mate = mate;
	}
	public String getMateAgree() {
		return mateAgree;
	}
	public void setMateAgree(String mateAgree) {
		this.mateAgree = mateAgree;
	}
	public String getRaise() {
		return raise;
	}
	public void setRaise(String raise) {
		this.raise = raise;
	}
	public String getCurrently() {
		return currently;
	}
	public void setCurrently(String currently) {
		this.currently = currently;
	}
	public String getPlan() {
		return plan;
	}
	public void setPlan(String plan) {
		this.plan = plan;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getSituation() {
		return situation;
	}
	public void setSituation(String situation) {
		this.situation = situation;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public String getStatusCode() {
		return statusCode;
	}
	
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	
	
	
	@Override
	public String toString() {
		return "Apply [adoptNo=" + adoptNo + ", applyNo=" + applyNo + ", id=" + id + ", phone=" + phone + ", job=" + job
				+ ", addr=" + addr + ", mate=" + mate + ", mateAgree=" + mateAgree + ", raise=" + raise + ", currently="
				+ currently + ", plan=" + plan + ", pay=" + pay + ", reason=" + reason + ", situation=" + situation
				+ ", regDate=" + regDate + ", statusCode=" + statusCode + "]";
	}
	
	
	

}