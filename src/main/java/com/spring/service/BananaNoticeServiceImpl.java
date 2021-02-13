package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.BananaNoticeDAO;
import com.banana.vo.BananaFAQVO;
import com.banana.vo.BananaNoticeVO;

@Service("noticeService")
public class BananaNoticeServiceImpl implements BoardService{
	
	@Autowired
	private BananaNoticeDAO BananaNoticeDAO;
	
	@Override
	public ModelAndView getList(String rpage, String param) {
		ModelAndView mv =  new ModelAndView();
		
		//list db연동 코드
		
		
		//2-1. 페이지값에 따라서 start, end count 구하기
		//1페이지(1~10), 2페이지(11~20) ...
		int start = 0;
		int end = 0;
		int pageSize = 5; //한 페이지당 출력되는 row
		int pageCount = 1; //전체 페이지 수  : 전체 리스트 row /한 페이지당 출력되는 row
		int dbCount = BananaNoticeDAO.getListCount(); //DB연동 후 전체로우수 출력
		int reqPage = 1; //요청페이지
		
		//2-2. 전체페이지 수 구하기 - 화면출력
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;		
		}else{
			pageCount = dbCount/pageSize +1;
		}
		
		//2-3. start, end 값 구하기
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			start = (reqPage-1) * pageSize +1 ;
			end = reqPage*pageSize;	
		}else{
			start = reqPage;
			end = pageSize;
		}

		ArrayList<BananaNoticeVO> list = BananaNoticeDAO.getList(start, end);
		
		mv.addObject("list",list);
		mv.addObject("dbCount",dbCount);
		mv.addObject("reqPage",reqPage);
		mv.addObject("pageSize",pageSize);
		
		if(param.equals("user")) {
			mv.setViewName("notice/notice_list");			
		}else {
			mv.setViewName("notice/admin_notice_list");
		}
		
		return mv;
	}
	
	@Override
	public Object insert(Object vo) {
		
		 String result=""; 
		 boolean dao_result = BananaNoticeDAO.getInsert((BananaNoticeVO)vo);
		 
		 if(dao_result){ 
			 result="redirect:/admin_notice_list.do"; 
		}else{
		 result="errorPage"; 
		 }
		 
		 return result;
	}
	
	@Override
	public ModelAndView getContent(String id, String param) {
		ModelAndView mv = new ModelAndView();
		
		BananaNoticeVO vo = BananaNoticeDAO.getContent(id);
		BananaNoticeVO pre = BananaNoticeDAO.getPre(id);
		BananaNoticeVO next = BananaNoticeDAO.getNext(id);
		BananaNoticeDAO.getUpdateHits(id);
		
		mv.addObject("vo",vo);
		mv.addObject("pre",pre);		
		mv.addObject("next",next);
		if(param.equals("user")) {
			mv.setViewName("/notice/notice_content");			
		}else {
			mv.setViewName("/notice/admin_notice_content");
		}
		
		
		return mv;
	}
	
	@Override
	public ModelAndView getUpdate(String id) {
		ModelAndView mv = new ModelAndView();
		BananaNoticeVO vo = BananaNoticeDAO.getContent(id);
		
		mv.addObject("vo",vo);
		mv.setViewName("/notice/admin_notice_update");
		
		return mv;
	}
	
	@Override
	public ModelAndView getResultUpdate(Object vo) {
		ModelAndView mv = new ModelAndView();
		
		boolean result = BananaNoticeDAO.getUpdate((BananaNoticeVO)vo);
		
		if(result) {
			mv.setViewName("redirect:/admin_notice_list.do");
		}else {
			mv.setViewName("errorPage");
		}
				
		return mv;
	}
	
	@Override
	public ModelAndView getResultDelete(String id) {
		ModelAndView mv = new ModelAndView();
		
		boolean result = BananaNoticeDAO.getDelete(id);
		
		if(result) {
			mv.setViewName("redirect:/admin_notice_list.do");
		}else {
			mv.setViewName("errorPage");
		}
				
		return mv;
	}
}
