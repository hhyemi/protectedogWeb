package org.protectedog.service.domain;

import java.sql.Date;

public class Comment {

	/// Field
	private int commentNo;
	private int postNo;
	private String id;
	private String boardCode;
	private String commentContent;
	private String regDate;
	private int likeCount;
	private String nickName;
	private char delCode;

	/// Constructor

	/// Method
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

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
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

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", postNo=" + postNo + ", id=" + id + ", boardCode=" + boardCode
				+ ", commentContent=" + commentContent + ", regDate=" + regDate + ", likeCount=" + likeCount
				+ ", nickName=" + nickName + ", delCode=" + delCode + ", getCommentNo()=" + getCommentNo()
				+ ", getPostNo()=" + getPostNo() + ", getId()=" + getId() + ", getBoardCode()=" + getBoardCode()
				+ ", getCommentContent()=" + getCommentContent() + ", getRegDate()=" + getRegDate()
				+ ", getLikeCount()=" + getLikeCount() + ", getNickName()=" + getNickName() + ", getDelCode()="
				+ getDelCode() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
}
