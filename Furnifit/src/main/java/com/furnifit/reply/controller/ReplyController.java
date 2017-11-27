package com.furnifit.reply.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.furnifit.reply.domain.Reply;
import com.furnifit.reply.service.ReplyService;

/**
 * @author 김호준
 *
 * 댓글 Controller
 */

/*
	REST 방식의 데이터 처리를 위해서 사용했음
	REST 방식의 의미는 특정한 uri를 통해서 데이터를 요청하는 것을 말한다.
	웹 사이트의 컨텐츠들을 각각 하나의 자원으로 간주하고 이 각 자원들에게 uri를 부여하는 것이다.
	그리고 해당 자원에 대한 CRUD 작업은 post, get, put, delete를 통해서 처리한다.
*/
@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	/* 로그 확인 */
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
		
	@Inject                        // 해당 타입의 객체를 찾아서 변수에 자동으로 할당시킴
	private ReplyService service;  // root-context.xml 파일에 <context:component-scan /> 태그가 설정되어 있어야 한다.
	
	/* 댓글 등록 요청에 대한 메소드 */
	@RequestMapping(value = "", method = {RequestMethod.GET, RequestMethod.POST})  
	public ResponseEntity<String> register(@RequestBody Reply reply) {
		ResponseEntity<String> entity = null;
	    try {
	      service.addReply(reply);
	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
	
	/* 댓글 목록 요청에 대한 메소드 */
	@RequestMapping(value = "/all/{articleId}", method = {RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<List<Reply>> list(@PathVariable("articleId") Integer articleId) {
		ResponseEntity<List<Reply>> entity = null;
	    try {
	      entity = new ResponseEntity<>(service.listReply(articleId), HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }

	    return entity;
	  }
	
	/* 댓글 수정 요청에 대한 메소드 */
	@RequestMapping(value = "/{reply_id}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("reply_id") Integer reply_id, @RequestBody Reply reply) {
		
		ResponseEntity<String> entity = null;
	    try {
	      reply.setReply_id(reply_id);
	      service.modifyReply(reply);

	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
	
	/* 댓글 삭제 요청에 대한 메소드 */
	@RequestMapping(value = "/{reply_id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("reply_id") Integer reply_id) {
		
		ResponseEntity<String> entity = null;
	    try {
	      service.removeReply(reply_id);
	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
	
	/* 무한 스크롤 요청에 대한 메소드 */
	@RequestMapping(value = "/infiniteScrollDown", method = RequestMethod.GET)
	public List<Reply> infiniteScrollDownPOST(Reply reply) throws Exception {
		
		logger.info("infiniteScrollDownPOST");
		int bnoToStart = reply.getReply_id() - 1;  // 출력된 댓글의 마지막 번호에서 1개를 뺀 값
		reply.setReply_id(bnoToStart);
		return service.infiniteScrollDown(reply);
	}

}
