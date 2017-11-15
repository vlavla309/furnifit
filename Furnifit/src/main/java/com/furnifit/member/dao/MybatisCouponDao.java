package com.furnifit.member.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.member.domain.Coupon;

@Repository
public class MybatisCouponDao implements CouponDao {
	
	private static final String NAMESPACE = "com.furnifit.member.dao.CouponDao";

	@Inject
	private SqlSession sqlSession;
/*
	@Override
	public List<Coupon> read(String email) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".read", email);
	}
	*/
	

	@Override
	public List<Coupon> read(String email) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".read", email);
		
	}


	@Override
	public List<Coupon> readAvailable(String email) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".readAvailable", email);
	}
	
}
