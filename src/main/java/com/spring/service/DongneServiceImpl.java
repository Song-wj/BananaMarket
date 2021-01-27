package com.spring.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.dongneDAO;
import com.banana.vo.dongneVO;



@Service("dongneService")
public class DongneServiceImpl implements BananaService{

	@Autowired
	private dongneDAO dongneDAO;
	
	public Object  insert(Object vo) {
		String result="";
		dongneVO dvo = (dongneVO)vo;
		ArrayList<String> file_list = new ArrayList<String>();
		ArrayList<String> sfile_list = new ArrayList<String>();
		
		if(dvo.getList().size() != 0) {
			 	UUID uuid = UUID.randomUUID();
			 	
		       for (MultipartFile mf : dvo.getList()) {    	   
		           System.out.println(mf.getOriginalFilename()); 
		           
		           file_list.add(mf.getOriginalFilename());
		           sfile_list.add(uuid+ "_"+ mf.getOriginalFilename());
		           
		        
		          
		       }
		      
		       dvo.setBfile(String.join(",", file_list));
		       dvo.setBsfile(String.join(",", sfile_list));
		}
		
		
		boolean dao_result = dongneDAO.insertBoard(dvo);
		if(dao_result) {
			try {
				 for (MultipartFile mf : dvo.getList()) { 
					File file = new File(dvo.getSavepath()+mf);
					mf.transferTo(file);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
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
	
	public Object getUpdateContent(Object bid) {
		ModelAndView mv = new ModelAndView();
		dongneVO vo = dongneDAO.getBoardContent((String)bid);
		
		mv.addObject("vo", vo);
		mv.setViewName("/dongneLife/dongneLife_update");
		return mv;
	}
	
	
	public Object  update(Object vo) {
		ModelAndView mv = new ModelAndView();
		boolean result = dongneDAO.boardUpdate((dongneVO)vo);
		
		if(result) {
			mv.setViewName("redirect:/dongneLife.do");
		}
		return ".";
	}
	public Object delete(Object bid) {
		boolean result = dongneDAO.boardDelete((String)bid);
		String str="";
		if(result) {
			str="redirect:/dongneLife.do";
		}
		return str;
	}
}
