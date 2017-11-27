package com.furnifit.article.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.furnifit.article.domain.Criteria;
import com.furnifit.article.domain.PageMaker;
import com.furnifit.article.domain.Replies;
import com.furnifit.article.service.RepliesService;

@RestController
@RequestMapping("/reply")
public class RepliesController {
	
	private static final Logger logger = Logger.getLogger(RepliesController.class);
	
	@Inject
	private RepliesService service;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody Replies replies) {
		ResponseEntity<String> entity = null;
		
		try {
			service.addReplies(replies);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/all/{article_id}", method = RequestMethod.GET)
	public ResponseEntity<List<Replies>> list (@PathVariable("reply_id") Integer reply_id) {
		ResponseEntity<List<Replies>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.listReplies(reply_id), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value= "/{article_id}", method = {RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update (@PathVariable("article_id") Integer article_id, @RequestBody Replies replies) {
		ResponseEntity<String> entity = null;
		
		try {
			replies.setArticle_id(article_id);
			service.modifyReplies(replies);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String> (e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/{article_id}", method = RequestMethod.DELETE)
	  public ResponseEntity<String> remove(@PathVariable("article_id") Integer article_id) {

	    ResponseEntity<String> entity = null;
	    try {
	      service.removeReplies(article_id);
	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
	
	@RequestMapping(value = "/{reply_id}/{page}", method = RequestMethod.GET)
	  public ResponseEntity<Map<String, Object>> listPage(
	      @PathVariable("reply_id") Integer reply_id,
	      @PathVariable("page") Integer page) {

	    ResponseEntity<Map<String, Object>> entity = null;
	    
	    try {
	      Criteria cri = new Criteria();
	      cri.setPage(page);

	      PageMaker pageMaker = new PageMaker();
	      pageMaker.setCri(cri);

	      Map<String, Object> map = new HashMap<String, Object>();
	      List<Replies> list = service.listRepliesPage(reply_id, cri);

	      map.put("list", list);

	      int replyCount = service.count(reply_id);
	      pageMaker.setTotalCount(replyCount);

	      map.put("pageMaker", pageMaker);

	      entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
}
