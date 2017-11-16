package com.furnifit.wishlist.service;

import java.util.List;
import java.util.Map;

import com.furnifit.wishlist.domain.Wishlist;

/**
 * @author 한수진
 *
 */
public interface WishlistService {
	
	public void create(Map<String, String> map);

	public List<Wishlist> read();
	
	public List<Wishlist> userwishlist(Map<String, String> map);

	public void delete(Map<String, String> map);
}
