package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.ChatDAO;
import com.banana.dao.productDAO;
import com.banana.vo.ChatContentVO;
import com.banana.vo.ChatVO;
import com.banana.vo.productVO;

@Service("chatService")
public class ChatServiceImpl {
	
	@Autowired
	private ChatDAO chatDAO;
	
	@Autowired
	private productDAO productDAO;

	public Object insert(Object vo) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		
		ChatVO cvo = (ChatVO)vo;
		result = chatDAO.getInsert(cvo);
		
		if(result != 0) {
			mv.setViewName("redirect:chat_write.do?pid="+ cvo.getPid()+"&mid="+cvo.getSell_mid());
		}
		
		return mv;
	}
	
/*	
	public Object getList(String pid, String mid) {
		  ModelAndView mv = new ModelAndView();
		  ArrayList<ChatVO> list = chatDAO.getChatList(pid, mid);
		  
			mv.addObject("list", list);
			mv.setViewName("/chatBanner/chat_list");
			return mv;
	}
*/
	public Object getList() {
		  ModelAndView mv = new ModelAndView();
		  ArrayList<productVO> list = productDAO.getProductList();
		  	
		  	mv.addObject("list", list);
			mv.setViewName("/chatBanner/chat_list");
			return mv;
	}

	
	public Object getContent(String cid) {
	
			ModelAndView mv = new ModelAndView();
			ChatContentVO vo = chatDAO.getContent(cid);
			mv.addObject("vo", vo);
			mv.setViewName("/chatBanner/chat_list_content");
			return mv;
	}
	
	public Object getContent3(String pid) {
		ModelAndView mv = new ModelAndView();
		ArrayList<ChatContentVO> list = chatDAO.getContent3(pid);
		mv.addObject("list", list);
		mv.setViewName("/chatBanner/chat_list_content");
		return mv;
	}
	
	public Object Content(String pid) {
		ModelAndView mv = new ModelAndView();
		productVO vo = chatDAO.getContent2(pid);
		ArrayList<ChatContentVO> list = chatDAO.chat(pid);
		mv.addObject("vo", vo);
		mv.addObject("list", list);
		//mv.addObject("pid",pid);
		//mv.addObject("mid", mid);
		mv.setViewName("/chatBanner/chat_write");
		return mv;
	}
	
}
