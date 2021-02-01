package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.BuylistDAO;
import com.banana.vo.BuylistVO;

@Service("buylistService")
public class BuylistServiceImpl implements BuylistService{
	
	@Autowired
	private BuylistDAO buylistDAO;
	
	public Object getList() {
		ModelAndView mv = new ModelAndView();
		  ArrayList<BuylistVO> list = buylistDAO.getBuylistList();
		  
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
