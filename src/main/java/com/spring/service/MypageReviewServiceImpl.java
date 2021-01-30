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

	public Object insert(Object vo) {

		String path = "";
		int val = reviewDAO.reviewInsert((ReviewVO) vo);
		if (val != 0) {
			path = "redirect:/mypage.do";
		}
		return path;
	}

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

	public Object getContent(Object id) {
		return "";
	};

	public Object update(Object vo) {
		return "";
	};

	public Object getUpdateContent(Object id) {
		return "";

	};

	public Object delete(Object id) {
		return "";
	};
}
