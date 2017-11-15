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
	
//	public void create(Orders order) throws Exception;
	
	// 주문내역 상세보기
	public Orders read(int orderId) throws Exception;
	
	// 회원별 주문목록 리스트
	public List<Orders> listAll(String email) throws Exception;
	
//	public void delete(int orderId) throws Exception;
//	public void update(Orders order) throws Exception;
}
