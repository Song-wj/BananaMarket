package com.spring.banana;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.enroll.service.EnrollService;

@Controller
public class NeighborhoodController {
	
	@Autowired
	private EnrollService shopService;
	
	/**
	 * 내 근처 - 업체정보 화면
	 * @return
	 */
	@RequestMapping(value="/neighborhoodStore.do" , method=RequestMethod.GET)
	public ModelAndView neighborhoodStore(String sid) {
		return (ModelAndView)shopService.getContent(sid);
	}
	
	@RequestMapping(value="/neighborhood.do" , method=RequestMethod.GET)
	public ModelAndView neighborhood() {
		return (ModelAndView)shopService.getList();
	}
	
	@RequestMapping(value="/footer.do", method=RequestMethod.GET)
	public String index() {
		return "footer";
	}
}
