package com.furnifit.article.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.article.domain.Criteria;
import com.furnifit.article.domain.Replies;

@Repository
public class MybatisRepliesDao implements RepliesDao {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.furnifit.article.dao.RepliesDao";

	@Override
	public List<Replies> list(Integer reply_id) throws Exception {
		return session.selectList(namespace + ".list", reply_id);
	}

	@Override
	public void create(Replies replies) throws Exception {
		session.insert(namespace + ".create", replies);
	}

	@Override
	public void update(Replies replies) throws Exception {
		session.update(namespace + ".update", replies);
	}

	@Override
	public void delete(Integer article_id) throws Exception {
		session.delete(namespace + ".delete", article_id);
	}

	@Override
	public List<Replies> listPage(Integer article_id, Criteria cri) throws Exception {
		 Map<String, Object> paramMap = new HashMap<>();
		 
		 paramMap.put("article_id", article_id);
		 paramMap.put("cri", cri);
		 
		 return session.selectList(namespace + ".listPage", paramMap);
	}

	@Override
	public int count(Integer article_id) throws Exception {
		return session.selectOne(namespace + ".count", article_id);
	} 
	
}
