package com.furnifit.offercoupone.dao;

import java.util.Map;

/**
 * @author 한수진
 *
 */
public interface OfferCouponeDao {
	/**
	 * 쿠폰 생성할때, email하고, couponeId를 받아와야함 
	 * 1등이 50%, 2등 40% 3등 30% 
	 * couponeId 1번  10%, 2번  20%, 3번  30%, 4번  40%, 5번  50% 
	 * @param map
	 */
	public void create(Map<String, String> map);
	
	public void update();

}
