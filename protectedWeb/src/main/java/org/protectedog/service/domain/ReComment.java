package org.protectedog.service.domain;

import java.sql.Date;

public class ReComment {
	
	/// Field
	private int recommentNo;
	private int commentNo;
	private String id;
	private Date regDate;
	private String nickName;
	private String recommentContent;
	private char statusCode;
	private int postNo;
	
	/// Constructor

	/// Method
	public int getRecommentNo() {
		return recommentNo;
	}
	public void setRecommentNo(int recommentNo) {
		this.recommentNo = recommentNo;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public char getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(char statusCode) {
		this.statusCode = statusCode;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getRecommentContent() {
		return recommentContent;
	}
	public void setRecommentContent(String recommentContent) {
		this.recommentContent = recommentContent;
	}
	
	@Override
	public String toString() {
		return "ReComment [recommentNo=" + recommentNo + ", commentNo=" + commentNo + ", id=" + id + ", regDate="
				+ regDate + ", nickName=" + nickName + ", recommentContent=" + recommentContent + ", statusCode="
				+ statusCode + ", postNo=" + postNo + "]";
	}
	


}
