package com.furnifit.like.service;

import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.furnifit.like.dao.LikeDao;
import com.furnifit.like.domain.Like;

@Service
public class LikeServiceImpl implements LikeService {
	
	private static final Logger logger = Logger.getLogger(LikeServiceImpl.class);
	
	@Inject
	private LikeDao dao;

	@Override
	public void create(Like like) {
		dao.create(like);

	}

	@Override
	public Like read(Map<String, Object> map) {
		return dao.read(map);
	}

	@Override
	public int likeCount(int articleId) {
		return dao.likeCount(articleId);
	}

}
