package org.protectedog.service.domain;

import java.sql.Date;

public class Interest {
	
	/// Field
	private int interestNo;
	private int commentNo;
	private int postNo;
	private String id;
	private char boardCode;
	private Date regDate;
	
	/// Constructor
	
	/// Method
	public int getInterestNo() {
		return interestNo;
	}
	public void setInterestNo(int interestNo) {
		this.interestNo = interestNo;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public char getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(char boardCode) {
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
		return "Interest [interestNo=" + interestNo + ", commentNo=" + commentNo + ", postNo=" + postNo + ", id=" + id
				+ ", boardCode=" + boardCode + ", regDate=" + regDate + "]";
	}	
}
