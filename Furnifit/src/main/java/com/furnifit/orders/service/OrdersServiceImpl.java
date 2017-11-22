package com.furnifit.orders.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.common.web.Params;
import com.furnifit.orders.dao.OrdersDao;
import com.furnifit.orders.domain.Orders;

/**
 * OrdersServiceImpl 클래스
 * @author 손정화
 *
 */
@Service
public class OrdersServiceImpl implements OrdersService {
	
	@Inject
	private OrdersDao dao;

	/**
	 * 주문 생성
	 * @param order
	 * @return
	 */
	@Override
	public void create(Orders order) throws Exception {
		dao.create(order);
	}
	
	/**
	 * 주문목록 리스트
	 * @param email
	 * @return List<Orders>
	 */
	@Override
	public List<Orders> listAll(String email) throws Exception {
		return dao.listAll(email);
	}

	/**
	 * 주문목록 리스트(+페이징)
	 * @param params
	 * @return List<Orders>
	 */
	@Override
	public List<Orders> listByParams(Params params) throws Exception {
		return dao.listByParams(params);
	}

	/**
	 * 출력페이지 계산을 위한 행의 수 반환 
	 * @param 
	 * @return int
	 */
	@Override
	public int pageCount() {
		return dao.pageCount();
	}
	
	/**
	 * 총합계 금액 반환
	 * @param orderId
	 * @return List<Orders>
	 */
	@Override
	public List<Orders> price(int orderId) throws Exception {
		return dao.price(orderId);
	}
}
