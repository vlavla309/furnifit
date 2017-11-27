package com.furnifit.article.dao;

import java.util.List;

import com.furnifit.article.domain.Criteria;
import com.furnifit.article.domain.Replies;

public interface RepliesDao {
	
	public List<Replies> list(Integer reply_id) throws Exception;
	
	public void create(Replies replies) throws Exception;
	
	public void update(Replies replies) throws Exception;
	
	public void delete(Integer article_id) throws Exception;
	
	public List<Replies> listPage(Integer article_id, Criteria cri) throws Exception;

    public int count(int article_id) throws Exception;
}
