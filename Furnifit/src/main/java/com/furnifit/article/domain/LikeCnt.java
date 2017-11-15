package com.furnifit.article.domain;

public class LikeCnt {

	private int articleId;
	private String email;
	private String regdate;
	
	public LikeCnt() {}

	public LikeCnt(int articleId, String email, String regdate) {
		this.articleId = articleId;
		this.email = email;
		this.regdate = regdate;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "LikeCnt [articleId=" + articleId + ", email=" + email + ", regdate=" + regdate + "]";
	}
	
	
	
	
	
	
	
	
	
}
