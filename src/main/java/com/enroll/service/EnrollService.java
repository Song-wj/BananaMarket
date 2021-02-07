package com.enroll.service;

import org.springframework.web.servlet.ModelAndView;

public interface EnrollService {

	Object getList();
	Object insert(Object vo);
	Object getContent(Object id,String mid);
	Object update(Object vo);
	Object getUpdateContent(Object id);
	Object getUpdateContent(Object id, String rno);
	Object delete(Object id);
	Object getSelectList(String sid);
	String getCommentListAjaxProc(String bid);
	String reviewAlarmWrite(Object vo);
	String getAlarmCount(String mid);
	String getAlarmContent(String mid);
	String deleteReviewAlarm(String brid);
}
