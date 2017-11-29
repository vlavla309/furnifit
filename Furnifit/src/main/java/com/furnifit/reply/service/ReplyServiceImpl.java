package com.furnifit.reply.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.reply.dao.ReplyDao;
import com.furnifit.reply.domain.Reply;

/**
 * @author 김호준
 *
 * 댓글 Service 인터페이스 구현 클래스
 */

	@Service  // Service 인터페이스 구현 클래스를 스프링에 인식, 비즈니스 로직 처리를 위해서 @Service 클래스 사용
	public class ReplyServiceImpl implements ReplyService {

	@Inject                // 해당 타입의 객체를 찾아서 변수에 자동으로 할당시킴
	private ReplyDao dao;  // root-context.xml 파일에 <context:component-scan /> 태그가 설정되어 있어야 한다.
	
	/**
	 * 댓글 등록을 위해서 Service단에서 최종단인 dao를 호출
	 * @param Reply reply
	 */
	@Override
	public void addReply(Reply reply) throws Exception {
		dao.create(reply);
	}
	
	/**
	 * 댓글 목록 출력을 Service단에서 최종단인 dao를 호출
	 * @param Integer articleId
	 * @return List<Reply>
	 */
	@Override
	public List<Reply> listReply(Integer articleId) throws Exception {
		return dao.list(articleId);
	}
	
	/**
	 * 댓글 수정을 위해서 Service단에서 최종단인 dao를 호출
	 * @param Reply reply
	 */
	@Override
	public void modifyReply(Reply reply) throws Exception {
		dao.update(reply);
	}
	
	/**
	 * 댓글 삭제를 위해서 Service단에서 최종단인 dao를 호출
	 * @param Integer reply_id
	 */
	@Override
	public void removeReply(Integer reply_id) throws Exception {
		dao.delete(reply_id);
	}

	/**
	 * 무한 스크롤
	 * 댓글 삭제를 위해서 Service단에서 최종단인 dao를 호출
	 * @param Reply reply
	 * @return List<Reply>	 
	 */
	@Override
	public List<Reply> infiniteScrollDown(Reply reply) throws Exception {
		return dao.infiniteScrollDown(reply);
	}
	
}
