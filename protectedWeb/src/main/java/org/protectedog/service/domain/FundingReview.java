package org.protectedog.service.domain;

import java.sql.Date;

public class FundingReview {

	private String postNo;
	private String id;
	private String nickName;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewRegDate;

	public FundingReview() {
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

	@Override
	public String toString() {
		return "StoryFundingReview [postNo=" + postNo + ", id=" + id + ", nickName=" + nickName + ", reviewTitle="
				+ reviewTitle + ", reviewContent=" + reviewContent + ", reviewRegDate=" + reviewRegDate + "]";
	}

	

}
