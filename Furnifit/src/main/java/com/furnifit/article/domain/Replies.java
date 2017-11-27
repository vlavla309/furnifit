package com.furnifit.article.domain;

public class Replies {
	private int reply_id;
	private int article_id;
	private String email;
	private String content;
	private String regdate;
	
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}
	public int getArticle_id() {
		return article_id;
	}
	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "Replies [reply_id=" + reply_id + ", article_id=" + article_id + ", email=" + email + ", content="
				+ content + ", regdate=" + regdate + "]";
	}
	
}
