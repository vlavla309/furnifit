package com.furnifit.article.service;

import java.util.List;
import java.util.Map;

import com.furnifit.article.domain.Article;
import com.furnifit.common.web.ArticleParams;
import com.furnifit.furniture.domain.Furniture;
import com.furnifit.planitem.domain.PlanItem;
import com.furnifit.product.domain.Product;

public interface ArticleService {
	
	
	/**
	 * 게시글 등록
	 * @param article
	 * @throws Exception
	 */
	public void create(Article article)throws Exception;
	
	/**
	 * 게시글 상세조회
	 * @param articleId
	 * @return
	 * @throws Exception
	 */
	public Article read(int articleId)throws Exception;
	
	/**
	 * 상품 이미지 등록
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
	public PlanItem readPlanItem(int planitemId) throws Exception;
	
	
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
	
	/**
	 * 게시글 수정
	 * @param article
	 */
	public void artUpdate(Article article);
	
	
	/**
	 * 게시글 삭제
	 * @param articleId
	 */
	public void artDelete(int articleId);
	
	
	/**
	 * 한페이지당 출력할 게시글들 가져오기
	 * @param page
	 * @return
	 */
	public List<Article> listByParams(ArticleParams params);
	
	
	/**
	 * 검색시 해당 게시글수 가져오기
	 * @param params
	 * @return
	 */
	public int listSearchCount(ArticleParams params);
	
	/**
	 * 좋아요 추가될때마다 likecnt 1씩 올리기위한 수정
	 * @param articleId
	 * @return
	 */
	public void likeUpdate(int articleId);
	
	/**
	 * 추천수가 높은 게시글 작성자 3명에게 쿠폰지급
	 * @return
	 */
	public List<Article> likecntcoupone();

	/**
	 * 상품상세보기에서 보여줄 공유배치도
	 * @param productId
	 * @return
	 */
	public List<Article> productRead(int productId);

}


