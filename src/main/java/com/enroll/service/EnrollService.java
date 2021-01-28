package com.enroll.service;

public interface EnrollService {

	Object getList();
	Object insert(Object vo);
	Object getContent(Object id);
	Object update(Object vo);
	Object getUpdateContent(Object id);
	Object delete(Object id);
	Object getList(String sid);
}
