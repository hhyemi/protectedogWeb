package org.protectedog.service.domain;

import java.util.Date;

public class Product {
	
	private int prodNO;
	private String prodName;
	private int price;
	private Date manuDate;
	private Date regDate;
	private String counrty;
	private int quantity;
	private String prodDetail;
	private String company;
	private int discountPrice;
	
	public Product() {
	}

	public int getProdNO() {
		return prodNO;
	}

	public void setProdNO(int prodNO) {
		this.prodNO = prodNO;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getManuDate() {
		return manuDate;
	}

	public void setManuDate(Date manuDate) {
		this.manuDate = manuDate;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getCounrty() {
		return counrty;
	}

	public void setCounrty(String counrty) {
		this.counrty = counrty;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getProdDetail() {
		return prodDetail;
	}

	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	@Override
	public String toString() {
		return "Product [prodNO=" + prodNO + ", prodName=" + prodName + ", price=" + price + ", manuDate=" + manuDate
				+ ", regDate=" + regDate + ", counrty=" + counrty + ", quantity=" + quantity + ", prodDetail="
				+ prodDetail + ", company=" + company + ", discountPrice=" + discountPrice + "]";
	}
	
}

