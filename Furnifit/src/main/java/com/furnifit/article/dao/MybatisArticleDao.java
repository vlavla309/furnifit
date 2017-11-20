package com.furnifit.article.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.article.domain.Article;
import com.furnifit.article.domain.ArticleImg;
import com.furnifit.furniture.domain.Furniture;
import com.furnifit.planitem.domain.PlanItem;
import com.furnifit.product.domain.Product;

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
	public void addAttach(Map<String, Object> map) {
		sqlSession.insert(namespace + ".addAttach", map);
		
	}


	@Override
	public List<Article> listAll() {
		return sqlSession.selectList(namespace + ".listAll");
	}


	@Override
	public PlanItem readPlanItem(int planitemId) {
		return sqlSession.selectOne(namespace + ".readPlanItem", planitemId);
	}


	@Override
	public List<Furniture> readFurniture(int planitemId) {
		return sqlSession.selectList(namespace + ".readFurniture", planitemId);
	}


	@Override
	public Product readProduct(int productId) {
		return sqlSession.selectOne(namespace + ".readProduct", productId);
	}


	@Override
	public void artUpdate(Article article) {
		sqlSession.update(namespace + ".artUpdate", article);
		
	}


	@Override
	public void artDelete(int articleId) {
		sqlSession.delete(namespace + ".artDelete", articleId);
		
	}


	@Override
	public List<ArticleImg> getAttach(int articleId) {
		return sqlSession.selectList(namespace + ".getAttach", articleId);
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
