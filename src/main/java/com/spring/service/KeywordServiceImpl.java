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

@Service("keywordService")
public class KeywordServiceImpl {
	
	@Autowired
	private productDAO productDAO;
	@Autowired
	private dongneDAO dongneDAO;
	@Autowired
	private BananaShopDAO bananashopDAO;
	
	 public String product_unlike(String mid, String keyword) {
		 boolean result = productDAO.getKeyword(mid,keyword);
			return String.valueOf(result);
	 }
	 
	 public Object getList(String mid,String keyword) {
			ModelAndView mv = new ModelAndView();
			  ArrayList<productVO> list1 = productDAO.getkeywordlist(mid,keyword);
			  /*ArrayList<dongneVO> list2 = dongneDAO.getLikelist(mid);
			  ArrayList<BananaShopVO> list3 = bananashopDAO.getLikelist(mid);*/
				mv.addObject("list1", list1);
				/*mv.addObject("list2", list2);
				mv.addObject("list3", list3);*/
				mv.setViewName("/mypage/mypage_keyword");
				return mv;
		}
}
