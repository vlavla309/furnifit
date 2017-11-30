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

import com.furnifit.coupon.domain.Coupon;
import com.furnifit.coupon.service.CouponService;
import com.furnifit.member.domain.Member;
import com.furnifit.member.service.MemberService;

/**
 * Mypage Controller 클래스
 * 
 * @author 김호준
 */
@Controller
@RequestMapping(value = "/mypage")
public class MypageController {

	Logger log = Logger.getLogger(MypageController.class);

	@Inject                               // 해당 타입의 객체를 찾아서 변수에 자동으로 할당시킴
	private MemberService memberService;  // root-context.xml 파일에 <context:component-scan /> 태그 설정되어 있음
	
	@Inject                               // 해당 타입의 객체를 찾아서 변수에 자동으로 할당시킴
	private CouponService couponService;  // root-context.xml 파일에 <context:component-scan /> 태그 설정되어 있음

	/** 마이페이지로 이동 */
	@RequestMapping(value = "", method=RequestMethod.GET)
	public String mypage() {
		log.debug("마이페이지");
		return "mypage/mypage";
	}
	
	/** 사용가능한 쿠폰, 사용완료한 쿠폰, 기간만료한 쿠폰 확인 */
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
