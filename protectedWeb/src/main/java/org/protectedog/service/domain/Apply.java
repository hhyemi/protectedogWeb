package org.protectedog.service.domain;

import java.sql.Date;


//==>È¸¿øÁ¤º¸¸¦ ¸ðµ¨¸µ(Ãß»óÈ­/Ä¸½¶È­)ÇÑ Bean
public class Apply {
	
	///Field
	private int applyNo;
	private int adoptNo;
	private String id;
	private String phone;
	private int job;
	private int addr;
	private int mate;
	private int mateAgree;
	private int raise;
	private int currently;
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
	public int getJob() {
		return job;
	}
	public void setJob(int job) {
		this.job = job;
	}
	public int getAddr() {
		return addr;
	}
	public void setAddr(int addr) {
		this.addr = addr;
	}
	public int getMate() {
		return mate;
	}
	public void setMate(int mate) {
		this.mate = mate;
	}
	public int getMateAgree() {
		return mateAgree;
	}
	public void setMateAgree(int mateAgree) {
		this.mateAgree = mateAgree;
	}
	public int getRaise() {
		return raise;
	}
	public void setRaise(int raise) {
		this.raise = raise;
	}
	public int getCurrently() {
		return currently;
	}
	public void setCurrently(int currently) {
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
