package com.furnifit.member.dao;

import java.util.List;

import com.furnifit.member.domain.Coupon;

public interface CouponDao {
/*	
	// 쿠폰 확인
	public List<Coupon> read(String email) throws Exception;
	*/
	
	// 쿠폰 확인
	public List<Coupon> read(String email) throws Exception;
	
	// 사용 가능한 쿠폰
	public List<Coupon> readAvailable(String email) throws Exception;
	
	
	// 사용 가능한 쿠폰 확인
	public List<Coupon> couponAvailable() throws Exception;
}
