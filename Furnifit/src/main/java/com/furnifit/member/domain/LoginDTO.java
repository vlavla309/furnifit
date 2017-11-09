package com.furnifit.member.domain;

public class LoginDTO {
	
	private String email;
	private String passwd;
	private boolean autologin;
	
	public LoginDTO() {}

	public LoginDTO(String userid, String userpw, boolean autologin) {
		this.email = userid;
		this.passwd = userpw;
		this.autologin = autologin;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String userid) {
		this.email = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String userpw) {
		this.passwd = userpw;
	}

	public boolean isAutologin() {
		return autologin;
	}

	public void setAutologin(boolean autologin) {
		this.autologin = autologin;
	}

	@Override
	public String toString() {
		return "LoginDTO [email=" + email + ", passwd=" + passwd + ", autologin=" + autologin + "]";
	}

	
}
