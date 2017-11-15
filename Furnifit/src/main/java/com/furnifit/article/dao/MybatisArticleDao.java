package com.furnifit.article.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.article.domain.Article;

/**
 *
 * @author 박보라
 */
@Repository 
public class MybatisArticleDao implements ArticleDao {

	@Inject
	private SqlSession sqlSession;
	 
	private static final String namespace= "com.furnifit.article.dao.ArticleDao";
	
	
	@Override
	public void create(Article article) {
		sqlSession.insert(namespace + ".create", article);

	}


	@Override
	public Article read(int articleId) {
		return sqlSession.selectOne(namespace + ".read", articleId); 
		
	}

	@Override
	public void addAttach(String name, String path, int articleId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("path", path);
		map.put("articleId", articleId);
		
		sqlSession.insert(namespace + ".addAttach", map);
		
	}
	
	
	
	
	
	

}
