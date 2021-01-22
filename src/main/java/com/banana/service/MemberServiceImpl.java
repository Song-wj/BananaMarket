package com.banana.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.BananaMemberDAO;
import com.banana.vo.BananaMemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	BananaMemberDAO memberDAO;
	
	@Override
	public Object getResultJoin(BananaMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		
		boolean result = memberDAO.InsertMember(vo);
		
		if(result) {
			mv.setViewName("/login/login");
		}
		else {
			mv.setViewName("errorPage");
		}
		return mv;
	}

}
