package com.spring.banana;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.banana.service.MemberService;
import com.banana.vo.BananaMemberVO;

@Controller
public class JoinController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/join.do",method=RequestMethod.GET)
	public String join() {
		return "/join/join";
	}
	
	@RequestMapping(value="/join_proc.do",method=RequestMethod.POST)
	public ModelAndView join_proc(BananaMemberVO vo) {
		return (ModelAndView)memberService.getResultJoin(vo);
	}
}
