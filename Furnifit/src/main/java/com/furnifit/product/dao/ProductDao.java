package com.furnifit.product.dao;

import java.util.List;
import java.util.Map;

import com.furnifit.common.web.ProductParams;
import com.furnifit.product.domain.Product;

/**
 * @author 한수진
 *
 */
public interface ProductDao {

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
	 * 상품 전체 리스트 보이기
	 * return List<Product>
	 */
	public List<Product> list();
	
	/**
	 * 상품 조건검색
	 * @param params
	 * @return
	 */
	public List<Product> searchlist(ProductParams params);
	
	/**
	 * 위시리트스에서 product 전체 조회를 할때!
	 * @return
	 */
	public List<Product> productList();
	
	
	/**
	 * @param category
	 * @return
	 */
	public List<Product> productReadList(String category);
	
	
}
