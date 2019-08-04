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
	private int voteViewCount;
	private int voterCount;
	private Date voteStartDate;
	private Date voteEndDate;
	private int fundTargetPay;
	private int voteTargetCount;
	private int fundTargetDay;
	private int fundViewCount;
	private int sponsorCount;
	private int fundPay;
	private Date fundStartDate;
	private Date fundEndDate;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewRegDate;

	// DB���� ���� �ִ� �ʵ�
	// ��ǥ ���� ��¥
	private int voteRemainDate;
	// �Ŀ� ���� ��¥
	private int fundRemainDate;
	// ��ǥ��
	private int VoteRate;
	// �Ŀ���
	private int FundRate;
	// ��ǥ�̹���
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

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewRegDate() {
		return reviewRegDate;
	}

	public void setReviewRegDate(Date reviewRegDate) {
		this.reviewRegDate = reviewRegDate;
	}

	public int getVoteViewCount() {
		return voteViewCount;
	}

	public void setVoteViewCount(int voteViewCount) {
		this.voteViewCount = voteViewCount;
	}

	public int getFundViewCount() {
		return fundViewCount;
	}

	public void setFundViewCount(int fundViewCount) {
		this.fundViewCount = fundViewCount;
	}


	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Funding [postNo=" + postNo + ", id=" + id + ", nickname=" + nickname + ", statusCode=" + statusCode
				+ ", phone=" + phone + ", postTitle=" + postTitle + ", postContent=" + postContent + ", voteViewCount="
				+ voteViewCount + ", voterCount=" + voterCount + ", voteStartDate=" + voteStartDate + ", voteEndDate="
				+ voteEndDate + ", fundTargetPay=" + fundTargetPay + ", voteTargetCount=" + voteTargetCount
				+ ", fundTargetDay=" + fundTargetDay + ", fundViewCount=" + fundViewCount + ", sponsorCount="
				+ sponsorCount + ", fundPay=" + fundPay + ", fundStartDate=" + fundStartDate + ", fundEndDate="
				+ fundEndDate + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent + ", reviewRegDate="
				+ reviewRegDate + ", voteRemainDate=" + voteRemainDate + ", fundRemainDate=" + fundRemainDate
				+ ", VoteRate=" + VoteRate + ", FundRate=" + FundRate + ", mainFile=" + mainFile + "]";
	}



}
