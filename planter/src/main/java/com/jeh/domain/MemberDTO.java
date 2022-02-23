package com.jeh.domain;

public class MemberDTO {
	// 아이디
	private String mid;
	// 비밀번호
	private String passwd;
	// 이름
	private String name;
	// 핸드폰 번호
	private String phone;
	// 이메일
	private String email;
	// 우편번호
	private String postcode;
	// 주소
	private String address1;
	// 상세 주소
	private String address2;
	// 상세 주소 2(동)
	private String address3;
	// 회원 권한(0 = 일반회원/1 = 관리자)
	private boolean role;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public boolean isRole() {
		return role;
	}
	public void setRole(boolean role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "MemberDTO [mid=" + mid + ", passwd=" + passwd + ", name=" + name + ", phone=" + phone + ", email="
				+ email + ", postcode=" + postcode + ", address1=" + address1 + ", address2=" + address2 + ", address3="
				+ address3 + ", role=" + role + "]";
	}
	
	

	
	
}
