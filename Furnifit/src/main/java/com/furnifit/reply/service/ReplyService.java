package com.furnifit.reply.service;

import java.util.List;

import com.furnifit.reply.domain.Reply;

/**
 * @author 김호준
 *
 * 댓글 Service 인터페이스
 * 
 * Controller가 직접 Dao 객체의 메소드를 호출하도록 하지 않기 위해서 Service 인터페이스를 만들었음
 * 유지보수 과정에서 Dao 클래스를 다른 클래스로 쉽게 교체하기 위해서이다.
 * 예를 들어 ReplyDao를 TwiceDao로 변경하면 ReplyController의 모든 메소드를 수정해야 한다.
 * 그리고 ReplyDao 클래스를 사용하는 Controller가 여러 개라면 모든 Controller의 매개변수를 다 수정해야 한다.
 * Controller가 Service 인터페이스를 이용하면 도메인 클래스, Dao 클래스 등이 코드를 수정하거나 다른 클래스로 대체해도
 * Service 인터페이스를 이용하기 때문에 Controller는 아주 조금만 수정하면 된다.
 */

public interface ReplyService {
	
	/**
	 * 댓글 등록
	 * @param Reply reply
	 */
	public void addReply(Reply reply) throws Exception;
	
	/**
	 * 댓글 등록
	 * @param Reply reply
	 */
	public List<Reply> listReply(Integer articleId) throws Exception;

	/**
	 * 댓글 수정
	 * @param Reply reply
	 */
	public void modifyReply(Reply reply) throws Exception;

	/**
	 * 댓글 삭제
	 * @param Integer reply_id
	 */
	public void removeReply(Integer reply_id) throws Exception;
	
	/**
	 * 무한 스크롤
	 * @param Reply reply
	 * @return List<Reply>
	 */
	public List<Reply> infiniteScrollDown(Reply reply) throws Exception;
	
}
