package com.furnifit.planitem.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.planitem.dao.PlanItemDao;
import com.furnifit.planitem.domain.PlanItem;

/**
 * PlanItemServiceImpl 클래스
 * @author 손정화
 *
 */
@Service
public class PlanItemServiceImpl implements PlanItemService {
	
	@Inject
	private PlanItemDao dao;

	
	@Override
	public List<PlanItem> listAll(String email) throws Exception {
		return dao.listAll(email);
	}
	
	@Override
	public void delete(int planId, int planitemId) throws Exception {
		dao.delete(planId, planitemId);
	}
}
