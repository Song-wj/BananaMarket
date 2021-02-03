package com.spring.service;

public interface BananaService {

	Object getList();
	Object insert(Object vo);
	Object getContent(Object id,String mid);
	Object update(Object vo);
	Object getUpdateContent(Object id);
	Object delete(Object id);
	
}
