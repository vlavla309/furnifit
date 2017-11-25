package com.furnifit.member.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.furnifit.coupon.dao.CouponDao;
import com.furnifit.coupon.domain.Coupon;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/*.xml" }) 
public class CouponDaoTest {
	
	@Inject
	private CouponDao daodao;
	
	private static Logger logger = LoggerFactory.getLogger(CouponDaoTest.class);
	
	//@Test
	public void testread() throws Exception {
		String email = "aaaa@gmail.com";
		List<Coupon> aa = daodao.read(email);
		for (Coupon coupon : aa) {
			logger.info("쿠폰"+coupon);
		}

		System.out.println("aa");
	}
	
	@Test
	public void testreadAvailable() throws Exception {
		String email = "aaaa@gmail.com";
		List<Coupon> aa = daodao.read(email);
		for (Coupon coupon : aa) {
			logger.info("사용가능한 쿠폰"+coupon);
		}

		System.out.println("aa");
	}
}
