package com.spring.banana;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.BuylistService;
import com.spring.service.BuylistServiceImpl;

public class BuylistController {
	@Autowired
	private BuylistService buylistservice;
	@Autowired
	private BuylistServiceImpl BuylistServiceImpl;
	
	
	/*
	 * @RequestMapping(value="/mypage_purchased.do", method=RequestMethod.GET)
	 * public ModelAndView mypage_purchased() {
	 * System.out.println(buylistservice.getList()); return
	 * (ModelAndView)buylistservice.getList(); }
	 */
}
