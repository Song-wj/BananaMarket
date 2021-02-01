package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.pReviewDAO;
import com.banana.vo.ReviewVO;

@Service("mypageReviewService")
public class MypageReviewServiceImpl implements BananaService {

	@Autowired
	private pReviewDAO reviewDAO;
	
	@Override
	public Object insert(Object vo) {

		String path = "";
		int val = reviewDAO.reviewInsert((ReviewVO) vo);
		if (val != 0) {
			path = "redirect:/mypage.do";
		}
		return path;
	}
	@Override
	public Object getList() {
		ModelAndView mv = new ModelAndView();
		ArrayList<ReviewVO> list = reviewDAO.getReviewList();
		ArrayList<ReviewVO> blist = reviewDAO.getBuyReviewList();
		ArrayList<ReviewVO> slist = reviewDAO.getSellReviewList();
		mv.addObject("list", list);
		mv.addObject("blist", blist);
		mv.addObject("slist", slist);
		mv.setViewName("mypage/mypage_review");
		return mv;
	};
	
	public Object getMyReviewList(String mid) {
		ModelAndView mv = new ModelAndView();
		ArrayList<ReviewVO> list = reviewDAO.getMyReviewList(mid);
		mv.addObject("list", list);
	
		mv.setViewName("mypage/mypage_MyReview");
		return mv;
	};
	/*
	 * public Object getList() { ModelAndView mv = new ModelAndView();
	 * ArrayList<ReviewVO> list =reviewDAO.getReviewList();
	 * 
	 * JsonArray jarray = new JsonArray(); JsonObject jobj = new JsonObject(); Gson
	 * gson = new Gson(); for(ReviewVO vo : list) { JsonObject obj = new
	 * JsonObject(); obj.addProperty("rid", vo.getRid()); obj.addProperty("pid",
	 * vo.getPid()); obj.addProperty("mid", vo.getMid()); obj.addProperty("review",
	 * vo.getReview()); obj.addProperty("date", vo.getRdate());
	 * obj.addProperty("addr", vo.getMaddr());
	 * 
	 * jarray.add(obj); } jobj.add("jlist" , jarray);
	 * 
	 * 
	 * mv.addObject("list", list); mv.setViewName("mypage/mypage_review");
	 * 
	 * return gson.toJson(jobj); };
	 */
	
	
	@Override
	public Object getUpdateContent(Object rid) {
		ModelAndView mv = new ModelAndView();
		ReviewVO vo = reviewDAO.getMyReview((String)rid);	
		mv.addObject("vo", vo);
		mv.setViewName("mypage/mypage_myReview_update");
		return mv;

	};
	
	@Override
	public Object update(Object vo) {
		ModelAndView mv = new ModelAndView();
		ReviewVO rvo = (ReviewVO)vo;
		String msg= "수정이 완료되었습니다.";
		int val=0;
		if(rvo.getRid().contains("BR")){
			val = reviewDAO.updateBuyMyReview(rvo);	
		}else {
			val = reviewDAO.updateSellMyReview(rvo);	
		}
		if(val !=0) {
			mv.addObject("msg", msg);
			mv.setViewName("redirect:/mypage.do");			
		}
		
		return mv;
		
	
	};
	
	@Override
	public Object delete(Object id) {
		ModelAndView mv = new ModelAndView();
		String msg= "삭제가 완료되었습니다.";
		String rid = (String)id;
		int val=0;
		if(rid.contains("BR")){
			val= reviewDAO.deleteBuyMyReview(rid);	
		}else {
			val = reviewDAO.deleteSellMyReview(rid);	
		}
		if(val !=0) {
			mv.addObject("msg", msg);
			mv.setViewName("redirect:/mypage.do");			
		}
		
		return mv;
	};
	
	public ModelAndView deleteMyReview(String rid) {
		ModelAndView mv = new ModelAndView();
		String msg= "삭제가 완료되었습니다.";
		int val=0;
		if(rid.contains("BR")){
			val= reviewDAO.deleteBuyMyReview(rid);	
		}else {
			val = reviewDAO.deleteSellMyReview(rid);	
		}
		if(val !=0) {
			mv.addObject("msg", msg);
			mv.setViewName("mypage/mypage");			
		}
		
		return mv;
	}
	
	
	@Override
	public Object getContent(Object id) {
		return "";
	};
	
	
}
