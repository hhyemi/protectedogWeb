package org.protectedog.service.domain;

import java.sql.Date;


//==>È¸¿øÁ¤º¸¸¦ ¸ðµ¨¸µ(Ãß»óÈ­/Ä¸½¶È­)ÇÑ Bean
public class AdoptReview {
	
	///Field
	private int postNo;
	private String boardCode;
	private String id;
	private String nickName;
	private String postTitle;
	private String postContent;
	private Date regDate;
	private int viewCount;
	private int recommendCount;
	private String delCode;
	



	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
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

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getRecommendCount() {
		return recommendCount;
	}

	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}

	public String getDelCode() {
		return delCode;
	}

	public void setDelCode(String delCode) {
		this.delCode = delCode;
	}


	
	
	public String toString() {
		return "[ postNo : "+postNo+" ] [ boardCode : "+boardCode+" ] [ id : "+id+" ] [ nickName : "+nickName
				+" ] [ postTitle : "+postTitle+" ] [ postContent : "+postContent+" ] [ regDate : "+regDate
				+" ] [ viewCount : "+viewCount+" ] [ recommendCount : "+recommendCount+" ] [ delCode : "+delCode+" ]";
	}

	
}
