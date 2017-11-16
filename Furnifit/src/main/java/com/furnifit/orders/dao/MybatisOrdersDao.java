package com.furnifit.orders.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

//	@Override
//	public void create(Orders order) throws Exception {
//		sqlSession.insert(NAMESPACE+".create", order);
//	}
//	
//	@Override
//	public Orders read(String email) throws Exception {
//		return sqlSession.selectOne(NAMESPACE+".read", email);
//	}

	@Override
	public Orders read(int orderId) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".read", orderId);
	}
	
	@Override
	public List<Orders> listAll(String email) throws Exception {
		return sqlSession.selectList(NAMESPACE+".listAll", email);
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
