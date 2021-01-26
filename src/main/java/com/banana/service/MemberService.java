package com.banana.service;

import javax.servlet.http.HttpSession;

import com.banana.vo.BananaMemberVO;

public interface MemberService {
	Object getResultJoin(BananaMemberVO vo);
	/* String getResultIdCheck(String id); */
	Object getResultLogin(BananaMemberVO vo, HttpSession seesion);
}
