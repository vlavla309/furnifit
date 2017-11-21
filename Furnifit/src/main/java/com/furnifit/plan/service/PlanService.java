package com.furnifit.plan.service;

import java.util.List;

import com.furnifit.plan.domain.Plan;

/**
 * PlanService 클래스
 * @author 손정화
 *
 */
public interface PlanService {
	
	/**
	 * 회원별 배치도 목록 리스트
	 * @param email
	 * @return List<Plan>
	 */
	public List<Plan> listAll(String email) throws Exception;
	
}
