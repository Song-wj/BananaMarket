package com.spring.banana;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class dongneLifeController {

	
	@RequestMapping(value ="/dongneLife.do", method = RequestMethod.GET)
	public String dongnelife() {
	
		return "/dongneLife/dongneLife";
	}
}

