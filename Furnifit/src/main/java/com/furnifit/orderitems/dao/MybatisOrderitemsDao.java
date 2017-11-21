package com.furnifit.orderitems.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.orderitems.domain.Orderitems;

/**
 * OrderitemsDao MyBatis 구현 클래스
 * @author 손정화
 *
 */
@Repository
public class MybatisOrderitemsDao implements OrderitemsDao {
	
	private static final String NAMESPACE = "com.furnifit.orderitems.dao.OrderitemsDao";
		
	@Inject
	private SqlSession sqlSession;

/*	@Override
	public void create(Orderitems items) throws Exception {
		sqlSession.insert(NAMESPACE+".create", items);
	}
*/	
	// 주문할 가구 등록
	@Override
//		public void create(Map<String, String> map) {
	public void create(Orderitems items) {
		sqlSession.insert(NAMESPACE + ".create", items);
	}
	
	// 가구 정보 상세보기
//	@Override
//	public Orderitems read(int productId) throws Exception {
//		return sqlSession.selectOne(NAMESPACE+".read", productId);
//	}

	
	// 회원별 주문할 리스트
	@Override
	public List<Orderitems> listAll(int orderId) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll", orderId);
	}
	
	// 주문할 가구 삭제
//	@Override
//	public void delete(int orderId, int productId) throws Exception {
//		Map<String, Integer> map = new HashMap<>();
//		map.put("orderId", orderId);
//		map.put("productId", productId);
//		
//		sqlSession.delete(NAMESPACE+".delete", map);
//	}
//
//	// 가구의 수량 변경
//	@Override
//	public void update(Orderitems items) throws Exception {
//		sqlSession.update(NAMESPACE+".update", items);
//	}
}
