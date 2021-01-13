package com.spring.banana;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NeighborhoodController {

	@RequestMapping(value="/neighborhood" , method=RequestMethod.GET)
	public String neighborgood() {
		
		return "/myNeighborhood/neighborhood";
	}
}
