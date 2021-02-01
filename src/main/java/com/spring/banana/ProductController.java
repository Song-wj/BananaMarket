package com.spring.banana;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.banana.vo.productVO;
import com.spring.service.ProductService;
import com.spring.service.ProductServiceImpl;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductServiceImpl ProductServiceImpl;
	
	
	@RequestMapping(value="/productContent.do", method=RequestMethod.GET)
	public ModelAndView productContent(String pid) {
		return (ModelAndView)productService.getContent(pid);
	}
	
	@RequestMapping(value="/popularProduct.do", method=RequestMethod.GET)
	public ModelAndView popularProduct() {
		return (ModelAndView)productService.getList();
	}
	
	@RequestMapping(value="/writePage.do", method=RequestMethod.GET)
	public String writePage() {
		return "/popularProduct/writePage";
	}
	
	@RequestMapping(value="/writePage_proc.do", method=RequestMethod.POST)
	public String writePage_proc(productVO vo, MultipartHttpServletRequest mtfRequest, HttpServletRequest request ) {
		//서버의 저장경로
		 List<MultipartFile> fileList = mtfRequest.getFiles("file1");
		 String path1 = request.getSession().getServletContext().getRealPath("/");
		 String path2 = "\\resources\\upload\\";
		
		 vo.setSavepath(path1+path2);
		 vo.setList(fileList);
		 
		return (String)productService.insert(vo);
	}
	
	@RequestMapping(value="/promoteDongne.do", method=RequestMethod.GET)
	public String promoteDonge() {
		return "/popularProduct/promoteDongne";
	}
	
	@ResponseBody
	@RequestMapping(value="/product_like.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public ModelAndView product_like(String mid, String pid) {
		return ProductServiceImpl.product_like(mid, pid);
	}
	
	@ResponseBody
	@RequestMapping(value="/product_unlike.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public ModelAndView product_unlike(String mid, String pid) {
		return ProductServiceImpl.product_unlike(mid, pid);
	}
	
	
}
