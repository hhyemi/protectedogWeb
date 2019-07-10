package org.protectedog.service.domain;

import java.util.Date;

public class Coupon {

	///Field
	private User receiveUser;
	private String couponName;
	private String couponCode;
	private int discount;
	private int couponNo;
	private String couponStatus;
	private Date makeDate;
	private Date limitDate;
	
	///Constructor
	
	///Method
	public User getReceiveUser() {
		return receiveUser;
	}
	public void setReceiveUser(User receiveUser) {
		this.receiveUser = receiveUser;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public String getCouponCode() {
		return couponCode;
	}
	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}
	public String getCouponStatus() {
		return couponStatus;
	}
	public void setCouponStatus(String couponStatus) {
		this.couponStatus = couponStatus;
	}
	public Date getMakeDate() {
		return makeDate;
	}
	public void setMakeDate(Date makeDate) {
		this.makeDate = makeDate;
	}
	public Date getLimitDate() {
		return limitDate;
	}
	public void setLimitDate(Date limitDate) {
		this.limitDate = limitDate;
	}
	
	@Override
	public String toString() {
		return "Coupon [receiveUser=" + receiveUser + ", couponName=" + couponName + ", couponCode=" + couponCode
				+ ", discount=" + discount + ", couponNo=" + couponNo + ", couponStatus=" + couponStatus + ", makeDate="
				+ makeDate + ", limitDate=" + limitDate + ", getReceiveUser()=" + getReceiveUser()
				+ ", getCouponName()=" + getCouponName() + ", getCouponCode()=" + getCouponCode() + ", getDiscount()="
				+ getDiscount() + ", getCouponNo()=" + getCouponNo() + ", getCouponStatus()=" + getCouponStatus()
				+ ", getMakeDate()=" + getMakeDate() + ", getLimitDate()=" + getLimitDate() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}	
}
