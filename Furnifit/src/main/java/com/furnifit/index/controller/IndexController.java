package com.furnifit.index.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.format.support.FormatterPropertyEditorAdapter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.furnifit.article.domain.Article;
import com.furnifit.article.service.ArticleService;
import com.furnifit.common.web.ArticleParams;
import com.furnifit.common.web.ProductParams;
import com.furnifit.product.domain.Product;
import com.furnifit.product.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	
	private static final Logger logger = Logger.getLogger(IndexController.class);
	
	@Inject
	ArticleService artService;
	
	@Inject
	ProductService prdService;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Locale locale, Model model,ArticleParams params, ProductParams Pparams) {
		
		params.setSort("like");
		params.setPageSize(3);
		List<Article> article = artService.listByParams(params);
		
		for (Article article2 : article) {
			String content = article2.getContent();
			if(content.length() > 30) {				
				article2.setContent(content.substring(0, 30));
			}
		}
		
		Pparams.setSort("new");
		Pparams.setPageSize(8);
		Pparams.setCategory("전체");
		List<Product> product = prdService.searchlist(Pparams);
		
		
	
		
		logger.info("Welcome home! The client locale is {}.");
		
		model.addAttribute("artList", article);
		model.addAttribute("prdList", product);
		
		
		return "index";
	}
	
	
}


		
		

	
