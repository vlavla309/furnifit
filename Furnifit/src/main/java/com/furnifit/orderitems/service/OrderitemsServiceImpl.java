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

	/**
	 * 주문항목 생성
	 * @param items
	 * @return
	 */
	@Override
	public void create(Orderitems items) {
		dao.create(items);
	}
	
	/**
	 * 주문항목 리스트 조회
	 * @param 
	 * @return List<Orderitems>
	 */
	@Override
	public List<Orderitems> listAll() throws Exception {
		return dao.listAll();
	}
	
	/**
	 * 주문항목 상세보기
	 * @param orderId
	 * @return List<Orderitems>
	 */
	@Override
	public List<Orderitems> read(int orderId) throws Exception {
		return dao.read(orderId);
	} 
}
