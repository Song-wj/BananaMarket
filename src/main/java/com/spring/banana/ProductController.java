package com.spring.banana;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.dao.productDAO;
import com.banana.vo.productVO;
import com.spring.service.ProductServiceImpl;

@Controller
public class ProductController {
	
	@Autowired
	private ProductServiceImpl productService;
	
	
	@RequestMapping(value="/productContent.do", method=RequestMethod.GET)
	public String productContent() {
		return "/popularProduct/productContent";
	}
	
	@RequestMapping(value="/popularProduct.do", method=RequestMethod.GET)
	public String popularProduct() {
		return "/popularProduct/popularProduct";
	}
	
	@RequestMapping(value="/writePage.do", method=RequestMethod.GET)
	public String writePage() {
		return "/popularProduct/writePage";
	}
	
	@RequestMapping(value="/writePage_proc.do", method=RequestMethod.POST)
	public String writePage_proc(productVO vo, HttpServletRequest request ) {
		//서버의 저장경로
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
		vo.setSavepath(path1+path2);
		
		return (String)productService.insert(vo);
	}
	
	@RequestMapping(value="/updatePage.do", method=RequestMethod.GET)
	public String updatePage() {
		return "/popularProduct/updatePage";
	}
	
	@RequestMapping(value="/deletePage.do", method=RequestMethod.GET)
	public String deletePage() {
		return "/popularProduct/deletePage";
	}
	
	@RequestMapping(value="/promoteDongne.do", method=RequestMethod.GET)
	public String promoteDonge() {
		return "/popularProduct/promoteDongne";
	}
}
