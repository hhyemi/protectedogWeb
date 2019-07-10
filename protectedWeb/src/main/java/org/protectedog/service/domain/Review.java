package org.protectedog.service.domain;

import java.sql.Date;

public class Review {
	
	/// Field
	private int postNo;
	private String id;
	private String nickName;
	private char boardCode;
	private String postTitle;
	private String postContent;
	private Date regDate;
	private char delCode;
	
	// nullable
	private int grade;
	private int hospital_longitude;
	private int hospital_latitude;
	private int orderNo;
	
	/// Constuctor
	
	/// Method
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
	public char getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(char boardCode) {
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
	public char getDelCode() {
		return delCode;
	}
	public void setDelCode(char delCode) {
		this.delCode = delCode;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getHospital_longitude() {
		return hospital_longitude;
	}
	public void setHospital_longitude(int hospital_longitude) {
		this.hospital_longitude = hospital_longitude;
	}
	public int getHospital_latitude() {
		return hospital_latitude;
	}
	public void setHospital_latitude(int hospital_latitude) {
		this.hospital_latitude = hospital_latitude;
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
				+ ", postTitle=" + postTitle + ", postContent=" + postContent + ", regDate=" + regDate + ", delCode="
				+ delCode + ", grade=" + grade + ", hospital_longitude=" + hospital_longitude + ", hospital_latitude="
				+ hospital_latitude + ", orderNo=" + orderNo + "]";
	}
}
