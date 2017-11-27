package com.furnifit.article.dao;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.furnifit.article.domain.Article;
import com.furnifit.article.domain.ArticleImg;
import com.furnifit.common.web.ArticleParams;
import com.furnifit.furniture.domain.Furniture;
import com.furnifit.planitem.domain.PlanItem;
import com.furnifit.product.domain.Product;


/**
 *
 * 공유게시판 dao
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
	 * 게시글 이미지 업로드
	 * @param map
	 */
	public void addAttach(Map<String, Object> map); 
	
	
	/**
	 * 게시글 첨부이미지 삭제(수정시)
	 * @param articleId
	 */
	public void deleteAttach(int articleId);
	
	/**
	 * 게시글 첨부이미지 파일 수정 업로드
	 * @param map
	 */
	public void replaceAttach(Map<String, Object> map);
	
	
	/**
	 * 게시판 전체리스트
	 * @return List<Article>
	 */
	public List<Article> listAll();
	
	
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
	 * 게시글번호로 게시글해당첨부파일 리스트 가져오기
	 * @param articleId
	 * @return
	 */
	public List<ArticleImg> getAttach(int articleId);
	
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
	 * 
	 * 추천수가 높은 사용자 3명에게 쿠폰을 지급
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
