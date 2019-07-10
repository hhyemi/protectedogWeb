package org.protectedog.service.domain;

import java.sql.Date;

public class StoryFunding {
	
	private String postNo;
	private String statusCode;
	private String id;
	private String nickName;	
	private String phone;
	private String postTitle;
	private String postContent;
	private int viewCount;
	private int voteTargetCount;
	private int voterCount;
	private Date voteStartDate;
	private Date voteEndDate;
	private int fundTargetPay;
	private int sponsorCount;
	private int fundPay;
	private Date fundStartDate;
	private Date fundEndDate;

	
	//DB에는 없고 있는 필드
	//투표 남은 날짜 
	private Date voteRemainDate;
	//후원 남은 날짜 
	private Date fundRemainDate;
	
	
	public StoryFunding() {
	}


	public String getPostNo() {
		return postNo;
	}


	public void setPostNo(String postNo) {
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

}
