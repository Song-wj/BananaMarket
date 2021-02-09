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
import com.spring.service.SearchServiceImpl;
import com.banana.vo.*;

@Controller
public class MainController {
	
	@Autowired
	private EnrollService dongneCommentService;
	
	@Autowired
	private SearchServiceImpl searchService;
	
	@ResponseBody
	@RequestMapping(value="/shop_alarm_count.do", method=RequestMethod.GET)
	public String shop_alarm_count(String mid) {
		//SessionVO svo = (SessionVO)session.getAttribute("svo");
		return dongneCommentService.getShopAlarmCount(mid);
	}
	
	@ResponseBody
	@RequestMapping(value="/sa_delete.do", method=RequestMethod.GET)
	public String sa_delete(String srid) {
		//SessionVO svo = (SessionVO)session.getAttribute("svo");
		return dongneCommentService.deleteShopAlarm(srid);
	}
	
	@ResponseBody
	@RequestMapping(value="/ra_delete.do", method=RequestMethod.GET)
	public String ra_delete(String brid) {
		//SessionVO svo = (SessionVO)session.getAttribute("svo");
		return dongneCommentService.deleteReviewAlarm(brid);
	}
	
	@ResponseBody
	@RequestMapping(value="/alarm_count.do", method=RequestMethod.GET)
	public String alarm_count(String mid) {
		//SessionVO svo = (SessionVO)session.getAttribute("svo");
		return dongneCommentService.getAlarmCount(mid);
	}
	
	@ResponseBody
	@RequestMapping(value="/getShopAlarmContent.do", method=RequestMethod.GET
	, produces="text/plain;charset=UTF-8")
	public String getShopAlarmContent(String mid) {
		return dongneCommentService.getShopAlarmContent(mid);
	}
	
	@ResponseBody
	@RequestMapping(value="/getReviewAlarmContent.do", method=RequestMethod.GET
	, produces="text/plain;charset=UTF-8")
	public String getReviewAlarmContent(String mid) {
		return dongneCommentService.getAlarmContent(mid);
	}
	
	@RequestMapping(value="/header.do", method=RequestMethod.GET)
	public String header() {
		return "header";
	}
	
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="/search.do",method=RequestMethod.GET)
	public ModelAndView search(String search) {
		return (ModelAndView)searchService.getList(search);
	}
	
}
