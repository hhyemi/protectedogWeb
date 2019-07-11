package org.protectedog.service.domain;

import java.sql.Date;

public class Funding {

	private int postNo;
	private String id;
	private String nickName;
	private String statusCode;
	private String phone;
	private String postTitle;
	private String postContent;
	private int viewCount;
	private int voterCount;
	private Date voteStartDate;
	private Date voteEndDate;
	private int fundTargetPay;
	private int voteTargetCount;
	private int fundTargetDay;
	private int sponsorCount;
	private int fundPay;
	private Date fundStartDate;
	private Date fundEndDate;

	// DB에는 없고 있는 필드
	// 전화번호 3칸
	private String phone1;
	private String phone2;
	private String phone3;
	// 투표 남은 날짜
	private Date voteRemainDate;
	// 후원 남은 날짜
	private Date fundRemainDate;

	public Funding() {
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
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
		/////////////// EL 적용 위해 추가 ///////////
		if (phone != null && phone.length() != 0) {
			phone1 = phone.split("-")[0];
			phone2 = phone.split("-")[1];
			phone3 = phone.split("-")[2];
		}
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getVoteTargetCount() {
		return voteTargetCount;
	}

	public void setVoteTargetCount(int voteTargetCount) {
		this.voteTargetCount = voteTargetCount;
	}

	public int getVoterCount() {
		return voterCount;
	}

	public void setVoterCount(int voterCount) {
		this.voterCount = voterCount;
	}

	public Date getVoteStartDate() {
		return voteStartDate;
	}

	public void setVoteStartDate(Date voteStartDate) {
		this.voteStartDate = voteStartDate;
	}

	public Date getVoteEndDate() {
		return voteEndDate;
	}

	public void setVoteEndDate(Date voteEndDate) {
		this.voteEndDate = voteEndDate;
	}

	public int getFundTargetPay() {
		return fundTargetPay;
	}

	public void setFundTargetPay(int fundTargetPay) {
		this.fundTargetPay = fundTargetPay;
	}

	public int getSponsorCount() {
		return sponsorCount;
	}

	public void setSponsorCount(int sponsorCount) {
		this.sponsorCount = sponsorCount;
	}

	public int getFundPay() {
		return fundPay;
	}

	public void setFundPay(int fundPay) {
		this.fundPay = fundPay;
	}

	public int getFundTargetDay() {
		return fundTargetDay;
	}

	public void setFundTargetDay(int fundTargetDay) {
		this.fundTargetDay = fundTargetDay;
	}

	public Date getFundStartDate() {
		return fundStartDate;
	}

	public void setFundStartDate(Date fundStartDate) {
		this.fundStartDate = fundStartDate;
	}

	public Date getFundEndDate() {
		return fundEndDate;
	}

	public void setFundEndDate(Date fundEndDate) {
		this.fundEndDate = fundEndDate;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public Date getVoteRemainDate() {
		return voteRemainDate;
	}

	public void setVoteRemainDate(Date voteRemainDate) {
		this.voteRemainDate = voteRemainDate;
	}

	public Date getFundRemainDate() {
		return fundRemainDate;
	}

	public void setFundRemainDate(Date fundRemainDate) {
		this.fundRemainDate = fundRemainDate;
	}

	@Override
	public String toString() {
		return "StoryFunding [postNo=" + postNo + ", id=" + id + ", nickName=" + nickName + ", statusCode=" + statusCode
				+ ", phone=" + phone + ", postTitle=" + postTitle + ", postContent=" + postContent + ", viewCount="
				+ viewCount + ", voteTargetCount=" + voteTargetCount + ", voterCount=" + voterCount + ", voteStartDate="
				+ voteStartDate + ", voteEndDate=" + voteEndDate + ", fundTargetPay=" + fundTargetPay
				+ ", fundTargetDay=" + fundTargetDay + ", sponsorCount=" + sponsorCount + ", fundPay=" + fundPay
				+ ", fundStartDate=" + fundStartDate + ", fundEndDate=" + fundEndDate + ", phone1=" + phone1
				+ ", phone2=" + phone2 + ", phone3=" + phone3 + ", voteRemainDate=" + voteRemainDate
				+ ", fundRemainDate=" + fundRemainDate + "]";
	}

	
}
