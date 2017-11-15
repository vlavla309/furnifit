package com.furnifit.article.dao;

import java.util.Map;

import com.furnifit.article.domain.Article;

/**
 *
 *
 * @author 박보라
 *
 */
public interface ArticleDao {
	
	
	
	/**
	 * 게시판 글작성
	 * @param article
	 */
	public void create(Article article);
	
	
	/**
	 * 게시판 상세조회
	 * @param articleId
	 * @return Article
	 */
	public Article read(int articleId);
	
	/**
	 * 게시판 이미지 업로드
	 * @param map
	 */
	public void addAttach(String name, String path, int articleId); 
	
	

}
