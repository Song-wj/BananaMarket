package com.spring.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface ProductService {
	
	Object getList();
	Object insert(Object vo);
	Object getContent(Object id,String mid);
	Object update(Object vo);
	Object getUpdateContent(Object id);
	Object delete(Object id);
	
	Object getSellList(String pid);
	//Object getSellList(Object id);
	Object sellUpdate(Object id);
	String getPid(String ptitle);
	/* Object getSellList1(String mid); */
}
