package org.protectedog.service.domain;

import java.sql.Date;

public class StoryFundingReview {
		
	private String postNo;
	private String id;
	private String nickName;		
	private String reviewTitle;
	private String reviewContent;
	private Date reviewRegDate;
	private String reviewDelCode;
	
	public StoryFundingReview() {
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
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

	public String getReviewDelCode() {
		return reviewDelCode;
	}

	public void setReviewDelCode(String reviewDelCode) {
		this.reviewDelCode = reviewDelCode;
	}
	
	
	
}
