package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.BananaShopDAO;
import com.banana.dao.dongneDAO;
import com.banana.dao.productDAO;
import com.banana.vo.BananaShopVO;
import com.banana.vo.dongneVO;
import com.banana.vo.productVO;

@Service("searchService")
public class SearchServiceImpl {
	
	@Autowired
	private productDAO productDAO;
	@Autowired
	private dongneDAO dongneDAO;
	@Autowired
	private BananaShopDAO bananashopDAO;
	
	 
	 public Object getList(String search) {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<productVO> list1 = productDAO.getsearchlist(search);
		ArrayList<dongneVO> list2 = dongneDAO.getsearchlist(search);
		ArrayList<BananaShopVO> list3 = bananashopDAO.getsearchlist(search);
		
		int product_count = productDAO.getsearchCount(search);
		int dongne_count = dongneDAO.getsearchCount(search);
		int shop_count = bananashopDAO.getsearchCount(search);
		int total_count = product_count + dongne_count + shop_count;
		
		mv.addObject("search", search);
		mv.addObject("list1", list1);
		mv.addObject("product_count", product_count);
		mv.addObject("list2", list2);
		mv.addObject("dongne_count", dongne_count);
		mv.addObject("list3", list3);
		mv.addObject("shop_count", shop_count);
		
		mv.addObject("total_count", total_count);
		
		mv.setViewName("/search");
		return mv;
	}
}
