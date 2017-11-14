package com.furnifit.orders.service;

import java.util.List;

import com.furnifit.orders.domain.Orders;

/**
 * OrdersService 클래스
 * @author 손정화
 *
 */
public interface OrdersService {
	
	// 주문 가구 등록
	public void create(Orders order) throws Exception;
	
	// 이메일로 가구 조회
	public Orders read(String email) throws Exception;
	
	// 회원별 주문 리스트
	public List<Orders> listAll(String email) throws Exception;
	
	// 주문할 가구 삭제
	public void delete(int orderId) throws Exception;
	
	// 가구 수량 변경
	public void update(Orders order) throws Exception;
}
