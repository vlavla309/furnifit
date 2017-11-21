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
	
	
	/**
	 * 배치도 상세정보 조회
	 * @param planitemId
	 * @return PlanItem
	 */
	@Override
	public PlanItem read(int planItemId) throws Exception {
		return dao.read(planItemId);
	}
	
	/**
	 * 배치도 항목 리스트
	 * @param
	 * @return List<PlanItem>
	 */
	@Override
	public List<PlanItem> listAll() throws Exception {
		return dao.listAll();
	}
	
	/**
	 * 배치도 항목 삭제
	 * @param planitemId
	 * @return
	 */
	@Override
	public void delete(int planitemId) throws Exception {
		dao.delete(planitemId);
	}
}

