package org.protectedog.service.domain;

import java.sql.Date;

public class Participate {

	private int participateNo;
	private String id;
	private String nickname;
	private int postNo;
	private Date regDate;
	private int fundPay;
	private String statusCode;
	private String paymentCode;

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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(String paymentCode) {
		this.paymentCode = paymentCode;
	}

	@Override
	public String toString() {
		return "Participate [participateNo=" + participateNo + ", id=" + id + ", nickname=" + nickname + ", postNo="
				+ postNo + ", regDate=" + regDate + ", fundPay=" + fundPay + ", statusCode=" + statusCode
				+ ", paymentCode=" + paymentCode + "]";
	}

}
