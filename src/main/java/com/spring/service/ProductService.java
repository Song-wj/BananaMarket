package com.spring.service;

import javax.servlet.http.HttpSession;

public interface ProductService {
	
	Object getList();
	Object insert(Object vo);
	Object getContent(Object id,String mid);
	Object update(Object vo);
	Object getUpdateContent(Object id);
	Object delete(Object id);
	
	Object getSellList();
	Object sellUpdate(Object id);
	String getPid(String ptitle);
}
