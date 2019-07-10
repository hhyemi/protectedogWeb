package org.protectedog.service.domain;

import java.sql.Date;

public class Recomment {
	
	/// Field
	private int recommentNo;
	private int commentNo;
	private String id;
	private Date regDate;
	private String nickName;
	private char delCode;
	
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
	public char getDelCode() {
		return delCode;
	}
	public void setDelCode(char delCode) {
		this.delCode = delCode;
	}
	
	@Override
	public String toString() {
		return "Recomment [recommentNo=" + recommentNo + ", commentNo=" + commentNo + ", id=" + id + ", regDate="
				+ regDate + ", nickName=" + nickName + ", delCode=" + delCode + "]";
	}
}
