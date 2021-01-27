package com.spring.service;

import org.springframework.web.servlet.ModelAndView;

public interface BoardService {

	ModelAndView getList(String rpage, String param);
	Object insert(Object vo);
	ModelAndView getContent(String id, String param);
	ModelAndView getResultUpdate(Object vo);
	ModelAndView getResultDelete(String id);
	ModelAndView getUpdate(String id);
	
}
