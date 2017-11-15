package com.furnifit.orderitems.service;

import java.util.List;

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

	// 주문할 가구 등록
	@Override
	public void create(Orderitems items) throws Exception {
		dao.create(items);
	}
	
	// 가구 정보 상세보기
	@Override
	public Orderitems read(int productId) throws Exception {
		return dao.read(productId);
	}
	
	// 회원별 주문할 리스트
	@Override
	public List<Orderitems> listAll() throws Exception {
		return dao.listAll();
	}
	
	// 주문할 가구 삭제
	@Override
	public void delete(int orderId, int productId) throws Exception {
		dao.delete(orderId, productId);
	}
	
	// 가구의 수량 변경
	@Override
	public void update(Orderitems items) throws Exception {
		dao.update(items);
	}
}
