package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.dongneDAO;
import com.banana.dao.productDAO;
import com.banana.vo.LikeVO;
import com.banana.vo.dongneVO;

@Service("likeService")
public class LikeServiceImpl implements LikeService{
	
	@Autowired
	private productDAO productDAO;
	
	@Autowired
	private dongneDAO dongneDAO;
	
	public Object getList(String mid) {
		ModelAndView mv = new ModelAndView();
		  ArrayList<LikeVO> list1 = productDAO.getLikelist("whtjdrnr010");
		  ArrayList<dongneVO> list2 = dongneDAO.getLikelist("whtjdrnr010");
		  System.out.println(list2);
			mv.addObject("list1", list1);
			mv.addObject("list2", list2);
			mv.setViewName("/mypage/mypage_like");
			return mv;
	}
	
	public Object insert(Object vo){return 0;}
	
	public Object getContent(Object id){return 0;}
	
	public Object update(Object vo){return 0;}
	
	public Object getUpdateContent(Object id){return 0;}
	
	public Object delete(Object id){return 0;}
}
