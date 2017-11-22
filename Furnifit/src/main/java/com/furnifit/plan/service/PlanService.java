package com.furnifit.plan.service;

import java.util.List;

import com.furnifit.common.web.Params;
import com.furnifit.plan.domain.Plan;

/**
 * PlanService 클래스
 * @author 손정화
 *
 */
public interface PlanService {
	
	/**
	 * 배치도 목록 리스트
	 * @param email
	 * @return List<Plan>
	 */
	public List<Plan> listAll(String email) throws Exception;
	
	/**
	 * 배치도목록 리스트(+페이징)
	 * @param params
	 * @return List<Plan>
	 */
	public List<Plan> listByParams(Params params) throws Exception;
	
	/**
	 * 출력페이지 계산을 위한 행의 수 반환 
	 * @param 
	 * @return int
	 */
	public int pageCount();
	
}
