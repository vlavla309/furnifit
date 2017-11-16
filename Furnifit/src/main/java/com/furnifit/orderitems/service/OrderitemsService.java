package com.furnifit.orderitems.service;

import java.util.List;

import com.furnifit.orderitems.domain.Orderitems;

/**
 * OrderitemsService 클래스
 * @author 손정화
 *
 */
public interface OrderitemsService {
	
	// 주문할 가구 등록
	public void create(Orderitems items) throws Exception;
	
	// 가구 정보 상세보기
	public Orderitems read(int productId) throws Exception;
	
	// 회원별 주문할 리스트
	public List<Orderitems> listAll() throws Exception;
	
	// 주문할 가구 삭제
	public void delete(int orderId, int productId) throws Exception;
	
	// 가구의 수량 변경
	public void update(Orderitems items) throws Exception;
}
