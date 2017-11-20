package com.furnifit.planitem.service;

import java.util.List;

import com.furnifit.planitem.domain.PlanItem;

/**
 * PlanItem Service 클래스
 * @author 손정화
 *
 */
public interface PlanItemService {
	

	// 회원별 배치도 항목 리스트
	public List<PlanItem> listAll(int planId, int planitemId) throws Exception;
	
	// 배치도 항목 삭제
	public void delete(int planId, int planitemId) throws Exception;
	
}
