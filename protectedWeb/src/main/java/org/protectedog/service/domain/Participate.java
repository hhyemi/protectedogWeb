package org.protectedog.service.domain;

import java.sql.Date;

public class Participate {

	private int participateNo;
	private String id;
	private String nickName;
	private int postNo;
	private Date regDate;
	private int fundPay;

	public Participate() {
	}

	public int getParticipateNo() {
		return participateNo;
	}

	public void setParticipateNo(int participateNo) {
		this.participateNo = participateNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getFundPay() {
		return fundPay;
	}

	public void setFundPay(int fundPay) {
		this.fundPay = fundPay;
	}

	@Override
	public String toString() {
		return "Participate [participateNo=" + participateNo + ", id=" + id + ", nickName=" + nickName + ", postNo="
				+ postNo + ", regDate=" + regDate + ", fundPay=" + fundPay + "]";
	}

}
