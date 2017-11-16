package com.furnifit.product.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.furnifit.product.domain.Product;
import com.furnifit.product.service.ProductService;
import com.furnifit.productimg.dao.ProductImageDao;
import com.furnifit.productimg.domain.ProductImg;


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
	
	@RequestMapping(value="", method= RequestMethod.GET)
	public String list(Model model) {
		List<Product> list = productsrv.list();
		/*
		for (Product product : list) {
			logger.info(product);
		}
		
		List<ProductImg> imglist = imgdao.list();
		for (ProductImg productImg : imglist) {
			logger.info(productImg);
		}
		
		model.addAttribute("list",list);
		model.addAttribute("uploadPath", uploadPath);
		model.addAttribute("imglist", imglist);
		*/
		
		model.addAttribute("list",list);
		return "product/list";
	}
	
	@RequestMapping(value="/{productid}", method= RequestMethod.GET)
	public String read(Model model, @PathVariable("productid") int productid) {
		/*
		Product product = productsrv.read(productid);
		logger.info("[read] : "+product);
		List<ProductImg> imglist = imgdao.productImg(productid);
		for (ProductImg productImg : imglist) {
			logger.info(productImg);
		}
		model.addAttribute("product", product);
		model.addAttribute("imglist", imglist);
		*/
		Product product = productsrv.read(productid);
		logger.info("[read] : "+product);
		model.addAttribute("product", product);
		return "product/read";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void form() {}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String regist(Product product) {
		logger.info("-------------------------------------------regist 시작");
		productsrv.create(product);
		logger.info("[ ProductController --> regist ] : "+ product);
		return "redirect:/product/register";
	}
	
}
