package com.furnifit.article.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.furnifit.article.domain.Article;
import com.furnifit.article.service.ArticleService;
import com.furnifit.furniture.domain.Furniture;
import com.furnifit.member.domain.Member;
import com.furnifit.planitem.domain.PlanItem;
import com.furnifit.product.domain.Product;



@RequestMapping("/article")
@Controller
public class ArticleController {
	
	private static final Logger logger = Logger.getLogger(ArticleController.class);
	
	@Resource(name = "articleImgPath")
	private String uploadPath;
	
	@Inject
	ArticleService service;
	
	
	@RequestMapping(value = "/register/{planitemId}", method = RequestMethod.GET)
	public String registGET(@PathVariable int planitemId,Furniture furniture, Product product,Model model) {
	    PlanItem planitm = service.readPlanItem(planitemId);
		model.addAttribute("planItem", planitm);
		
		
		List<Product> prdList = new ArrayList<Product>();
		List<Furniture> list = service.readFurniture(planitemId);
		
		for (Furniture f : list) {
			Product pro=service.readProduct(f.getProductId());
			
			prdList.add(pro);
		}
		model.addAttribute("product",prdList);	
		logger.info(prdList);
		
	//	HttpSession session =  request.getSession();
		//Member member = (Member)session.getAttribute("login");
		


		return "article/register";
	}
	
	@RequestMapping(value = "/register/{planitemId}", method = RequestMethod.POST)
	public String registPOST(Article article) throws Exception {
		
		logger.info(article);
		service.create(article);
		return "redirect:/article";
	}
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String listAll(Model model) throws Exception {
		 model.addAttribute("list", service.listAll());
		 logger.info("전체리스트");
		 
		 return "article/list";
	}
	
	
	@RequestMapping(value = "/{articleId}", method = RequestMethod.DELETE)
	public String remove(@PathVariable int articleId) throws Exception {
		service.artDelete(articleId);
			 return "redirect:/article/list";
	}
	
	
	@RequestMapping(value = "/{articleId}", method = RequestMethod.GET)
	public String read(@PathVariable int articleId,Furniture furniture,Product product, Model model) throws Exception {
		 Article article = service.read(articleId);
		 //article.setViewcnt(article.getViewcnt()+1);
		// service.artUpdate(article);
		 
		 PlanItem planItem = service.readPlanItem(article.getPlanitemId());
		 
		 List<Product> prdList = new ArrayList<Product>();
		 List<Furniture> list = service.readFurniture(article.getPlanitemId());
		 for (Furniture f : list) {
			prdList.add(service.readProduct(f.getProductId()));
		}
		 
		 model.addAttribute("product",prdList); 
		 model.addAttribute("planItem", planItem);
		 model.addAttribute("article", article);
		 
		 return "article/detail";

	}

	
	
	

}
