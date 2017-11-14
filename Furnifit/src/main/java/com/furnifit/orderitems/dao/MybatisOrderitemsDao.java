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

	// 주문할 가구 등록
	@Override
	public void create(Orderitems items) throws Exception {
		sqlSession.insert(NAMESPACE+".create", items);
	}
	
	// 가구 정보 상세보기
	@Override
	public Orderitems read(int productId) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".read", productId);
	}

	// 회원별 주문할 리스트
	@Override
	public List<Orderitems> listAll() throws Exception {
		return sqlSession.selectList(NAMESPACE+".listAll");
	}
	
	// 주문할 가구 삭제
	@Override
	public void delete(int orderId) throws Exception {
		sqlSession.delete(NAMESPACE+".delete", orderId);
	}

	// 가구의 수량 변경
	@Override
	public void update(Orderitems items) throws Exception {
		sqlSession.update(NAMESPACE+".update", items);
	}
}
