package com.enroll.service;

public interface EnrollService {

	Object getList();
	Object insert(Object vo);
	Object getContent(Object id);
	Object update(Object vo);
	Object getUpdateContent(Object id);
	Object getUpdateContent(Object id, String rno);
	Object delete(Object id);
	Object getSelectList(String sid);
	String getCommentListAjaxProc(String bid);
}
