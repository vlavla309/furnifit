package com.furnifit.orders.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.orderitems.domain.Orderitems;
import com.furnifit.orders.domain.Orders;

/**
 * OrdersDao MyBatis 구현 클래스
 * @author 손정화
 *
 */
@Repository
public class MybatisOrdersDao implements OrdersDao {
	
	private static final String NAMESPACE = "com.furnifit.orders.dao.OrdersDao";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void create(Orders order) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", order);
	}
	
	@Override
	public List<Orders> listAll(String email) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll", email);
	}
	
	@Override
	public List<Orderitems> read(int orderId) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".read", orderId);
	}
	
	@Override
	public List<Orders> price(int orderId) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".price", orderId);
	}
	
//	@Override
//	public void delete(int orderId) throws Exception {
//		sqlSession.delete(NAMESPACE+".delete", orderId);
//	}
//
//	@Override
//	public void update(Orders order) throws Exception {
//		sqlSession.update(NAMESPACE+".update", order);
//	}
}
