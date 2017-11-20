package com.furnifit.orderitems.dao;

import java.util.List;
import java.util.Map;

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
	public void create(Map<String, String> map);
	
	// 회원별 주문할 리스트
	public List<Orderitems> listAll(int orderId) throws Exception;
	
	//public void create(Orderitems items) throws Exception;
	// 가구 정보 상세보기 --> product에서 read
	//public Orderitems read(int productId) throws Exception;
	// 주문할 가구 삭제
	//public void delete(int orderId, int productId) throws Exception;
	// 가구의 수량 변경
	//public void update(Orderitems items) throws Exception;
}
