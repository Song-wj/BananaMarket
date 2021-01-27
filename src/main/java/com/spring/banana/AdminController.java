package com.spring.banana;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.banana.service.MemberService;

@Controller
public class AdminController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/memberManage.do", method = RequestMethod.GET)
	public ModelAndView memberManage() {
		return (ModelAndView)memberService.getMemberList();
	}
	
}
