package com.furnifit.planitem.dao;

import java.util.List;

import com.furnifit.planitem.domain.PlanItem;


/**
 * PlanItemDao 인터페이스 
 * 
 * @author 손정화
 */
public interface PlanItemDao {
	
	/**
	 * 배치도 상세정보 조회
	 * @param planitemId
	 * @return PlanItem
	 */
	public PlanItem read(int planitemId) throws Exception;
	
	
	/**
	 * 배치도 항목 리스트
	 * @param
	 * @return List<PlanItem>
	 */
	public List<PlanItem> listAll() throws Exception;
	
	
	/**
	 * 배치도 항목 삭제
	 * @param planitemId
	 * @return
	 */
	public void delete(int planitemId) throws Exception;
	
}
