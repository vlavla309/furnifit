package com.furnifit.coupon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.coupon.dao.CouponDao;
import com.furnifit.coupon.domain.Coupon;

/**
 * CouponServiceImpl 클래스
 * 
 * @author 김호준
 */
@Service  // Service를 스프링에 인식, 비즈니스 로직 처리를 위해서 @Service 클래스 사용
public class CouponServiceImpl implements CouponService {
	
	@Inject                    // 해당 타입의 객체를 찾아서 변수에 자동으로 할당시킴
	private CouponDao daodao;  // XML Mapper 파일에 등록된 SQL을 실행하기 위한 다양한 기능을 제공하기 때문에 사용했음

	/**
	 * 회원별 발급된 쿠폰 확인
	 * @param email
	 * @return List<Coupon>
	 */
	@Override
	public List<Coupon> read(String email) throws Exception {
		return daodao.read(email);
	}

	/**
	 * 사용 가능한 쿠폰 확인
	 * @param email
	 * @return List<Coupon>
	 */
	@Override
	public List<Coupon> readAvailable(String email) throws Exception {
		return daodao.readAvailable(email);
	}
	
	/**
	 * 사용된 쿠폰 상태 변경(used_date, status)
	 * @param coupon
	 * @return 
	 */
	@Override
	public void couponUpdate(Coupon coupon) throws Exception {
		daodao.couponUpdate(coupon);
	}

	/**
	 * 주문 시 사용된 쿠폰 확인
	 * @param orderId
	 * @return Coupon
	 */
	@Override
	public Coupon serialRead(int orderId) throws Exception {
		return daodao.serialRead(orderId);
	}
}
