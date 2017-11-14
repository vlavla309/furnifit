package com.furnifit.product.service;

import java.util.List;
import java.util.Map;

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
}
