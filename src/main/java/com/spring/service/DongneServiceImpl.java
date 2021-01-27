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
		
		UUID uuid = UUID.randomUUID();
		if(dvo.getList().get(0).getSize() != 0)  {
			 	
		       for (MultipartFile mf : dvo.getList()) {    	   
		           
		           
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
					File file = new File(dvo.getSavepath()+ uuid+ "_"+ mf.getOriginalFilename());
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
		if(vo.getBsfile() != null) {
			String[] sfile_list =vo.getBsfile().split(",");
	
			mv.addObject("sfile_list", sfile_list);
		}
		
		
		mv.addObject("vo", vo);
		mv.setViewName("/dongneLife/dongneLife_content");
		return mv;
	}
	
	public Object getUpdateContent(Object bid) {
		ModelAndView mv = new ModelAndView();
		dongneVO vo = dongneDAO.getBoardContent((String)bid);
		int count =0;
		if(vo.getBfile() != null) {
			String[] sfile_list =vo.getBsfile().split(",");
			for(int i=0; i<sfile_list.length; i++) {
				count++;
			}
		}
		mv.addObject("count", count);	
		mv.addObject("vo", vo);
		mv.setViewName("/dongneLife/dongneLife_update");
		return mv;
	}
	
	
	public Object  update(Object vo) {
		
		
		ModelAndView mv = new ModelAndView();
		boolean result = false;
		ArrayList<String> file_list = new ArrayList<String>();
		ArrayList<String> sfile_list = new ArrayList<String>();
		dongneVO dvo = (dongneVO)vo;
		
		UUID uuid = UUID.randomUUID();
		
		if(dvo.getList().get(0).getSize() != 0) {
		
		       for (MultipartFile mf : dvo.getList()) {    	   
		    	   
		    		 file_list.add(mf.getOriginalFilename());
		    		 sfile_list.add(uuid+ "_"+ mf.getOriginalFilename());
		    	  
	          }
		      
		       dvo.setBfile(String.join(",", file_list));
		       dvo.setBsfile(String.join(",", sfile_list));
		       
		       result = dongneDAO.boardU((dongneVO)vo);
		       
		       if(result) {
		       try {
					 for (MultipartFile mf : dvo.getList()) { 									    		   
							 File file = new File(dvo.getSavepath()+ uuid+ "_"+ mf.getOriginalFilename());
							 mf.transferTo(file);		    	   				
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
		       }		       
		}else if(dvo.getCancel_img().equals("cancel")) {
			 dvo.setBfile(null);
		     dvo.setBsfile(null);
		     result = dongneDAO.boardU((dongneVO)vo);
		}else {
			result = dongneDAO.boardUpdateNofile((dongneVO)vo);
		
		}
			
		
		
		if(result) {			
			mv.setViewName("redirect:/dongneLife.do");
		}
		
		return mv;
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
