package com.furnifit.article.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.furnifit.article.dao.ArticleDao;
import com.furnifit.article.domain.Article;
import com.furnifit.article.service.ArticleService;
import com.furnifit.common.web.ArticleParams;
import com.furnifit.common.web.PageBuilder;
import com.furnifit.furniture.domain.Furniture;
import com.furnifit.like.domain.Like;
import com.furnifit.like.service.LikeService;
import com.furnifit.member.domain.Member;
import com.furnifit.planitem.domain.PlanItem;
import com.furnifit.product.domain.Product;

/**
 *
 *
 * @author 박보라
 *
 */
@RequestMapping("/article")
@Controller
public class ArticleController {
	
	private final int PAGE_SIZE = 9;
	
	private final int PAGI_SIZE = 5;
	
	private static final Logger logger = Logger.getLogger(ArticleController.class);
	
	@Resource(name = "articleImgPath")
	private String uploadPath;
	
	@Inject
	ArticleService service;
	
	@Inject
	LikeService likeService;
	
	@Inject
	ArticleDao dao;
	
	
	@RequestMapping(value = "/register/{planitemId}", method = RequestMethod.GET)
	public String registGET(@PathVariable int planitemId,Furniture furniture, Product product,HttpServletRequest request,Model model) throws Exception {
	    PlanItem planitm = service.readPlanItem(planitemId);
		model.addAttribute("planItem", planitm);  
		
		
		List<Product> prdList = new ArrayList<Product>();
		List<Furniture> list = service.readFurniture(planitemId);
		
		for (Furniture f : list) {
			Product pro=service.readProduct(f.getProductId());
			
			prdList.add(pro);
		}
		model.addAttribute("product",prdList);	
		
		HttpSession session =  request.getSession();
		Member member = (Member)session.getAttribute("login");
		


		return "article/register";
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String registPOST(Article article) throws Exception {
		
		service.create(article);
		return "redirect:/article";
	}
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String listAll(ArticleParams params,Article article,Model model) throws Exception {
		
		params.setPageSize(PAGE_SIZE);
		params.setPagiSize(PAGI_SIZE);
		
		List<Article> articles = service.listByParams(params);
		
		model.addAttribute("list", articles);
		
		
		PageBuilder pb = new PageBuilder();
		pb.setParams(params);
		
		
		pb.setTotalRowCount(service.listSearchCount(params));

	
		
		pb.build();
		model.addAttribute("pb", pb);
		
		model.addAttribute("title", "Furnifit - Board" );
		
		 
		 return "article/list";
	}
	
	
	@RequestMapping(value="/{articleId}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("articleId")int articleId){
		
		
		ResponseEntity<String> entity = null;
		
		try {
			service.artDelete(articleId);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	
	@RequestMapping(value = "/{articleId}", method = RequestMethod.GET)
	public String read(@PathVariable int articleId,Furniture furniture,Product product,HttpServletRequest request, Model model) throws Exception {
		 Article article = service.read(articleId);
		 article.setViewcnt(article.getViewcnt()+1);
		 service.artUpdate(article);
		 
		 HttpSession session = request.getSession();
		 Member member = (Member)session.getAttribute("login");
		 
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("articleId", article.getArticleId());
		 map.put("email", member.getEmail());
		 Like likes = likeService.read(map);
		 
		 
		 PlanItem planItem = service.readPlanItem(article.getPlanitemId());
		 
		 List<Product> prdList = new ArrayList<Product>();
		 List<Furniture> list = service.readFurniture(article.getPlanitemId());
		 for (Furniture f : list) {
			prdList.add(service.readProduct(f.getProductId()));
		}
		
		 
		 model.addAttribute("product",prdList); 
		 model.addAttribute("planItem", planItem);
		 model.addAttribute("article", article);
		 model.addAttribute("likes", likes);
		 model.addAttribute("title", article.getTitle() );
		 
		 
		 return "article/detail";

	}
	
	@RequestMapping(value = "/update/{articleId}", method = RequestMethod.GET)
	public String updatePage(@PathVariable int articleId,Furniture furniture,Product product, Model model) throws Exception {
		 Article article = service.read(articleId);
		 
		 PlanItem planItem = service.readPlanItem(article.getPlanitemId());
		 
		 List<Product> prdList = new ArrayList<Product>();
		 List<Furniture> list = service.readFurniture(article.getPlanitemId());
		 for (Furniture f : list) {
			prdList.add(service.readProduct(f.getProductId()));
		}
		
		 
		 model.addAttribute("product",prdList); 
		 model.addAttribute("planItem", planItem);
		 model.addAttribute("article", article);
		 
		 return "article/modify";

	}
	
	@RequestMapping(value = "/{articleId}", method = {RequestMethod.PATCH, RequestMethod.PUT, RequestMethod.POST})
	@ResponseBody
	public String update(Article article,  String content) throws Exception {
			
		int articleId = article.getArticleId();
		dao.deleteAttach(articleId);
		
	    dao.artUpdate(article);

		 
		String[] files = article.getFiles();
		
		if(files == null) {return "success";}
		
		for (String fullName : files) {
			Map<String, Object> map = new HashMap<String, Object>();
			File f = new File(fullName);
			String fileName = f.getName();
			String filePath = f.getParent();
			logger.info("----filename : " + fileName + " --> filePath : " + filePath+" ----");
			map.put("name", fileName.replace("s_", ""));
			map.put("path", filePath);
			map.put("articleId", article.getArticleId());
			
			dao.replaceAttach(map);
		}
			
		
		 return "success";
	}

	
	
	

}
