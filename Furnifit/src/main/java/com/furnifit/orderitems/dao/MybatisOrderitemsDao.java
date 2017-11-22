package com.furnifit.orderitems.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.orderitems.domain.Orderitems;

/**
 * OrderitemsDaoMyBatis 구현 클래스
 * @author 손정화
 *
 */
@Repository
public class MybatisOrderitemsDao implements OrderitemsDao {
	
	private static final String NAMESPACE = "com.furnifit.orderitems.dao.OrderitemsDao";
		
	@Inject
	private SqlSession sqlSession;
	
	/**
	 * 주문항목 생성
	 * @param items
	 * @return
	 */
	@Override
	public void create(Orderitems items) {
		sqlSession.insert(NAMESPACE + ".create", items);
	}
	
	/**
	 * 주문서 리스트 조회
	 * @param email
	 * @return List<Orderitems>
	 */
	@Override
	public List<Orderitems> listAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}
	
	/**
	 * 주문항목 상세보기
	 * @param orderId
	 * @return List<Orderitems>
	 */
	@Override
	public List<Orderitems> read(int orderId) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".read", orderId);
	}
}
