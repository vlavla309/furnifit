package com.furnifit.article.domain;

public class ArticleImg {
	
	private String name;
	private int articleId;
	private String path;
	private String regdate;
	
	
	public ArticleImg() {}


	public ArticleImg(String name, int articleId, String path, String regdate) {
		this.name = name;
		this.articleId = articleId;
		this.path = path;
		this.regdate = regdate;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getArticleId() {
		return articleId;
	}


	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}


	public String getPath() {
		return path;
	}


	public void setPath(String path) {
		this.path = path;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "ArticleImg [name=" + name + ", articleId=" + articleId + ", path=" + path + ", regdate=" + regdate
				+ "]";
	}
	
	
	
	
	

}




