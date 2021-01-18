package com.spring.banana;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class ProductController {

	@RequestMapping(value="/popularProduct.do", method=RequestMethod.GET)
	public String popularProdcut() {
		return "/popularProduct/popularProduct";
	}
	
	@RequestMapping(value="/writePage.do", method=RequestMethod.GET)
	public String writePage() {
		return "/popularProduct/writePage";
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
