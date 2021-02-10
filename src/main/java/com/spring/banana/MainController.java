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
	@RequestMapping(value="/keyword_alarm_count.do", method=RequestMethod.GET)
	public String keyword_alarm_count(HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		return dongneCommentService.getKeywordAlarmCount(svo.getMid());
	}
	
	@ResponseBody
	@RequestMapping(value="/key_alarm_write.do", method=RequestMethod.GET)
	public String key_alarm_write(HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		return dongneCommentService.key_alarm_write(svo.getMid());
	}
	
	@ResponseBody
	@RequestMapping(value="/ka_delete.do", method=RequestMethod.GET)
	public String ka_delete(String pid) {
		return dongneCommentService.deleteKeywordAlarm(pid);
	}
	
	@ResponseBody
	@RequestMapping(value="/sa_delete.do", method=RequestMethod.GET)
	public String sa_delete(String srid) {
		return dongneCommentService.deleteShopAlarm(srid);
	}
	
	@ResponseBody
	@RequestMapping(value="/ra_delete.do", method=RequestMethod.GET)
	public String ra_delete(String brid) {
		return dongneCommentService.deleteReviewAlarm(brid);
	}
	
	@ResponseBody
	@RequestMapping(value="/shop_alarm_count.do", method=RequestMethod.GET)
	public String shop_alarm_count(HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		return dongneCommentService.getShopAlarmCount(svo.getMid());
	}
	
	@ResponseBody
	@RequestMapping(value="/alarm_count.do", method=RequestMethod.GET)
	public String alarm_count(HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		return dongneCommentService.getAlarmCount(svo.getMid());
	}
	
	@ResponseBody
	@RequestMapping(value="/getKeywordAlarmContent.do", method=RequestMethod.GET
	, produces="text/plain;charset=UTF-8")
	public String getKeywordAlarmContent(HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		return dongneCommentService.getKeywordAlarmContent(svo.getMid());
	}
	
	@ResponseBody
	@RequestMapping(value="/getShopAlarmContent.do", method=RequestMethod.GET
	, produces="text/plain;charset=UTF-8")
	public String getShopAlarmContent(HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		return dongneCommentService.getShopAlarmContent(svo.getMid());
	}
	
	@ResponseBody
	@RequestMapping(value="/getReviewAlarmContent.do", method=RequestMethod.GET
	, produces="text/plain;charset=UTF-8")
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
	
	@RequestMapping(value="/search.do",method=RequestMethod.GET)
	public ModelAndView search(String search) {
		return (ModelAndView)searchService.getList(search);
	}
	
}
