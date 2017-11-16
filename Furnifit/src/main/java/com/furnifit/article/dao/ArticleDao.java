package com.furnifit.article.dao;

import java.util.List;
import java.util.Map;

import com.furnifit.article.domain.Article;
import com.furnifit.article.domain.Furniture;
import com.furnifit.planitem.domain.PlanItem;
import com.furnifit.product.domain.Product;

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
	public void addAttach(Map<String, Object> map); 
	
	
	/**
	 * 게시판 전체리스트
	 * @return List<Article>
	 */
	public List<Article> listAll();
	
	
	/**
	 * 상세게시글에 해당하는 배치도항목 정보 가져오기
	 * @param planitemId
	 * @return
	 */
	public PlanItem readPlanItem(int planitemId);
	
	
	/**
	 * 배치도항목에 해당하는 가구번호목록(리스트) 가져오기 
	 * @param planitemId
	 * @return
	 */
	public List<Furniture> readFurniture(int planitemId);
	
	/**
	 * 가구번호에 대한 가구(상품)정보 가져오기
	 * @param productId
	 * @return
	 */
	public Product readProduct(int productId);
	
	
	

}
