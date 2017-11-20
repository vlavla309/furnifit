package com.furnifit.plan.service;

import java.util.List;

import com.furnifit.orders.domain.Orders;
import com.furnifit.plan.domain.Plan;
import com.furnifit.planitem.domain.PlanItem;

/**
 * PlanItem Service 클래스
 * @author 손정화
 *
 */
public interface PlanService {
	

	// 주문별 배치도 정보 상세보기
	public Plan read(int planitemId) throws Exception;
	
	// 회원별 배치도목록 리스트
	public List<Plan> listAll(String email) throws Exception;
	
}
