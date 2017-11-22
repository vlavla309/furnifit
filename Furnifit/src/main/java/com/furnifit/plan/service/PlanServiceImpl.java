package com.furnifit.plan.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.common.web.Params;
import com.furnifit.plan.dao.PlanDao;
import com.furnifit.plan.domain.Plan;

/**
 * PlanServiceImpl 클래스
 * @author 손정화
 *
 */
@Service
public class PlanServiceImpl implements PlanService {
	
	@Inject
	private PlanDao dao;
	
	/**
	 * 배치도 목록 리스트
	 * @param email
	 * @return List<Plan>
	 */
	@Override
	public List<Plan> listAll(String email) throws Exception {
		return dao.listAll(email);
	}

	/**
	 * 배치도목록 리스트(+페이징)
	 * @param params
	 * @return List<Plan>
	 */
	@Override
	public List<Plan> listByParams(Params params) throws Exception {
		return dao.listByParams(params);
	}

	/**
	 * 출력페이지 계산을 위한 행의 수 반환 
	 * @param 
	 * @return int
	 */
	@Override
	public int pageCount() {
		return dao.pageCount();
	}
}
