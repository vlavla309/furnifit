package com.furnifit.article.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.article.dao.ArticleDao;
import com.furnifit.article.domain.Article;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Inject
	private ArticleDao articleDao;
	
	
	@Override
	public void create(Article article) throws Exception {
		articleDao.create(article);
		 
	}


	@Override
	public Article read(int articleId) throws Exception {
		Article article = articleDao.read(articleId);
		return article;
	}
	
	

	
	
	
}
