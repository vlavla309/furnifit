package com.furnifit.article.domain;

import java.util.Arrays;
import java.util.List;

import com.furnifit.planitem.domain.PlanItem;

public class Article {
	
	
	private int articleId;
	private String email;
	private int planitemId;
	private int likecnt;
	private int viewcnt;
	private String regdate; 
	private String title;
	private String content; 
	private String[] files;
	private List<ArticleImg> images;
	private String planitemImg;
	
	public Article() {}

	public Article(int articleId, String email, int planitemId, int likecnt, int viewcnt, String regdate, String title,
			String content, String[] files, List<ArticleImg> images, String planitemImg) {
		this.articleId = articleId;
		this.email = email;
		this.planitemId = planitemId;
		this.likecnt = likecnt;
		this.viewcnt = viewcnt;
		this.regdate = regdate;
		this.title = title;
		this.content = content;
		this.files = files;
		this.images = images;
		this.planitemImg = planitemImg;
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

	public int getPlanitemId() {
		return planitemId;
	}

	public void setPlanitemId(int planitemId) {
		this.planitemId = planitemId;
	}

	public int getLikecnt() {
		return likecnt;
	}

	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}
	
	

	public List<ArticleImg> getImages() {
		return images;
	}

	public void setImages(List<ArticleImg> images) {
		this.images = images;
	}
	
	

	public String getPlanitemImg() {
		return planitemImg;
	}

	public void setPlanitemImg(String planitemImg) {
		this.planitemImg = planitemImg;
	}

	@Override
	public String toString() {
		return "Article [articleId=" + articleId + ", email=" + email + ", planitemId=" + planitemId + ", likecnt="
				+ likecnt + ", viewcnt=" + viewcnt + ", regdate=" + regdate + ", title=" + title + ", content="
				+ content + ", files=" + Arrays.toString(files) + ", images=" + images + ", planitemImg=" + planitemImg
				+ "]";
	}


	

	

	

}
