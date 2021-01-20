package com.spring.banana;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DongneController {
	
	/**
	 * 동네생활 - 글정보 삭제화면
	 * @return
	 */
	@RequestMapping(value ="/dongneLife_delete.do", method = RequestMethod.GET)
	public String dongneLife_delete() {
	
		return "/dongneLife/dongneLife_delete";
	}
	
	/**
	 * 동네생활 - 글정보 수정화면
	 * @return
	 */
	@RequestMapping(value ="/dongneLife_update.do", method = RequestMethod.GET)
	public String dongneLife_update() {
	
		return "/dongneLife/dongneLife_update";
	}
	
	/**
	 * 동네생활 - 글정보 화면
	 * @return
	 */
	@RequestMapping(value ="/dongneLife_content.do", method = RequestMethod.GET)
	public String dongneLife_content() {
	
		return "/dongneLife/dongneLife_content";
	}
	
	/**
	 * 동네생활 - 글쓰기 화면
	 * @return
	 */
	@RequestMapping(value ="/dongneLife_write.do", method = RequestMethod.GET)
	public String dongnelife_write() {
	
		return "/dongneLife/dongneLife_write";
	}

	/**
	 * 동네생활 - 홈 화면
	 * @return
	 */
	@RequestMapping(value ="/dongneLife.do", method = RequestMethod.GET)
	public String dongnelife() {
	
		return "/dongneLife/dongneLife";
	}
	
}

