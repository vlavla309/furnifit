package com.furnifit.planitem.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.planitem.domain.PlanItem;

/**
 * PlanItemDaoMyBatis 구현 클래스
 * @author 손정화
 *
 */
@Repository
public class MybatisPlanItemDao implements PlanItemDao {
	
	private static final String NAMESPACE = "com.furnifit.planitem.dao.PlanItemDao";
		
	@Inject
	private SqlSession sqlSession;

	/**
	 * 배치도 상세정보 조회
	 * @param planitemId
	 * @return PlanItem
	 */
	@Override
	public PlanItem read(int planitemId) throws Exception{
		return sqlSession.selectOne(NAMESPACE + ".read", planitemId);
	}
	
	/**
	 * 배치도 항목 리스트
	 * @param
	 * @return List<PlanItem>
	 */
	@Override
	public List<PlanItem> listAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}
	
	/**
	 * 배치도 항목 삭제
	 * @param planitemId
	 * @return
	 */
	@Override
	public void delete(int planitemId) throws Exception {
		sqlSession.delete(NAMESPACE+".delete", planitemId);
	}
}
