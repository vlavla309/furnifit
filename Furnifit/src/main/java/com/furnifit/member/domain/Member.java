package com.furnifit.member.domain;

public class Member {
	private String email;
	private String passwd;
	private String name;
	private String phone;
	
	public Member() {}

	public Member(String userid, String userpw, String username, String phone) {
		this.email = userid;
		this.passwd = userpw;
		this.name = username;
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	@Override
	public String toString() {
		return "Member [email=" + email + ", passwd=" + passwd + ", name=" + name + ", phone=" + phone + "]";
	}
}
