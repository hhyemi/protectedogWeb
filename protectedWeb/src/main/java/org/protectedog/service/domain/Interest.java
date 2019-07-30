package org.protectedog.service.domain;

import java.util.Date;

public class Interest {
	
	/// Field
	private int interestNo;
	private Comment interestComment;
	private Board interestPost;
	private User interestId;
	private String boardCode;
	private Date regDate;
	
	/// Constructor
	
	/// Method
	public int getInterestNo() {
		return interestNo;
	}
	public void setInterestNo(int interestNo) {
		this.interestNo = interestNo;
	}
	public Comment getInterestComment() {
		return interestComment;
	}
	public void setInterestComment(Comment interestComment) {
		this.interestComment = interestComment;
	}
	public Board getInterestPost() {
		return interestPost;
	}
	public void setInterestPost(Board interestPost) {
		this.interestPost = interestPost;
	}
	public User getInterestId() {
		return interestId;
	}
	public void setInterestId(User interestId) {
		this.interestId = interestId;
	}
	public String getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "Interest [interestNo=" + interestNo + ", interestComment=" + interestComment + ", interestPost="
				+ interestPost + ", interestId=" + interestId + ", boardCode=" + boardCode + ", regDate=" + regDate + "]";
	}
	
	
}
