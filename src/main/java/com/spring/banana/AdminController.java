package com.spring.banana;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.banana.service.MemberService;
import com.banana.vo.dongneSubjectVO;
import com.spring.service.DongneServiceImpl;

@Controller
public class AdminController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	DongneServiceImpl dongneService;
	
	@RequestMapping(value = "/dongne_subject_write_proc.do", method = RequestMethod.POST)
	public String dongne_subject_write_proc(dongneSubjectVO vo, HttpServletRequest request) {
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
		System.out.println(path1 + path2);
		
		vo.setSavepath(path1 + path2);
		
		return dongneService.writeSubject(vo);
	}
	
	@RequestMapping(value = "/boardSubjectManage.do", method = RequestMethod.GET)
	public ModelAndView boardSubjectManage() {
		/*
		 * ModelAndView mv = new ModelAndView();
		 * mv.setViewName("/admin/boardSubjectManage"); return mv;
		 */
		return dongneService.getSubjectListAdmin();
	}
	
	@RequestMapping(value = "/memberManage.do", method = RequestMethod.GET)
	public ModelAndView memberManage() {
		return (ModelAndView)memberService.getMemberList();
	}
	
}
