package com.furnifit.planitem.dao;

import java.util.List;

import com.furnifit.orderitems.domain.Orderitems;
import com.furnifit.planitem.domain.PlanItem;


/**
 * PlanItem Dao 인터페이스 
 * @author 손정화
 *
 */
public interface PlanItemDao {
	
	/**
	 * PlanItem 추가
	 * @param PlanItem
	 */
	
	// 가구 정보 상세보기
//	public PlanItem read(int planId) throws Exception;
	
	// 회원별 배치도 항목 리스트
	public List<PlanItem> listAll(int planId, int planitemId) throws Exception;
	
	// 배치도 항목 삭제
	public void delete(int planId, int planitemId) throws Exception;
	
}
