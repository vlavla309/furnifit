package com.furnifit.like.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.like.domain.Like;

@Repository
public class MyBatisLikeDao implements LikeDao {

	@Inject
	private SqlSession sqlSession;
	 
	private static final String namespace= "com.furnifit.like.dao.LikeDao";
	
	
	@Override
	public void create(Like like) {
		sqlSession.insert(namespace + ".create", like);

	}

	@Override
	public Like read(Map<String, Object> map) {
		return sqlSession.selectOne(namespace + ".read", map);
	}

	@Override
	public int likeCount(int articleId) {
		return sqlSession.selectOne(namespace + ".likeCount", articleId);
	}

}
