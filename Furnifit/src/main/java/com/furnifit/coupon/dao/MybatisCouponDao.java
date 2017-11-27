package com.furnifit.coupon.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.coupon.domain.Coupon;

/**
 * CouponDao MyBatis 구현 클래스
 * @author 김호준
 *
 */
@Repository
public class MybatisCouponDao implements CouponDao {
	
	private static final String NAMESPACE = "com.furnifit.coupon.dao.CouponDao";

	@Inject
	private SqlSession sqlSession;

	/**
	 * 회원별 발급된 쿠폰 확인
	 * @param email
	 * @return List<Coupon>
	 */
	@Override
	public List<Coupon> read(String email) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".read", email);
	}

	/**
	 * 사용 가능한 쿠폰 확인
	 * @param email
	 * @return List<Coupon>
	 */
	@Override
	public List<Coupon> readAvailable(String email) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".readAvailable", email);
	}

	/**
	 * 사용된 쿠폰 상태 변경(used_date, status)
	 * @param coupon
	 * @return 
	 */
	@Override
	public void couponUpdate(Coupon coupon) throws Exception {
		sqlSession.update(NAMESPACE + ".couponUpdate", coupon);
	}

	/**
	 * 주문 시 사용된 쿠폰 확인
	 * @param orderId
	 * @return Coupon
	 */
	@Override
	public Coupon serialRead(int orderId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".serialRead", orderId);
	}
}
