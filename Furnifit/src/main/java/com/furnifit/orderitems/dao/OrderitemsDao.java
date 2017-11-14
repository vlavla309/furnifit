package com.furnifit.orderitems.dao;

import java.util.List;

import com.furnifit.orderitems.domain.Orderitems;


/**
 * Orderitems Dao 인터페이스 
 * @author 손정화
 *
 */
public interface OrderitemsDao {
	
	/**
	 * orderitems 추가
	 * @param orderitems
	 */
	
	// 주문할 가구 등록
	public void create(Orderitems items) throws Exception;
	
	// 가구 정보 상세보기
	public Orderitems read(int productId) throws Exception;
	
	// 회원별 주문할 리스트
	public List<Orderitems> listAll() throws Exception;
	
	// 주문할 가구 삭제
	public void delete(int orderId) throws Exception;
	
	// 가구의 수량 변경
	public void update(Orderitems items) throws Exception;
}
