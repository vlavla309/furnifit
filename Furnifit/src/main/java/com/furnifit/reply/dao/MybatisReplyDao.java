package com.furnifit.reply.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.reply.domain.Reply;

/**
 * @author 김호준
 *
 * 댓글 Dao 인터페이스를 구현한 클래스
 */

/* Dao를 스프링에 인식, 데이터베이스 연동을 위해서 @Repository 사용
 * @Controller, @Repository, @Service 모두 스프링에 인식(등록)하기 위해서 사용한다.
 * 위와 같은 어노테이션이 설정된 클래스는 자동으로 객체가 생성된다.
 * 어노테이션을 사용하려면 스프링 설정 파일(root-context.xml)에서 [Namespaces] 탭 클릭 -> context 항목을 체크하면 된다.
 * 참고로 <bean> 태그를 이용해서 등록해야 자동으로 생성되는데 <context:component-scan /> 태그를 이용하면
 * 등록하지 않아도 된다.
*/
@Repository
public class MybatisReplyDao implements ReplyDao {

	@Inject                      // 해당 타입의 객체를 찾아서 변수에 자동으로 할당시킴
	private SqlSession session;  // XML Mapper 파일에 등록된 SQL을 실행하기 위한 다양한 기능을 제공하기 때문에 사용했음
	          
	private static String namespace = "com.furnifit.reply.dao.ReplyDao";

	/**
	 * replies 테이블에서 데이터를 가져오기 위해서 SqlSession의 selectList()를 사용했음
	 * 댓글 목록 출력을 위해서 Mapper 파일에 등록된 SQL문 실행
	 * @param Integer articleId
	 * @return List<Reply>
	 */
	@Override
	public List<Reply> list(Integer articleId) throws Exception {
		return session.selectList(namespace + ".list", articleId);
	}

	/**
	 * replies 테이블에 데이터를 등록하기 위해서 SqlSession의 insert()를 사용했음
	 * 댓글 등록을 위해서 Mapper 파일에 등록된 SQL문 실행
	 * @param Reply reply
	 */
	@Override
	public void create(Reply reply) throws Exception {
		session.insert(namespace + ".create", reply);
	}

	/**
	 * replies 테이블의 데이터를 수정하기 위해서 SqlSession의 update()를 사용했음
	 * 댓글 수정을 위해서 Mapper 파일에 등록된 SQL문 실행
	 * @param Reply reply
	 */
	@Override
	public void update(Reply reply) throws Exception {
		session.update(namespace + ".update", reply);
	}

	/**
	 * replies 테이블의 데이터를 삭제하기 위해서 SqlSession의 update()를 사용했음
	 * 댓글 삭제를 위해서 Mapper 파일에 등록된 SQL문 실행
	 * @param Integer reply_id
	 */
	@Override
	public void delete(Integer reply_id) throws Exception {
		session.update(namespace + ".delete", reply_id);
	}

	/**
	 * 무한 스크롤
	 * replies 테이블의 데이터를 가져오기 위해서 SqlSession의 selectList()를 사용했음
	 * 댓글 목록 출력을 위해서 Mapper 파일에 등록된 SQL문 실행
	 * @param Integer reply_id
	 */
	@Override
	public List<Reply> infiniteScrollDown(Reply reply) throws Exception {
		return session.selectList(namespace + ".infiniteScrollDown", reply);
	}	

}
