package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.ChatDAO;
import com.banana.vo.ChatContentVO;
import com.banana.vo.ChatVO;

@Service("chatService")
public class ChatServiceImpl {
	
	@Autowired
	private ChatDAO chatDAO;

	public Object insert(Object vo) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		
		ChatVO cvo = (ChatVO)vo;
		result = chatDAO.getInsert(cvo);
		
		if(result != 0) {
			mv.setViewName("redirect:/chat_list_content.do?cid="+cvo.getCid());
		}
		
		return mv;
	}

	public Object getList() {
		  ModelAndView mv = new ModelAndView();
		  ArrayList<ChatVO> list = chatDAO.getChatList();
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
	
}
