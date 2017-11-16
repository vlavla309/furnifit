package com.furnifit.wishlist.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.wishlist.domain.Wishlist;

/**
 * @author 한수진
 *
 */

@Repository
public class MybatisWishlistDao implements WishlistDao {

private static final String namespace = "com.furnifit.wishlist.dao.WishlistDao";
	
	@Inject
	private SqlSession sqlsession;
	
	@Override
	public void create(Map<String, String> map) {
		sqlsession.insert(namespace+".create", map);
	}

	@Override
	public List<Wishlist> read() {
		return sqlsession.selectList(namespace+".read");
	}

	@Override
	public void delete(Map<String, String> map) {
		sqlsession.delete(namespace+".delete", map);
	}

	@Override
	public List<Wishlist> userwishlist(Map<String, String> map) {
		return sqlsession.selectList(namespace+".userwishlist",map);
	}

}
