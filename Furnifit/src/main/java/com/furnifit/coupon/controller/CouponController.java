package com.furnifit.coupon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.furnifit.article.domain.Article;
import com.furnifit.article.service.ArticleService;
import com.furnifit.offercoupone.service.OfferCouponeService;

/**
 * 매월 1일 추천수가 많은 배치도 공유 게시글 작성자에게 쿠폰을 지급하는 컨트롤러
 * 매월 1일 기간이 만료된 쿠폰에 대한 처리
 * 
 * @author 한수진
 *
 */
@Component
public class CouponController {

	@Inject
	private ArticleService articlesrv;
	
	@Inject
	private OfferCouponeService offersrv;
	
	private Logger logger = Logger.getLogger(CouponController.class);
	//59 59 23 L * ? 매월 마지막 아무요일에 23시 59분 59초
	@Scheduled(cron = "00 00 00 1 * ?")
	public void doA() {
		List<Article> artlist = articlesrv.likecntcoupone();
		int couponeId = 5;
		for (Article article : artlist) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("email", article.getEmail());
			map.put("couponeid", couponeId+"");
			offersrv.create(map);
			couponeId--;
		}
		
		offersrv.update();
		
	}
	
}
