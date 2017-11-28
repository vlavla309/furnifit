package com.furnifit.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.furnifit.article.dao.ArticleDao;
import com.furnifit.article.domain.Article;
import com.furnifit.article.service.ArticleService;
import com.furnifit.brand.dao.BrandDao;
import com.furnifit.brand.doamin.Brand;
import com.furnifit.category.dao.CategoryDao;
import com.furnifit.category.doamin.Category;
import com.furnifit.color.dao.ColorDao;
import com.furnifit.color.domain.Color;
import com.furnifit.common.web.ProductParams;
import com.furnifit.member.domain.Member;
import com.furnifit.product.domain.Product;
import com.furnifit.product.service.ProductService;
import com.furnifit.productimg.dao.ProductImageDao;
import com.furnifit.wishlist.domain.Wishlist;
import com.furnifit.wishlist.service.WishlistService;


/**
 * @author 한수진
 *
 */
@Controller
@RequestMapping("/product")
public class ProductController {
	
	Logger logger = Logger.getLogger(ProductController.class);
	
	@Resource(name = "productImgPath")
	private String uploadPath;
	
	@Inject
	ProductService productsrv;
	
	@Inject
	private ProductImageDao imgdao;
	
	@Inject
	private WishlistService wishsrv;
	
	@Inject
	private ColorDao colordao;
	
	@Inject
	private BrandDao branddao;
	
	@Inject
	private CategoryDao categorys;
	
	@Inject
	private ArticleService artsrv;
	
	@RequestMapping(value="", method= RequestMethod.GET)
	public String list(Model model) {
		List<Product> list = productsrv.list();
		List<Wishlist> wishlist = wishsrv.read();
		List<Color> colorlist = colordao.list();
		List<Brand> brandlist = branddao.list();
		List<Category> categorylist = categorys.list();
		model.addAttribute("title", "Furnifit - productList");
		model.addAttribute("list",list);
		model.addAttribute("wishlist",wishlist);
		model.addAttribute("totalsize", list.size());
		model.addAttribute("colorlist", colorlist);
		model.addAttribute("brandlist", brandlist);
		model.addAttribute("categorylist", categorylist);
		return "product/list";
	}
	
	@RequestMapping(value="", method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(Model model, ProductParams params, HttpSession session) {
		
		model.addAttribute("title", "Furnifit - Product");
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info(params);
		
		List<Product> list = productsrv.searchlist(params);
		List<Color> colorlist = colordao.list();
		List<Brand> brandlist = branddao.list();
		List<Category> categorylist = categorys.list();
		
		List<Product> wishlist=null;
		Member member = (Member) session.getAttribute("login");
		if(member !=null) {
			wishlist = productsrv.productwish(member.getEmail(), 1, wishsrv.listcount(member.getEmail()));
		}
		map.put("wishlist", wishlist);
		map.put("brandlist", brandlist);
		map.put("colorlist", colorlist);
		map.put("categorylist", categorylist);
		map.put("list", list);
		
		
		return map;
	}
	
	
	@RequestMapping(value="/{productid}", method= RequestMethod.GET)
	public String read(Model model, @PathVariable("productid") int productid) {
		Product product = productsrv.read(productid);
		logger.info("Product : "+product);
		
		List<Product> categorylist = productsrv.productReadList(product.getCategory());
		for (Product product2 : categorylist) {
			logger.info(product2);
		}
		
		List<Article> artlist = artsrv.productRead(productid);
		
		for (Article article : artlist) {
			logger.info(article);
		}
		
		model.addAttribute("product", product);
		model.addAttribute("title", "Furnifit - "+product.getName());
		model.addAttribute("categorylist", categorylist);
		model.addAttribute("artlist", artlist);
		
		return "product/read";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void form() {}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String regist(Product product) {
		productsrv.create(product);
		logger.info("[ ProductController --> regist ] : "+ product);
		return "redirect:/product/register";
	}
	
}
