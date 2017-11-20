package com.furnifit.planitem.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<PlanItem> listAll(int planId, int planitemId) throws Exception {
		return dao.listAll(planId, planitemId);
	}
	
	@Override
	public void delete(int planId, int planitemId) throws Exception {
		dao.delete(planId, planitemId);
	}
}
