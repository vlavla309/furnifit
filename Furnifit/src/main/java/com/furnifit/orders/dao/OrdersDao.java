package com.furnifit.orders.dao;

import java.util.List;

import com.furnifit.orders.domain.Orders;


/**
 * Orders Dao 인터페이스 
 * @author 손정화
 *
 */
public interface OrdersDao {
	
	/**
	 * orders 추가
	 * @param orders
	 */
	
	// 주문할 가구 담기
	public void create(Orders order) throws Exception;
	
	// 이메일로 가구 조회
	public Orders read(String email) throws Exception;
	
	// 회원별 주문할 가구 리스트
	public List<Orders> listAll(String email) throws Exception;
	
	// 주문할 가구 삭제
	public void delete(int orderId) throws Exception;
	
	// 가구 수량 변경
	public void update(Orders order) throws Exception;
}
