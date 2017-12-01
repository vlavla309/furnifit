package com.furnifit.wishlist.service;

import java.util.List;
import java.util.Map;

import com.furnifit.wishlist.domain.Wishlist;

/**
 * @author 한수진
 *
 */
public interface WishlistService {
	
	/**
	 * 위시리스트 생성
	 * @param map
	 */
	public void create(Map<String, String> map);

	/**
	 * 상품목록에 위시리스트 불러오기
	 * @return
	 */
	public List<Wishlist> read();

	/**
	 * 위시리스트 삭제
	 * @param map
	 */
	public void delete(Map<String, String> map);
	
	
	public int listcount(String email);
	
}
