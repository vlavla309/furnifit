package com.furnifit.article.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.article.dao.RepliesDao;
import com.furnifit.article.domain.Criteria;
import com.furnifit.article.domain.Replies;

@Service
public class RepliesServiceImpl implements RepliesService {
	
	@Inject
	private RepliesDao dao;
	
	@Override
	public void addReplies(Replies replies) throws Exception {
		dao.create(replies);
	}

	@Override
	public List<Replies> listReplies(Integer reply_id) throws Exception {
		return dao.list(reply_id);
	}

	@Override
	public void modifyReplies(Replies replies) throws Exception {
		dao.update(replies);
	}

	@Override
	public void removeReplies(Integer article_id) throws Exception {
		dao.delete(article_id);
	}

	@Override
	public List<Replies> listRepliesPage(Integer reply_id, Criteria cri) throws Exception {
		return dao.listPage(reply_id, cri);
	}

	@Override
	public int count(Integer reply_id) throws Exception {
		return dao.count(reply_id);
	}

}
