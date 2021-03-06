package com.furnifit.coupon.dao;

import java.util.List;

import com.furnifit.coupon.domain.Coupon;

/**
 * 쿠폰 Dao 인터페이스
 * 
 * @author 김호준
 */
public interface CouponDao {
	
	/**
	 * 회원별 발급된 쿠폰 확인
	 * @param email
	 * @return List<Coupon>
	 */
	public List<Coupon> read(String email) throws Exception;
	
	/**
	 * 사용 가능한 쿠폰 확인
	 * @param email
	 * @return List<Coupon>
	 */
	public List<Coupon> readAvailable(String email) throws Exception;
	
	/**
	 * 사용된 쿠폰 상태 변경(used_date, status)
	 * @param coupon
	 * @return 
	 */
	public void couponUpdate(Coupon coupon) throws Exception;
	
	/**
	 * 주문 시 사용된 쿠폰 확인
	 * @param orderId
	 * @return Coupon
	 */
	public Coupon serialRead(int orderId) throws Exception;
}
