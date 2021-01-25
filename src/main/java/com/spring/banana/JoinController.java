package com.spring.banana;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.banana.service.MemberService;
import com.banana.vo.BananaMemberVO;

@Controller
public class JoinController {
	
	@Autowired
	MemberService memberService;
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/idCheck_proc.do", produces =
	 * "application/String; charset=utf-8") public String idCheck_proc(String id,
	 * HttpSession session) { return memberService.getResultIdCheck(id); }
	 */
	
	@RequestMapping(value="/jusoPopup.do",method= {RequestMethod.POST, RequestMethod.GET})
	public String jusoPopup() {
		return "/join/jusoPopup";
	}
	
	@RequestMapping(value="/join.do",method=RequestMethod.GET)
	public String join() {
		return "/join/join";
	}
	
	@RequestMapping(value="/join_proc.do",method=RequestMethod.POST)
	public ModelAndView join_proc(BananaMemberVO vo, HttpServletRequest request) {
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
		vo.setSavepath(path1 + path2);
		
		return (ModelAndView)memberService.getResultJoin(vo);
	}
}
