package com.furnifit.like.controller;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.furnifit.article.controller.ArticleController;
import com.furnifit.article.domain.Article;
import com.furnifit.article.service.ArticleService;
import com.furnifit.like.domain.Like;
import com.furnifit.like.service.LikeService;


@RequestMapping("/like")
@Controller
public class LikeController {
	
	private static final Logger logger = Logger.getLogger(ArticleController.class);
	
	@Inject
	private LikeService service;
	
	@Inject
	private ArticleService artService;
	
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	@ResponseBody
	public String create(@RequestBody Like like) throws Exception {
				
		service.create(like);
		
		return "success";
	}
			

}
