package com.furnifit.plan.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.plan.dao.PlanDao;
import com.furnifit.plan.domain.Plan;
import com.furnifit.planitem.domain.PlanItem;

/**
 * PlanItemServiceImpl 클래스
 * @author 손정화
 *
 */
@Service
public class PlanServiceImpl implements PlanService {
	
	@Inject
	private PlanDao dao;

	@Override
	public List<Plan> listAll(String email) throws Exception {
		return dao.listAll(email);
	}
	
	@Override
	public List<PlanItem> read(int planId, int planitemId) throws Exception {
		return dao.read(planId, planitemId);
	}
	
}
