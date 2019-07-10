package org.protectedog.service.domain;

public class User {
	
	///Field
	private String id;
	private String pw;
	private String userName;
	private String nickName;
	private String email;
	private String phone1;
	private String phone2;
	private String phone3;
	private String userAddr;
	private String account;
	private String birthDate;
	private String levelPoint;
	private String userNo;
	private String accessDate;
	private String mileage;
	private String gender;
	private String role;
	private String level;
	private String purpose1;
	private String purpose2;
	private String purpose3;
	private String profile;
	
	///Constructor
	
	///Method
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getLevelPoint() {
		return levelPoint;
	}
	public void setLevelPoint(String levelPoint) {
		this.levelPoint = levelPoint;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getAccessDate() {
		return accessDate;
	}
	public void setAccessDate(String accessDate) {
		this.accessDate = accessDate;
	}
	public String getMileage() {
		return mileage;
	}
	public void setMileage(String mileage) {
		this.mileage = mileage;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getPurpose1() {
		return purpose1;
	}
	public void setPurpose1(String purpose1) {
		this.purpose1 = purpose1;
	}
	public String getPurpose2() {
		return purpose2;
	}
	public void setPurpose2(String purpose2) {
		this.purpose2 = purpose2;
	}
	public String getPurpose3() {
		return purpose3;
	}
	public void setPurpose3(String purpose3) {
		this.purpose3 = purpose3;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", pw=" + pw + ", userName=" + userName + ", nickName=" + nickName + ", email="
				+ email + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", userAddr=" + userAddr
				+ ", account=" + account + ", birthDate=" + birthDate + ", levelPoint=" + levelPoint + ", userNo="
				+ userNo + ", accessDate=" + accessDate + ", mileage=" + mileage + ", gender=" + gender + ", role="
				+ role + ", level=" + level + ", purpose1=" + purpose1 + ", purpose2=" + purpose2 + ", purpose3="
				+ purpose3 + ", profile=" + profile + "]";
	}
	
}
