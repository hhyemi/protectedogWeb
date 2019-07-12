package org.protectedog.service.domain;

import java.util.Date;

public class Mileage {
	
	private int mileagaNo;
	private int mileageCode;
	private int mileage;
	private User id;
	private String mileageReason;
	private Date regDate;

	
	public Mileage() {
		
	}


	public int getMileagaNo() {
		return mileagaNo;
	}


	public void setMileagaNo(int mileagaNo) {
		this.mileagaNo = mileagaNo;
	}


	public int getMileageCode() {
		return mileageCode;
	}


	public void setMileageCode(int mileageCode) {
		this.mileageCode = mileageCode;
	}


	public int getMileage() {
		return mileage;
	}


	public void setMileage(int mileage) {
		this.mileage = mileage;
	}


	public User getId() {
		return id;
	}


	public void setId(User id) {
		this.id = id;
	}


	public String getMileageReason() {
		return mileageReason;
	}


	public void setMileageReason(String mileageReason) {
		this.mileageReason = mileageReason;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	@Override
	public String toString() {
		return "Mileage [mileagaNo=" + mileagaNo + ", mileageCode=" + mileageCode + ", mileage=" + mileage + ", id="
				+ id + ", mileageReason=" + mileageReason + ", regDate=" + regDate + "]";
	}
	
	

}
