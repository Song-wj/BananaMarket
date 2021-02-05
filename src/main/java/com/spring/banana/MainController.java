package com.spring.banana;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.banana.vo.SessionVO;
import com.enroll.service.EnrollService;
import com.banana.vo.*;

@Controller
public class MainController {
	
	@Autowired
	private EnrollService dongneCommentService;
	
	@ResponseBody
	@RequestMapping(value="/alarm_count.do", method=RequestMethod.GET)
	public String alarm_count(String mid) {
		//SessionVO svo = (SessionVO)session.getAttribute("svo");
		return dongneCommentService.getAlarmCount(mid);
	}
	
	@RequestMapping(value="/getReviewAlarmContent.do", method=RequestMethod.GET)
	public String getReviewAlarmContent(HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		return dongneCommentService.getAlarmContent(svo.getMid());
	}
	
	@RequestMapping(value="/header.do", method=RequestMethod.GET)
	public String header() {
		return "header";
	}
	
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	
}
