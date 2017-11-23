package com.furnifit.like.dao;

import java.util.Map;

import com.furnifit.like.domain.Like;

public interface LikeDao {
	
	
	/**
	 * 좋아요 등록
	 * @param like
	 */
	public void create(Like like);
	
	/**
	 * 게시글안에 해당 회원 좋아요 읽어오기
	 * @param map
	 * @return
	 */
	public Like read(Map<String, Object> map);
	
	/**
	 * 개시글에 대한 좋아요 개수
	 * @param articleId
	 * @return
	 */
	public int likeCount(int articleId);

}
