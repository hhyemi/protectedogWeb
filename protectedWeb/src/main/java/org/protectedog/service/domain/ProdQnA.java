package org.protectedog.service.domain;

import java.util.Date;

public class ProdQnA {
	
	private int postNO;
	private String postTitle;
	private String postContent;
	private Product prodNo;
	private Date regDate;
	private int QnaCode;
	
	public ProdQnA() {
	}

	public int getPostNO() {
		return postNO;
	}

	public void setPostNO(int postNO) {
		this.postNO = postNO;
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

	public Product getProdNo() {
		return prodNo;
	}

	public void setProdNo(Product prodNo) {
		this.prodNo = prodNo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getQnaCode() {
		return QnaCode;
	}

	public void setQnaCode(int qnaCode) {
		QnaCode = qnaCode;
	}

	@Override
	public String toString() {
		return "ProdQnA [postNO=" + postNO + ", postTitle=" + postTitle + ", postContent=" + postContent + ", prodNo="
				+ prodNo + ", regDate=" + regDate + ", QnaCode=" + QnaCode + "]";
	}
	
}
