package com.furnifit.article.service;

import java.util.Map;

import com.furnifit.article.domain.Article;

public interface ArticleService {

	
	public void create(Article article)throws Exception;
	
	public Article read(int articleId)throws Exception;
	
}
