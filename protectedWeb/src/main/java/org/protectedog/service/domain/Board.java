package org.protectedog.service.domain;

public class Board {
	
	/// Field
	private int postNo;
	private String id;
	private String nickName;
	private String phone;
	private int prodNo;
	private String postTitle;
	private String postContent;
	private int viewCount;
	private char boardCode;
	private char delCode;
	
	// Nullable
	private int recommendCount;
	private int marketCode;
	private int price;
	private String city;
	private char qnaCode;
	private char route;
	
	/// Constructor
	
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
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
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public char getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(char boardCode) {
		this.boardCode = boardCode;
	}
	public char getDelCode() {
		return delCode;
	}
	public void setDelCode(char delCode) {
		this.delCode = delCode;
	}
	public int getRecommendCount() {
		return recommendCount;
	}
	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
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
	public char getQnaCode() {
		return qnaCode;
	}
	public void setQnaCode(char qnaCode) {
		this.qnaCode = qnaCode;
	}
	public char getRoute() {
		return route;
	}
	public void setRoute(char route) {
		this.route = route;
	}
	
	@Override
	public String toString() {
		return "Board [postNo=" + postNo + ", id=" + id + ", nickName=" + nickName + ", phone=" + phone + ", prodNo="
				+ prodNo + ", postTitle=" + postTitle + ", postContent=" + postContent + ", viewCount=" + viewCount
				+ ", boardCode=" + boardCode + ", delCode=" + delCode + ", recommendCount=" + recommendCount
				+ ", marketCode=" + marketCode + ", price=" + price + ", city=" + city + ", qnaCode=" + qnaCode
				+ ", route=" + route + ", getPostNo()=" + getPostNo() + ", getId()=" + getId() + ", getNickName()="
				+ getNickName() + ", getPhone()=" + getPhone() + ", getProdNo()=" + getProdNo() + ", getPostTitle()="
				+ getPostTitle() + ", getPostContent()=" + getPostContent() + ", getViewCount()=" + getViewCount()
				+ ", getBoardCode()=" + getBoardCode() + ", getDelCode()=" + getDelCode() + ", getRecommendCount()="
				+ getRecommendCount() + ", getMarketCode()=" + getMarketCode() + ", getPrice()=" + getPrice()
				+ ", getCity()=" + getCity() + ", getQnaCode()=" + getQnaCode() + ", getRoute()=" + getRoute()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
}
