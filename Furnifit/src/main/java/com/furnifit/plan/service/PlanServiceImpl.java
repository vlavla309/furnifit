package com.furnifit.plan.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
	 * 회원별 배치도 목록 리스트
	 * @param email
	 * @return List<Plan>
	 */
	@Override
	public List<Plan> listAll(String email) throws Exception {
		return dao.listAll(email);
	}
}
