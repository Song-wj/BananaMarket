package com.spring.banana;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DongneLifeController {
	
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

