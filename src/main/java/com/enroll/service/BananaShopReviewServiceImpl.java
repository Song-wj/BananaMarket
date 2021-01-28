package com.enroll.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.BananaShopReviewDAO;
import com.banana.vo.BananaShopReviewVO;

@Service("shopReviewService")
public class BananaShopReviewServiceImpl implements EnrollService {
	
	@Autowired
	private BananaShopReviewDAO shopReviewDAO;

	@Override
	public Object getList() {
		ModelAndView mv = new ModelAndView();
		ArrayList<BananaShopReviewVO> list = shopReviewDAO.getShopReviewList();
		
		mv.addObject("list",list);
		mv.setViewName("/myNeighborhood/neighborStoreReview_list");
		
		return mv;
	}
	
	//특정 업체 후기 리스트
	public Object getList(String sid) {
		ModelAndView mv = new ModelAndView();
		ArrayList<BananaShopReviewVO> list = shopReviewDAO.getShopReviewList(sid);
		int review_count = shopReviewDAO.getShopReviewCount(sid);
		
		mv.addObject("review_count", review_count);
		mv.addObject("list",list);
		mv.setViewName("/myNeighborhood/neighborStoreReview_list");
		
		return mv;
	}

	@Override
	public Object insert(Object vo) {
		ModelAndView mv = new ModelAndView();

		BananaShopReviewVO srvo = (BananaShopReviewVO)vo;
		
		boolean dao_result = shopReviewDAO.insertShopReview(srvo);
		
		if(dao_result) {
			mv.setViewName("redirect:/neighborhood.do");
		}else
			mv.setViewName("errorPage");
		
		return mv;
	}

	@Override
	public Object getContent(Object srid) {
		ModelAndView mv = new ModelAndView();
		BananaShopReviewVO srvo = shopReviewDAO.getShopReviewContent((String)srid);
		srvo.getSrcontent().replace("\r\n", "<br>");
		
		mv.addObject("vo", srvo);
		mv.setViewName("/myNeighborhood/neighborStoreReview_content");
		
		return mv;
	}

	@Override
	public Object update(Object vo) {
		ModelAndView mv = new ModelAndView();
		boolean result = false;

		BananaShopReviewVO srvo = (BananaShopReviewVO)vo;
		
		result = shopReviewDAO.shopReviewUpdate(srvo);

		if(result) {
			mv.setViewName("redirect:/neighborhood.do");
		}else
			mv.setViewName("errorPage");
		
		return mv;
	}

	@Override
	public Object getUpdateContent(Object srid) {
		ModelAndView mv = new ModelAndView();
		BananaShopReviewVO srvo = shopReviewDAO.getShopReviewContent((String)srid);
		
		mv.addObject("vo", srvo);
		mv.addObject("srid", srid);
		mv.setViewName("/myNeighborhood/neighborStoreReview_update");
		
		return mv;
	}

	@Override
	public Object delete(Object srid) {
		boolean result = shopReviewDAO.shopReviewDelete((String)srid);
		
		String str="";
		if(result) {
			str="redirect:/neighborhood.do";
		}
		return str;
	}

}
