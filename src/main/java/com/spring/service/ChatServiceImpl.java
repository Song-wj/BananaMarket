package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.ChatDAO;
import com.banana.vo.BananaNoticeVO;
import com.banana.vo.BananaShopReviewVO;
import com.banana.vo.ChatVO;
import com.banana.vo.dongneVO;
import com.banana.vo.productVO;

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
		}else {
			
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
	
	 public Object getContent(String pid, String cid, String mid) {
			ModelAndView mv = new ModelAndView();
			ChatVO vo = chatDAO.getContent((String)cid);
			
			mv.addObject("vo", vo);
			mv.addObject("pid",pid);
			mv.addObject("mid", mid);
			mv.setViewName("/chatBanner/chat_list_content");
			return mv;
		}
}
