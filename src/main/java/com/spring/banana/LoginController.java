package com.spring.banana;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.banana.service.MemberService;
import com.banana.vo.BananaMemberVO;
import com.banana.vo.SessionVO;

	
@Controller
public class LoginController {
	
	@Autowired
	MemberService memberService;
	
	
	@RequestMapping(value="/logout.do",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		String result = "";
		
		if(svo != null) {
			session.invalidate();
			result = "index";
		} else {
			result ="errorPage";
		}
		
		return result;
	}
	
	@RequestMapping(value="/login_proc.do", method=RequestMethod.POST)
	public ModelAndView login_proc(BananaMemberVO vo, HttpSession session) {
		return (ModelAndView)memberService.getResultLogin(vo, session);
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String login() {
		return "/login/login";
	}
}

