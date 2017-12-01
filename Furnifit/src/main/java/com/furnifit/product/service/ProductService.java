package com.furnifit.product.service;

import java.util.List;
import java.util.Map;

import com.furnifit.common.web.ProductParams;
import com.furnifit.product.domain.Product;

/**
 * @author 한수진
 *
 */
public interface ProductService {
	/**
	 * 상품생성
	 * @param product
	 */
	public void create(Product product);

	/**
	 * 상품 상세보기
	 * @param productid
	 * @return Product
	 */
	public Product read(int productid);

	/**
	 * 상품 이미지 등록
	 * @param map
	 */
	public void addAttach(Map<String, String> map);

	/**
	 * 상품리스트 보이기 return List<Product>
	 */
	public List<Product> list();
	
	/**
	 * 상품 조건 검색
	 * @param params
	 * @return
	 */
	public List<Product> searchlist(ProductParams params);
	
	
	/**
	 * 상품 상세보기 뷰에 해당 상품 카테고리에 해당하는 상품 목록!
	 * @param category
	 * @return
	 */
	public List<Product> productReadList(String category);
	
	/**
	 * 위시리스트와 상품조인
	 * @param email
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List<Product> productwish(String email, int page, int pageSize);
	
	/**
	 * 상품 count
	 * @return
	 */
	public int totlasize();
	
	
	public List<Product> total();
}
