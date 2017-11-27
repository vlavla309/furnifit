package com.furnifit.reply.dao;

import java.util.List;

import com.furnifit.reply.domain.Criteria;
import com.furnifit.reply.domain.Reply;

/**
 * @author 김호준
 *
 * 댓글 Dao 인터페이스
 * XML Mapper를 사용하는 경우 id가 Dao 인터페이스 메소드와 이름이 같아야 한다.
 */
public interface ReplyDao {

	/* 댓글 목록 */
	public List<Reply> list(Integer articleId) throws Exception;
	
	/* 댓글 등록 */
	public void create(Reply reply) throws Exception;

	/* 댓글 수정 */
	public void update(Reply reply) throws Exception;

	/* 댓글 삭제 */
	public void delete(Integer reply_id) throws Exception;
	
	/* 무한 스크롤 */
	public List<Reply> infiniteScrollDown(Reply reply) throws Exception;
	
}
