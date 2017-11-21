package com.furnifit.orderitems.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.orderitems.dao.OrderitemsDao;
import com.furnifit.orderitems.domain.Orderitems;

/**
 * OrderitemsServiceImpl 클래스
 * @author 손정화
 *
 */
@Service
public class OrderitemsServiceImpl implements OrderitemsService {
	
	@Inject
	private OrderitemsDao dao;

	/*@Override
	public void create(Orderitems items) throws Exception {
		dao.create(items);
	}*/

	// 주문할 가구 등록
	@Override
//	public void create(Map<String, String> map) {
	public void create(Orderitems items) {
		dao.create(items);
	}
	
	// 회원별 주문항목 리스트
	@Override
	public List<Orderitems> listAll() throws Exception {
//		public List<Orderitems> listAll(int orderId) throws Exception {
		return dao.listAll();
	}
	
	@Override
	public List<Orderitems> read(int orderId) throws Exception {
		return dao.read(orderId);
	} 
	
	// 가구 정보 상세보기
//	@Override
//	public Orderitems read(int productId) throws Exception {
//		return dao.read(productId);
//	}
//	
//	// 회원별 주문할 리스트
//	@Override
//	public List<Orderitems> listAll(String email) throws Exception {
//		return dao.listAll(email);
//	}
//	
//	// 주문할 가구 삭제
//	@Override
//	public void delete(int orderId, int productId) throws Exception {
//		dao.delete(orderId, productId);
//	}
//	
//	// 가구의 수량 변경
//	@Override
//	public void update(Orderitems items) throws Exception {
//		dao.update(items);
//	}
}
