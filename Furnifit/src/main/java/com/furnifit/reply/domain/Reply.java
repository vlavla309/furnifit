package com.furnifit.reply.domain;

/**
 * @author 김호준
 *
 * 댓글 도메인
 * 테이블의 칼럼 이름과 도메인의 속성 이름을 동일하게 해주는게
 * 읽기에 좋기 때문에 동일하게 했음
 */

public class Reply {
	private int reply_id;
	private int articleId;
	private String email;
	private String content;
	private String regdate;
	
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
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
		return "Reply [reply_id=" + reply_id + ", articleId=" + articleId + ", email=" + email + ", content=" + content
				+ ", regdate=" + regdate + "]";
	}
}
