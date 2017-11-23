package com.furnifit.member.service;

import java.util.List;

import com.furnifit.member.domain.Coupon;

public interface CouponService {
	
	public List<Coupon> read(String email) throws Exception;
	
	// 사용 가능한 쿠폰 확인
	public List<Coupon> readAvailable(String email) throws Exception;
	
	// 사용된 쿠폰 used_date, status 변경
	public void couponUpdate(Coupon coupon) throws Exception;
}
