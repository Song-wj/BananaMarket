package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.dongneDAO;
import com.spring.vo.dongneVO;

@Service("dongneService")
public class DongneServiceImpl implements BananaService{

	@Autowired
	private dongneDAO dongneDAO;
	
	public Object  insert(Object vo) {
		String result="";
		dongneVO dvo = (dongneVO)vo;
		boolean dao_result = dongneDAO.insertBoard(dvo);
		if(dao_result) {
			result= "redirect:/dongneLife.do";
		}else
			result ="errorPage";
		
		return result;
	}
	
	public Object  getList() {
		ModelAndView mv = new ModelAndView();
		ArrayList<dongneVO> list =dongneDAO.getBoardList();
		mv.addObject("list",list);
		mv.setViewName("/dongneLife/dongneLife");
		
		return mv;
	}
	
	public Object getContent(Object bid) {
		ModelAndView mv = new ModelAndView();
		dongneVO vo = dongneDAO.getBoardContent((String)bid);
		mv.addObject("vo", vo);
		mv.setViewName("/dongneLife/dongneLife_content");
		return mv;
	}
	public String  update() {
		return ".";
	}
	public String  delete() {
		return ".";
	}
}
