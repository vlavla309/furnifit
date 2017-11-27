package com.furnifit.orderitems.service;

import java.util.List;

import com.furnifit.orderitems.domain.Orderitems;

/**
 * OrderitemsService 클래스
 * @author 손정화
 *
 */
public interface OrderitemsService {
	
	/**
	 * 주문항목 생성
	 * @param items
	 * @return
	 */
	public void create(Orderitems items);
	
	/**
	 * 주문항목 리스트 조회
	 * @param 
	 * @return List<Orderitems>
	 */
	public List<Orderitems> listAll() throws Exception;
	
	/**
	 * 주문항목 상세보기
	 * @param orderId
	 * @return List<Orderitems>
	 */
	public List<Orderitems> read(int orderId) throws Exception;
	
}
