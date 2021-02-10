package com.spring.banana;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.banana.vo.ChatVO;
import com.banana.vo.SessionVO;
import com.spring.service.ChatServiceImpl;

@Controller
public class ChatController {
	
	@Autowired
	private ChatServiceImpl chatService;
	
	/**
	 *  채팅 처리
	 */
	@RequestMapping(value="/chat_write_proc.do", method=RequestMethod.POST)
	public ModelAndView chat_write_proc(ChatVO cvo, String cid, HttpSession session) {
		cvo.setCid(cid);
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		cvo.setBuy_mid(svo.getMid());
		return (ModelAndView)chatService.insert(cvo);
	}
	
	/**
	 * 상품 - 채팅 하기
	 */
	@RequestMapping(value ="/chat_write.do", method = RequestMethod.GET)
	public ModelAndView chat_insert(String pid) {
		//SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		return (ModelAndView)chatService.Content(pid);
	}
	/**
	 * 채팅 리스트 - 상세 내용
	 * @return
	 */
	@RequestMapping(value ="/chat_list_content.do", method = RequestMethod.GET)
	public ModelAndView chat_list_content(String cid) {
		
		return (ModelAndView)chatService.getContent(cid);
	}
	
	
	/**
	 * 채팅 리스트
	 * @return
	 */
	@RequestMapping(value ="/chat_list.do", method = RequestMethod.GET)
	public ModelAndView chat_list() {
		
		return (ModelAndView)chatService.getList();
		//"/chatBanner/chat_list";
	}
	
	/**
	 * 채팅
	 * @return
	 */
	@RequestMapping(value ="/chat.do", method = RequestMethod.GET)
	public String chat() {
		return "/chatBanner/chat";
	}
	
}
