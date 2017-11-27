package com.furnifit.like.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.furnifit.article.dao.ArticleDao;
import com.furnifit.article.domain.Article;
import com.furnifit.common.web.ArticleParams;
import com.furnifit.like.dao.LikeDao;
import com.furnifit.like.domain.Like;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/*.xml" }) 
public class LikeDaoTest {
	
	@Inject
	private LikeDao dao;
	
	@Inject
	private ArticleDao artDao;
	
	private static Logger logger = Logger.getLogger(LikeDaoTest.class);

//	@Test
	public void testCreate() throws Exception {
		Article article = new Article();
		article.setContent("하이루방가루");
		article.setPlanitemId(1);
		article.setEmail("dd@naver.com");
		article.setTitle("안녕"); 
		article.setLikecnt(3);
		article.setViewcnt(4);
		
	}
	 
//	@Test
	public void testLike() throws Exception {
		Article article = artDao.read(1);
		String email = article.getEmail();
		int articleId = article.getArticleId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("articleId", articleId);
		map.put("email", email);
		Like like = dao.read(map);
		
		logger.info(like.getEmail());
	}

	
	
	}
	
	
	