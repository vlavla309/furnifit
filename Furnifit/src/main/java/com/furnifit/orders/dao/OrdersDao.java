package com.furnifit.orders.dao;

import java.util.List;

import com.furnifit.common.web.Params;
import com.furnifit.orderitems.domain.Orderitems;
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
	
	// 주문 생성
	public void create(Orders order) throws Exception;
	
	// 회원별 주문목록 리스트
	public List<Orders> listAll(String email) throws Exception;
	// 회원별 주문목록 리스트
//	public List<Orders> listAll(String email, Params params) throws Exception;

	// 주문내역 상세보기-orderitems
	public List<Orderitems> read(int orderId) throws Exception;
	
	public List<Orders> price(int orderId) throws Exception;
}
