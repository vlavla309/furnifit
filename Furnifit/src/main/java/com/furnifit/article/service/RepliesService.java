package com.furnifit.article.service;

import java.util.List;

import com.furnifit.article.domain.Criteria;
import com.furnifit.article.domain.Replies;

public interface RepliesService {
	public void addReplies(Replies replies) throws Exception;
	
	public List<Replies> listReplies(Integer reply_id) throws Exception;
	
	public void modifyReplies(Replies replies) throws Exception;
	
	public void removeReplies(Integer article_id) throws Exception;
	
	public List<Replies> listRepliesPage(Integer reply_id, Criteria cri) throws Exception;
	
	public int count(Integer reply_id) throws Exception;
	
}
