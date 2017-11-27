package com.furnifit.coupon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.coupon.dao.CouponDao;
import com.furnifit.coupon.domain.Coupon;

@Service
public class CouponServiceImpl implements CouponService {
	
	@Inject
	private CouponDao daodao;
	
	@Override
	public List<Coupon> read(String email) throws Exception {
		return daodao.read(email);
	}

	@Override
	public List<Coupon> readAvailable(String email) throws Exception {
		return daodao.readAvailable(email);
	}

	@Override
	public void couponUpdate(Coupon coupon) throws Exception {
		daodao.couponUpdate(coupon);
	}

	@Override
	public Coupon serialRead(int orderId) throws Exception {
		return daodao.serialRead(orderId);
	}
	
}
