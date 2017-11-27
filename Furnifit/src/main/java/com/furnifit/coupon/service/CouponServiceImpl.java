package com.furnifit.coupon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.coupon.dao.CouponDao;
import com.furnifit.coupon.domain.Coupon;

/**
 * CouponServiceImpl 클래스
 * @author 김호준
 *
 */
@Service
public class CouponServiceImpl implements CouponService {
	
	@Inject
	private CouponDao daodao;

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
