package com.furnifit.plan.dao;

import java.util.List;

import com.furnifit.plan.domain.Plan;
import com.furnifit.planitem.domain.PlanItem;


/**
 * Orderitems Dao 인터페이스 
 * @author 손정화
 *
 */
public interface PlanDao {
	
	/**
	 * orderitems 추가
	 * @param orderitems
	 */
	
	// 주문별 배치도 정보 상세보기
	public List<PlanItem> read(int planId, int planitemId) throws Exception;
	
	// 회원별 배치도목록 리스트
	public List<Plan> listAll(String email) throws Exception;
	
}
