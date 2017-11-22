package com.furnifit.orders.service;

import java.util.List;

import com.furnifit.common.web.Params;
import com.furnifit.orders.domain.Orders;

/**
 * OrdersService 클래스
 * @author 손정화
 *
 */
public interface OrdersService {

	/**
	 * 주문 생성
	 * @param order
	 * @return
	 */
	public void create(Orders order) throws Exception;
	
	/**
	 * 주문목록 리스트
	 * @param email
	 * @return List<Orders>
	 */
	public List<Orders> listAll(String email) throws Exception;
	
	/**
	 * 주문목록 리스트(+페이징)
	 * @param params
	 * @return List<Orders>
	 */
	public List<Orders> listByParams(Params params) throws Exception;
	
	/**
	 * 출력페이지 계산을 위한 행의 수 반환 
	 * @param 
	 * @return int
	 */
	public int pageCount();
	
	/**
	 * 총합계 금액 반환
	 * @param orderId
	 * @return List<Orders>
	 */
	public List<Orders> price(int orderId) throws Exception;
	
}
