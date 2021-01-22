package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public String  getList() {
		return ".";
	}
	public String  update() {
		return ".";
	}
	public String  delete() {
		return ".";
	}
}
