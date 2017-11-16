package com.furnifit.wishlist.dao;

import java.util.List;
import java.util.Map;

import com.furnifit.wishlist.domain.Wishlist;

/**
 * @author 한수진
 *
 */
public interface WishlistDao {
	
	public void create(Map<String, String> map);

	public List<Wishlist> read();

	public void delete(Map<String, String> map);
	
	public List<Wishlist> userwishlist(Map<String, String> map);
}
