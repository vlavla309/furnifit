package com.furnifit.coupon.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.coupon.domain.Coupon;

/**
 * CouponDao 인터페이스의 구현 클래스
 * @author 김호준
 *
 */
@Repository // Dao를 스프링에 인식, 데이터베이스 연동을 위해서 @Repository 사용
public class MybatisCouponDao implements CouponDao {
	
	private static final String NAMESPACE = "com.furnifit.coupon.dao.CouponDao";

	@Inject                         // 해당 타입의 객체를 찾아서 변수에 자동으로 할당시킴
	private SqlSession sqlSession;  // XML Mapper 파일에 등록된 SQL을 실행하기 위한 다양한 기능을 제공하기 때문에 사용했음

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
