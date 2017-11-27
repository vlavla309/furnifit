package com.furnifit.orders.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.common.web.Params;
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

	/**
	 * 주문 생성
	 * @param order
	 * @return
	 */
	@Override
	public void create(Orders order) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", order);
	}
	
	/**
	 * 주문목록 리스트
	 * @param email
	 * @return List<Orders>
	 */
	@Override
	public List<Orders> listAll(String email) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll", email);
	}

	/**
	 * 주문목록 리스트(+페이징)
	 * @param params
	 * @return List<Orders>
	 */
	@Override
	public List<Orders> listByParams(Params params) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listByParams", params);
	}

	/**
	 * 출력페이지 계산을 위한 행의 수 반환 
	 * @param 
	 * @return int
	 */
	@Override
	public int pageCount() {
		return sqlSession.selectOne(NAMESPACE + ".pageCount");
	}

	/**
	 * 총합계 금액 반환
	 * @param orderId
	 * @return List<Orders>
	 */
	@Override
	public List<Orders> price(int orderId) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".price", orderId);
	}

	/**
	 * 적용한 쿠폰 시리얼 번호 변경
	 * @param orders
	 * @return 
	 */
	@Override
	public void serialUpdate(Orders orders) throws Exception {
		sqlSession.update(NAMESPACE + ".serialUpdate", orders);
	}
}
