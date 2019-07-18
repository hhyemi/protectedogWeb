package org.protectedog.service.domain;

import java.util.Date;

public class Product {
	
	private int prodNo;
	private String prodName;
	private int price;
	private Date manuDate;
	private Date regDate;
	private String country;
	private int quantity;
	private String prodDetail;
	private String company;
	private int discountPrice;
	private int prodCode;
	
	
	public Product() {
	}


	public int getProdNo() {
		return prodNo;
	}


	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
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


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
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


	public int getProdCode() {
		return prodCode;
	}


	public void setProdCode(int prodCode) {
		this.prodCode = prodCode;
	}


	@Override
	public String toString() {
		return "Product [prodNo=" + prodNo + ", prodName=" + prodName + ", price=" + price + ", manuDate=" + manuDate
				+ ", regDate=" + regDate + ", country=" + country + ", quantity=" + quantity + ", prodDetail="
				+ prodDetail + ", company=" + company + ", discountPrice=" + discountPrice + ", prodCode=" + prodCode
				+ "]";
	}
	
}
	
