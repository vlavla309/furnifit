package com.furnifit.orders.service;

import java.util.List;

import com.furnifit.orderitems.domain.Orderitems;
import com.furnifit.orders.domain.Orders;

/**
 * OrdersService 클래스
 * @author 손정화
 *
 */
public interface OrdersService {

	// 주문 생성
	public void create(Orders order) throws Exception;

	// 회원별 주문 리스트
	public List<Orders> listAll(String email) throws Exception;
	
	// 주문내역 상세보기 - orderitems
	public List<Orderitems> read(int orderId) throws Exception;
//	public void delete(int orderId) throws Exception;
//	public void update(Orders order) throws Exception;
	
	public List<Orders> price(int orderId) throws Exception;
}
