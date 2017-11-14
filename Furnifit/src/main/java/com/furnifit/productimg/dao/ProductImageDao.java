package com.furnifit.productimg.dao;

import java.util.List;

import com.furnifit.productimg.domain.ProductImg;

/**
 * 상품 이미지 dao
 * @author 한수진
 *
 */
public interface ProductImageDao {
	
	/**
	 * 상품 목록의 title 이미지  
	 * order가 0인것만!
	 * @return List<ProductImg>
	 */
	public List<ProductImg> list();
	
	/**
	 * 상품 상세보기 이미지들
	 * 상품번호로 상품이미지들을 추출
	 * @return 
	 */
	public List<ProductImg> productImg(int productId);
}
