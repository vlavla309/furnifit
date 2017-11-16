package com.furnifit.member.service;

import java.util.List;

import com.furnifit.member.domain.Coupon;

public interface CouponService {
/*	
	public List<Coupon> read(String email) throws Exception;
	*/
	
	public List<Coupon> read(String email) throws Exception;
	
	public List<Coupon> readAvailable(String email) throws Exception;
	
}
