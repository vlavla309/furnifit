package com.furnifit.reply.dao;

import java.util.List;

import com.furnifit.reply.domain.Reply;

/**
 * 댓글 Dao 인터페이스
 * 
 * @author 김호준
 * 
 * XML Mapper를 사용하는 경우 id가 Dao 인터페이스 메소드와 이름이 같아야 한다.
 */
public interface ReplyDao {

	/**
	 * 댓글 목록
	 * @param Integer articleId
	 * @return List<Reply>
	 */
	public List<Reply> list(Integer articleId) throws Exception;
	
	/**
	 * 댓글 등록
	 * @param Reply reply
	 */
	public void create(Reply reply) throws Exception;

	/**
	 * 댓글 수정
	 * @param Reply reply
	 */
	public void update(Reply reply) throws Exception;

	/**
	 * 댓글 삭제
	 * @param Integer reply_id
	 */
	public void delete(Integer reply_id) throws Exception;
	
	/**
	 * 무한 스크롤
	 * @param Reply reply
	 * @return List<Reply>
	 */
	public List<Reply> infiniteScrollDown(Reply reply) throws Exception;
	
}
