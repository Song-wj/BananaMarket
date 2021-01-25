package com.banana.service;

import java.io.File;
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
	public String getResultLogin(BananaMemberVO vo, HttpSession session) {
		SessionVO svo = memberDAO.getLogin(vo);
		String result = "";
		
		if(svo.getResult() != 0) {
			session.setAttribute("svo", svo);
			result = "index";
		} else {
			result = "errorPage";
			System.out.println("로그인 실패");
			System.out.println(svo.getResult());
			System.out.println(svo.getNickname());
		}
		
		return result;
	}

	
	/*
	 * @Override public String getResultIdCheck(String id) { 
	 * int result =  memberDAO.getIdCheck(id); 
	 * return String.valueOf(result); 
	 * }
	 */

	@Override
	public Object getResultJoin(BananaMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		
		if(vo.getFile1().getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			vo.setMfile(vo.getFile1().getOriginalFilename());
			vo.setMsfile(uuid + "_" + vo.getFile1().getOriginalFilename());
			boolean result = memberDAO.InsertMember(vo);
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
			System.out.println("해당 파일 없음");
		}
		
		return mv;
	}

}
