package org.protectedog.service.domain;

import java.sql.Date;

public class Funding {

	private int postNo;
	private String id;
	private String nickname;
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
	private int voteRemainDate;
	// 후원 남은 날짜
	private int fundRemainDate;
	// 투표율
	private int VoteRate;
	// 후원율
	private int FundRate;
	// 대표이미지
	private String mainFile;

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

	public int getVoteRemainDate() {
		return voteRemainDate;
	}

	public void setVoteRemainDate(int voteRemainDate) {
		this.voteRemainDate = voteRemainDate;
	}

	public int getFundRemainDate() {
		return fundRemainDate;
	}

	public void setFundRemainDate(int fundRemainDate) {
		this.fundRemainDate = fundRemainDate;
	}

	public int getVoteRate() {
		return VoteRate;
	}

	public void setVoteRate(int voteRate) {
		VoteRate = voteRate;
	}

	public String getMainFile() {
		return mainFile;
	}

	public void setMainFile(String mainFile) {
		this.mainFile = mainFile;
	}

	public int getFundRate() {
		return FundRate;
	}

	public void setFundRate(int fundRate) {
		FundRate = fundRate;
	}


	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "Funding [postNo=" + postNo + ", id=" + id + ", nickname=" + nickname + ", statusCode=" + statusCode
				+ ", phone=" + phone + ", postTitle=" + postTitle + ", postContent=" + postContent + ", viewCount="
				+ viewCount + ", voterCount=" + voterCount + ", voteStartDate=" + voteStartDate + ", voteEndDate="
				+ voteEndDate + ", fundTargetPay=" + fundTargetPay + ", voteTargetCount=" + voteTargetCount
				+ ", fundTargetDay=" + fundTargetDay + ", sponsorCount=" + sponsorCount + ", fundPay=" + fundPay
				+ ", fundStartDate=" + fundStartDate + ", fundEndDate=" + fundEndDate + ", phone1=" + phone1
				+ ", phone2=" + phone2 + ", phone3=" + phone3 + ", voteRemainDate=" + voteRemainDate
				+ ", fundRemainDate=" + fundRemainDate + ", VoteRate=" + VoteRate + ", FundRate=" + FundRate
				+ ", mainFile=" + mainFile + "]";
	}
}
