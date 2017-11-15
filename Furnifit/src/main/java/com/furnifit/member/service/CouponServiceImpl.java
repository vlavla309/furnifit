package com.furnifit.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.member.dao.CouponDao;
import com.furnifit.member.domain.Coupon;

@Service
public class CouponServiceImpl implements CouponService {
	
	@Inject
	private CouponDao daodao;
/*	
	@Override
	public List<Coupon> read(String email) throws Exception {
		return daodao.read(email);
	}
*/
	
	@Override
	public List<Coupon> read(String email) throws Exception {
		return daodao.read(email);
	}

	@Override
	public List<Coupon> readAvailable(String email) throws Exception {
		return daodao.readAvailable(email);
	}
	
}
