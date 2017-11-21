package com.furnifit.orders.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.common.web.Params;
import com.furnifit.orderitems.dao.OrderitemsDao;
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
	
	@Inject
	private OrderitemsDao orderitemsdao;

//	@Override
//	public void create(Orders order) throws Exception {
//		dao.create(order);
//	}
	
	
//	@Override
//	public List<Orders> read(int orderId) throws Exception {
//		return dao.read(orderId);
//	}
	
	@Override
	public void create(Orders order) throws Exception {
		dao.create(order);
	}
	
	@Override
	public List<Orders> listAll(String email) throws Exception {
		return dao.listAll(email);
	}
	
	
	/** 게시글 리스트(+페이징) */
	@Override
	public List<Orders> listPage(int page) throws Exception {
		return dao.listPage(page);
	}
	
	@Override
	public List<Orders> price(int orderId) throws Exception {
		return dao.price(orderId);
	}

	@Override
	public List<Orders> listParams(Params params) throws Exception {
		return dao.listParams(params);
	}
	
//	@Override
//	public void delete(int orderId) throws Exception {
//		dao.delete(orderId);
//	}
//	
//	@Override
//	public void update(Orders order) throws Exception {
//		dao.update(order);
//	}
}
