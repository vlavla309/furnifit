package com.furnifit.article.test;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.furnifit.article.dao.ArticleDao;
import com.furnifit.article.domain.Article;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/*.xml" }) 
public class ArticleDaoTest {
	
	@Inject
	private ArticleDao dao;
	
	private static Logger logger = Logger.getLogger(ArticleDaoTest.class);

//	@Test
	public void testCreate() throws Exception {
		Article article = new Article();
		article.setContent("하이루방가루");
		article.setPlanitemId(1);
		article.setEmail("dd@naver.com");
		article.setTitle("안녕"); 
		article.setLikecnt(3);
		article.setViewcnt(4);
		dao.create(article); 
	}
	 
//	@Test
	public void testRead() throws Exception {
		Article article = dao.read(5);
		logger.info(article);
	}
	
//	@Test
	public void testlistAll() throws Exception {
		List<Article> allList = dao.listAll();
		for (Article list : allList) {
			logger.info(list);
		}
	}
	
	
	
	
}