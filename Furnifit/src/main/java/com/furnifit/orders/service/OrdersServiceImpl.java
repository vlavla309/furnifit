package com.furnifit.orders.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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

	@Override
	public void create(Orders order) throws Exception {
		dao.create(order);
	}
	
	@Override
	public Orders read(String email) throws Exception {
		return dao.read(email);
	} 
	
	@Override
	public List<Orders> listAll(String email) throws Exception {
		return dao.listAll(email);
	}
	
	@Override
	public void delete(int orderId) throws Exception {
		dao.delete(orderId);
	}
	
	@Override
	public void update(Orders order) throws Exception {
		dao.update(order);
	}
}