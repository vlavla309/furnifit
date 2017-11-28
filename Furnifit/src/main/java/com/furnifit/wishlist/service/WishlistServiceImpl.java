package com.furnifit.wishlist.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.furnifit.wishlist.dao.WishlistDao;
import com.furnifit.wishlist.domain.Wishlist;

/**
 * @author 한수진
 *
 */
@Service
public class WishlistServiceImpl implements WishlistService {

	Logger logger = Logger.getLogger(WishlistServiceImpl.class);
	
	@Inject
	private WishlistDao wishdao;
	

	@Override
	public void create(Map<String, String> map) {
		wishdao.create(map);
	}

	@Override
	public List<Wishlist> read() {
		return wishdao.read();
	}

	@Override
	public void delete(Map<String, String> map) {
		wishdao.delete(map);
	}


	@Override
	public int listcount(String email) {
		return wishdao.listcount(email);
	}

}
