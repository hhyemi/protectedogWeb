package org.protectedog.service.domain;

public class User {
	
	///Field
	private int userNo;
	private String id;
	private String kakao;
	private String naver;
	private String google;
	private String facebook;
	private String pw;
	private String userName;
	private String nickname;
	private String email;
	private String phone;
	private String phone1;
	private String phone2;
	private String phone3;
	private String userAddr;
	private String account;
	private int birthDate;
	private int levelPoint;
	private int addPoint;
	private String accessDate;
	private String mileage;
	private String gender;
	private String role;
	private String levels;
	private String purpose1;
	private String purpose2;
	private String purpose3;
	private String profile;
	
	///Constructor
	
	///Method
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getKakao() {
		return kakao;
	}
	public void setKakao(String kakao) {
		this.kakao = kakao;
	}
	public String getNaver() {
		return naver;
	}
	public void setNaver(String naver) {
		this.naver = naver;
	}
	public String getGoogle() {
		return google;
	}
	public void setGoogle(String google) {
		this.google = google;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
		if(phone!=null && phone.length()!=0) {
			phone1=phone.split("-")[0];
			phone2=phone.split("-")[1];
			phone3=phone.split("-")[2];
		}
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
	public int getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(int birthDate) {
		this.birthDate = birthDate;
	}
	public int getLevelPoint() {
		return levelPoint;
	}
	public void setLevelPoint(int levelPoint) {
		this.levelPoint = levelPoint+addPoint;
	}
	public int getAddPoint() {
		return addPoint;
	}
	public void setAddPoint(int addPoint) {
		this.addPoint = addPoint;
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
	public String getLevels() {
		if(levelPoint==0) {
			levels="미인증회원";
		}else if(levelPoint<1500) {
			levels="브론즈";
		}else if(levelPoint<5000) {
			levels="실버";
		}else if(levelPoint<10000) {
			levels="골드";
		}else if(levelPoint<20000) {
			levels="플래티넘";
		}else if(levelPoint>=20000){
			levels="다이아몬드";
		}else if(levelPoint<0) {
			levels="블랙리스트";
		}
		return levels;
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
		return "User [userNo=" + userNo + ", id=" + id + ", kakao=" + kakao + ", naver=" + naver + ", google=" + google
				+ ", facebook=" + facebook + ", pw=" + pw + ", userName=" + userName + ", nickname=" + nickname
				+ ", email=" + email + ", phone=" + phone + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3="
				+ phone3 + ", userAddr=" + userAddr + ", account=" + account + ", birthDate=" + birthDate
				+ ", levelPoint=" + levelPoint + ", addPoint=" + addPoint + ", accessDate=" + accessDate + ", mileage="
				+ mileage + ", gender=" + gender + ", role=" + role + ", levels=" + levels + ", purpose1=" + purpose1
				+ ", purpose2=" + purpose2 + ", purpose3=" + purpose3 + ", profile=" + profile + "]";
	}


	
}
