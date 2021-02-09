package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.BananaShopDAO;
import com.banana.dao.dongneDAO;
import com.banana.dao.productDAO;
import com.banana.vo.KeywordVO;
import com.banana.vo.productVO;

@Service("keywordService")
public class KeywordServiceImpl {
	
	@Autowired
	private productDAO productDAO;
	@Autowired
	private dongneDAO dongneDAO;
	@Autowired
	private BananaShopDAO bananashopDAO;
	
	 public String insertKeyword(String mid, String keyword) {
		 boolean result = productDAO.getKeyword(mid,keyword);
			return String.valueOf(result);
	 }
	 
	 public Object getList(String mid,String keyword) {
			ModelAndView mv = new ModelAndView();
			System.out.println(mid+","+keyword);
			  ArrayList<productVO> list1 = productDAO.getkeywordlist(mid);
			  ArrayList<KeywordVO> list2 = productDAO.getkeyword(mid);
			  ArrayList<productVO> list3 = productDAO.getkeywordclick(keyword);
			  
				mv.addObject("list3", list3);
			  

				mv.addObject("list1", list1);
				mv.addObject("list2", list2);
				mv.setViewName("/mypage/mypage_keyword");
				return mv;
		}
	 
	 public String delkeyword(String mid, String keyword) {
		 //ModelAndView mv = new ModelAndView();
		 boolean result = productDAO.delkeyword(mid, keyword);
			return String.valueOf(result);
	 }
	 
	 
	 public Object keywordclick(String mid,String keyword) {
		 ModelAndView mv = new ModelAndView();
			System.out.println(mid+","+keyword);
			  ArrayList<productVO> list1 = productDAO.getkeywordlist(mid);
			  ArrayList<KeywordVO> list2 = productDAO.getkeyword(mid);
			  ArrayList<productVO> list3 = productDAO.getkeywordclick(keyword);
			  
				mv.addObject("list3", list3);
			  

				mv.addObject("list1", list1);
				mv.addObject("list2", list2);
				mv.setViewName("/mypage/mypage_keyword");
				return mv;
	 }
	 
}
