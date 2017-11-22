package com.furnifit.orders.dao;

import java.util.List;

import com.furnifit.common.web.Params;
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
	
	public List<Orders> price(int orderId) throws Exception;
}
