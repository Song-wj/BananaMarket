package com.banana.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.BananaMemberDAO;
import com.banana.vo.BananaMemberVO;
import com.banana.vo.SessionVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	BananaMemberDAO memberDAO;
	
	@Override
	public Object getMemberList() {
		ModelAndView mv = new ModelAndView();
		ArrayList<BananaMemberVO> list = memberDAO.getMemberList();
		mv.addObject("list", list);
		mv.setViewName("admin/memberManage");
		return mv;
	}
	
	@Override
	public ModelAndView getMemberContent(String mid) {
		ModelAndView mv = new ModelAndView();
		BananaMemberVO vo = memberDAO.MemberContent((String)mid);
		
		mv.addObject("vo", vo);
		mv.setViewName("/mypage/mypage");
		return mv;
	}
	
	@Override
	public String getResultLoginChk(String id, String pass) {
		int result = memberDAO.getLoginChk(id, pass);
		System.out.println(result);
		return String.valueOf(result);
	}

	@Override
	public ModelAndView getResultLogin(BananaMemberVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		SessionVO svo = memberDAO.getLogin(vo);
		//String result = "";
		mv.addObject("svo", svo);
		
		if(svo.getResult() == 1) {
			session.setAttribute("svo", svo);
			mv.setViewName("index");
		} else {
			mv.setViewName("/login/login");
		}
		
		return mv;
	}
	
	@Override public String getResultNickCheck(String nick) { 
		int result =  memberDAO.getNickCheck(nick); 
		return String.valueOf(result);
	}
	
	@Override public String getResultIdCheck(String id) { 
	int result =  memberDAO.getIdCheck(id); 
		return String.valueOf(result); 
	}

	@Override
	public Object getResultJoin(BananaMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		boolean result = false;
		if(vo.getFile1().getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			vo.setMfile(vo.getFile1().getOriginalFilename());
			vo.setMsfile(uuid + "_" + vo.getFile1().getOriginalFilename());
			 result = memberDAO.InsertMember(vo);
			if(result) {
				File file = new File(vo.getSavepath() + vo.getMsfile());
				try {
					vo.getFile1().transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
				mv.setViewName("/login/login");
			}
			else {
				mv.setViewName("errorPage");
			}
			
		} else {
			result = memberDAO.InsertMember(vo);
			if(result) {
				mv.setViewName("/login/login");
			}
			/* System.out.println("해당 파일 없음"); */
		}
		
		return mv;
	}

}
