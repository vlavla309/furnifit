package com.furnifit.plan.dao;

import java.util.List;

import com.furnifit.plan.domain.Plan;


/**
 * PlanDao 인터페이스 
 * @author 손정화
 *
 */
public interface PlanDao {
	
	/**
	 * 회원별 배치도 목록 리스트
	 * @param email
	 * @return List<Plan>
	 */
	public List<Plan> listAll(String email) throws Exception;
	
}
