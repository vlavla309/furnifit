package com.furnifit.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.furnifit.member.domain.Coupon;
import com.furnifit.member.domain.Member;
import com.furnifit.member.service.CouponService;
import com.furnifit.member.service.MemberService;


@Controller
@RequestMapping(value = "/mypage")
public class MypageController {

	Logger log = Logger.getLogger(MypageController.class);

	@Inject
	private MemberService memberService;
	
	@Inject
	private CouponService couponService;

	// 마이페이지
	@RequestMapping(value = "/mypage", method=RequestMethod.GET)
	public String mypage() {
		log.debug("마이페이지");
		return "mypage/mypage";
	}
/*	
	// 쿠폰페이지
	@RequestMapping(value = "/coupon", method=RequestMethod.GET)
	public String coupon() {
		log.debug("쿠폰페이지");
		
		return "1";
	}*/
	/*
	// 쿠폰 확인
	@RequestMapping(value = "/coupon", method=RequestMethod.POST)
	public void coupon(String email) throws Exception {
		log.debug("쿠폰 확인");
		couponService.read(email);
	}
	*/
	@RequestMapping(value = "/coupon", method=RequestMethod.GET)
	public String coupon(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();   
		Member member = (Member) session.getAttribute("login");
		log.debug("쿠폰 확인" + member);
		List<Coupon> coupons = couponService.read(member.getEmail());
		for (Coupon coupon : coupons) {
			log.info(coupons);
		}
		model.addAttribute("coupons", coupons);
		return "mypage/coupon";
	}
}
