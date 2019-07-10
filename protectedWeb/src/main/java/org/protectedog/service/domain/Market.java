package org.protectedog.service.domain;

import java.util.Date;

public class Market {
	
	private int postNo;
	private User id;
	private String postTitle;
	private String postContent;
	private Date regDate;
	private int viewCount;
	private int marketCode;
	private int price;
	private User phone;
	private String city;
	
	public Market() {	
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public User getId() {
		return id;
	}

	public void setId(User id) {
		this.id = id;
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

	public User getPhone() {
		return phone;
	}

	public void setPhone(User phone) {
		this.phone = phone;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "Market [postNo=" + postNo + ", id=" + id + ", postTitle=" + postTitle + ", postContent=" + postContent
				+ ", regDate=" + regDate + ", viewCount=" + viewCount + ", marketCode=" + marketCode + ", price="
				+ price + ", phone=" + phone + ", city=" + city + "]";
	}
	
}
