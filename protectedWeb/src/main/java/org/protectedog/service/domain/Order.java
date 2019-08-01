package org.protectedog.service.domain;

import java.util.Date;

public class Order {
	//Field
	private int orderNo;
	private int prodNo;
	private String id;
	private String phone;
	private int couponNo;
	private String receiverAddr;
	private String receiverName;
	private String receiverPhone;
	private String orderRequest;
	private int paymentCode;
	private Date orderDate;
	private int orderQuantity;
	private int totalPrice;
	private int orderCode;
	private int deliveryCode;
	private int mileageNo;
	private Product orderprod;

	
	
	public Order() {
		
	}



	public int getOrderNo() {
		return orderNo;
	}



	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}



	public int getProdNo() {
		return prodNo;
	}



	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public int getCouponNo() {
		return couponNo;
	}



	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}



	public String getReceiverAddr() {
		return receiverAddr;
	}



	public void setReceiverAddr(String receiverAddr) {
		this.receiverAddr = receiverAddr;
	}



	public String getReceiverName() {
		return receiverName;
	}



	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}



	public String getReceiverPhone() {
		return receiverPhone;
	}



	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}



	public String getOrderRequest() {
		return orderRequest;
	}



	public void setOrderRequest(String orderRequest) {
		this.orderRequest = orderRequest;
	}



	public int getPaymentCode() {
		return paymentCode;
	}



	public void setPaymentCode(int paymentCode) {
		this.paymentCode = paymentCode;
	}



	public Date getOrderDate() {
		return orderDate;
	}



	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}



	public int getOrderQuantity() {
		return orderQuantity;
	}



	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}



	public int getTotalPrice() {
		return totalPrice;
	}



	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}



	public int getOrderCode() {
		return orderCode;
	}



	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}



	public int getDeliveryCode() {
		return deliveryCode;
	}



	public void setDeliveryCode(int deliveryCode) {
		this.deliveryCode = deliveryCode;
	}



	public int getMileageNo() {
		return mileageNo;
	}



	public void setMileageNo(int mileageNo) {
		this.mileageNo = mileageNo;
	}



	public Product getOrderprod() {
		return orderprod;
	}



	public void setOrderprod(Product orderprod) {
		this.orderprod = orderprod;
	}



	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", prodNo=" + prodNo + ", id=" + id + ", phone=" + phone + ", couponNo="
				+ couponNo + ", receiverAddr=" + receiverAddr + ", receiverName=" + receiverName + ", receiverPhone="
				+ receiverPhone + ", orderRequest=" + orderRequest + ", paymentCode=" + paymentCode + ", orderDate="
				+ orderDate + ", orderQuantity=" + orderQuantity + ", totalPrice=" + totalPrice + ", orderCode="
				+ orderCode + ", deliveryCode=" + deliveryCode + ", mileageNo=" + mileageNo + ", orderprod=" + orderprod
				+ "]";
	}

}