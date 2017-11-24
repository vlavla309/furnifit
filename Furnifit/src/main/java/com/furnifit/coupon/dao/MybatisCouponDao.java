package com.furnifit.coupon.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.coupon.domain.Coupon;

@Repository
public class MybatisCouponDao implements CouponDao {
	
	private static final String NAMESPACE = "com.furnifit.coupon.dao.CouponDao";

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<Coupon> read(String email) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".read", email);
		
	}

	@Override
	public List<Coupon> readAvailable(String email) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".readAvailable", email);
	}

	@Override
	public void couponUpdate(Coupon coupon) throws Exception {
		sqlSession.update(NAMESPACE + ".couponUpdate", coupon);
	}

	@Override
	public Coupon serialRead(int orderId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".serialRead", orderId);
	}
}
