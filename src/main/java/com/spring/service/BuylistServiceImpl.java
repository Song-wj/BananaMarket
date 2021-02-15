package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.BuylistDAO;
import com.banana.vo.BuylistVO;
import com.banana.vo.LikeVO;
import com.banana.vo.dongneVO;
import com.banana.vo.productVO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Service("buylistService")
public class BuylistServiceImpl implements BuylistService{
	
	@Autowired
	private BuylistDAO buylistDAO;
	
	public Object getList(String mid) {
		
		 ModelAndView mv = new ModelAndView(); 
		 ArrayList<productVO> list = buylistDAO.getBuylistList(mid);

		 mv.addObject("list", list); 
		 mv.setViewName("/mypage/mypage_purchased");
		 
		 return mv;
	}
	
	public Object insert(Object vo){return 0;}
	
	public Object getContent(Object id){return 0;}
	
	public Object update(Object vo){return 0;}
	
	public Object getUpdateContent(Object id){return 0;}
	
	public Object delete(Object id){return 0;}

}
