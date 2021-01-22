package com.spring.banana;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {
	
	/**
	 * 채팅 - 상세 내용
	 * @return
	 */
	@RequestMapping(value ="/chat_list_content.do", method = RequestMethod.GET)
	public String chat_list_content() {
		return "/chatBanner/chat_list_content";
	}
	
	/**
	 * 채팅 - 홈 화면
	 * @return
	 */
	@RequestMapping(value ="/chat_list.do", method = RequestMethod.GET)
	public String chat_list() {
		return "/chatBanner/chat_list";
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
