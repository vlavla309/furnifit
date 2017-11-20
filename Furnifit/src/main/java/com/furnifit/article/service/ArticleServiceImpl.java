package com.furnifit.article.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.furnifit.article.dao.ArticleDao;
import com.furnifit.article.domain.Article;
import com.furnifit.article.domain.ArticleImg;
import com.furnifit.furniture.dao.FurnitureDao;
import com.furnifit.furniture.domain.Furniture;
import com.furnifit.planitem.dao.PlanItemDao;
import com.furnifit.planitem.domain.PlanItem;
import com.furnifit.product.dao.ProductDao;
import com.furnifit.product.domain.Product;

@Service
public class ArticleServiceImpl implements ArticleService {

	
	private static final Logger logger = Logger.getLogger(ArticleServiceImpl.class);
	
	@Inject
	private ArticleDao articleDao;
	
	@Inject
	private FurnitureDao furnitureDao;
	
	@Inject
	private ProductDao productDao;
	
	@Inject
	private PlanItemDao planitemDao;
	
	
	@Override
	public void create(Article article) throws Exception {
		articleDao.create(article);
		 
		String[] files = article.getFiles();
		
		if(files == null) {return;}
		
		for (String fullName : files) {
			Map<String, Object> map = new HashMap<String, Object>();
			File f = new File(fullName);
			String fileName = f.getName();
			String filePath = f.getParent();
			logger.info("----filename : " + fileName + " --> filePath : " + filePath+" ----");
			map.put("name", fileName.replace("s_", ""));
			map.put("path", filePath);
			logger.info(article.getArticleId());
			map.put("articleId", article.getArticleId());
			articleDao.addAttach(map);
			
		}
			
	}
	
	@Override
	public void addAttach(Map<String, Object> map) {
		articleDao.addAttach(map);
	}

	@Override
	public Article read(int articleId) throws Exception {
		Article article = articleDao.read(articleId);
		
		article.setImages(articleDao.getAttach(articleId));
		
		for (ArticleImg img : article.getImages()) {
			logger.info(img);
		}
		
		return article;
	}

	@Override
	public List<Article> listAll() {
		return articleDao.listAll();
	}

	@Override
	public PlanItem readPlanItem(int planitemId) {
		return planitemDao.read(planitemId);
	}

	@Override
	public List<Furniture> readFurniture(int planitemId) {
		return furnitureDao.list(planitemId);
	}

	@Override
	public Product readProduct(int productId) {
		return productDao.read(productId);
	}

	@Override
	public void artUpdate(Article article) {
		articleDao.artUpdate(article);
		
		int articleId = article.getArticleId();
		articleDao.deleteAttach(articleId);
		 
		String[] files = article.getFiles();
		
		if(files == null) {return;}
		
		for (String fullName : files) {
			Map<String, Object> map = new HashMap<String, Object>();
			File f = new File(fullName);
			String fileName = f.getName();
			String filePath = f.getParent();
			logger.info("----filename : " + fileName + " --> filePath : " + filePath+" ----");
			map.put("name", fileName.replace("s_", ""));
			map.put("path", filePath);
			map.put("articleId", article.getArticleId());
			
			articleDao.replaceAttach(map);
		}
		
		
	}

	@Override
	public void artDelete(int articleId) {
		articleDao.deleteAttach(articleId);
		articleDao.artDelete(articleId);
		
	}

	
	
	
	
	
	
	
	

	
	
	
}
