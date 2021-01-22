package com.spring.banana;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NeighborhoodController {

	@RequestMapping(value="/neighborhoodStore" , method=RequestMethod.GET)
	public String neighborhoodStore() {
		
		return "/myNeighborhood/neighborhoodStore";
	}
	
	@RequestMapping(value="/neighborhood" , method=RequestMethod.GET)
	public String neighborhood() {
		
		return "/myNeighborhood/neighborhood";
	}
	
	@RequestMapping(value="/footer.do", method=RequestMethod.GET)
	public String index() {
		return "footer";
	}
}
