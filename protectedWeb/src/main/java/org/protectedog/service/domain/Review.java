package org.protectedog.service.domain;

import java.sql.Date;

public class Review {

	/// Field
	private int postNo;
	private String id;
	private String nickName;
	private String boardCode;
	private String postTitle;
	private String postContent;
	private Date regDate;
	private String statusCode;

	// nullable
	private int grade;
	private String hospitalName;
	private int orderNo;

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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	@Override
	public String toString() {
		return "Review [postNo=" + postNo + ", id=" + id + ", nickName=" + nickName + ", boardCode=" + boardCode
				+ ", postTitle=" + postTitle + ", postContent=" + postContent + ", regDate=" + regDate + ", statusCode="
				+ statusCode + ", grade=" + grade + ", hospitalName=" + hospitalName + ", orderNo=" + orderNo + "]";
	}

}
