package com.furnifit.orders.service;

import java.util.List;

import com.furnifit.orders.domain.Orders;

/**
 * OrdersService 클래스
 * @author 손정화
 *
 */
public interface OrdersService {
	
//	public void create(Orders order) throws Exception;

	// 주문내역 상세보기
	public Orders read(int orderId) throws Exception;
	
	// 회원별 주문 리스트
	public List<Orders> listAll(String email) throws Exception;
	
//	public void delete(int orderId) throws Exception;
//	public void update(Orders order) throws Exception;
}
