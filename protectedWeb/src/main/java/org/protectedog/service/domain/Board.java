package org.protectedog.service.domain;

import java.sql.Date;


//==>게시판정보를 모델링(추상화/캡슐화)한 Bean
public class Board {
	
	///Field
	private int postNo;
	private String boardCode;
	private String id;
	private String nickName;
	private String postTitle;
	private String postContent;
	private Date regDate;
	private int viewCount;
	private int commentCount;
	
	// null 가능
	private int recommendCount;
	private int marketCode;
	private int price;
	private String city;
	
	private String phone;	//참조
	
	private String qnaCode;
	private String route;
	private int prodNo;
	private char delCode;
	private String prodName;
	



	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

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
	
	public char getDelCode() {
		return delCode;
	}

	public void setDelCode(char delCode) {
		this.delCode = delCode;
	}
	
	public int getMarketCode() {
		return marketCode;
	}

	public void setMarketCode(int marketCode) {
		this.marketCode = marketCode;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getQnaCode() {
		return qnaCode;
	}

	public void setQnaCode(String qnaCode) {
		this.qnaCode = qnaCode;
	}

	public String getRoute() {
		return route;
	}

	public void setRoute(String route) {
		this.route = route;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	@Override
	public String toString() {
		return "Board [postNo=" + postNo + ", boardCode=" + boardCode + ", id=" + id + ", nickName=" + nickName
				+ ", postTitle=" + postTitle + ", postContent=" + postContent + ", regDate=" + regDate + ", viewCount="
				+ viewCount + ", commentCount=" + commentCount + ", recommendCount=" + recommendCount + ", marketCode="
				+ marketCode + ", price=" + price + ", city=" + city + ", phone=" + phone + ", qnaCode=" + qnaCode
				+ ", route=" + route + ", prodNo=" + prodNo + ", delCode=" + delCode + ", prodName=" + prodName + "]";
	}
	
	
}
