package com.enroll.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.BananaShopDAO;
import com.banana.vo.BananaShopVO;

@Service("shopService")
public class EnrollstoreServiceImpl implements EnrollService {
	
	@Autowired
	private BananaShopDAO shopDAO;

	@Override
	public Object getList() {
		ModelAndView mv = new ModelAndView();
		ArrayList<BananaShopVO> list = shopDAO.getShopList();
		
		mv.addObject("list",list);
		mv.setViewName("/myNeighborhood/neighborhood");
		
		return mv;
	}

	@Override
	public Object insert(Object vo) {
		ModelAndView mv = new ModelAndView();

		BananaShopVO svo = (BananaShopVO)vo;
		if(svo.getFile1().getSize() != 0) {
			UUID uuid = UUID.randomUUID();	//중복방지를 위해 사용 --> bsfile
			svo.setSmain_img(svo.getFile1().getOriginalFilename());
			svo.setSmain_simg(uuid + "_" + svo.getFile1().getOriginalFilename());
		}
		
		boolean dao_result = shopDAO.insertShop(svo);
		
		if(dao_result) {
			//3. 서버 저장 --> upload 폴더에 저장(폴더위치)
			//String path1 = request.getSession().getServletContext().getRealPath("/");
			//String path2 = "\\resources\\upload\\";
			File file = new File(svo.getSavepath1()+svo.getSmain_simg());
			try {
				svo.getFile1().transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			mv.setViewName("redirect:/neighborhood.do");
		}else
			mv.setViewName("errorPage");
		
		return mv;
	}

	@Override
	public Object getContent(Object sid) {
		ModelAndView mv = new ModelAndView();
		BananaShopVO svo = shopDAO.getShopContent((String)sid);
		svo.getSintro().replace("\r\n", "<br>");
		
		mv.addObject("vo", svo);
		mv.setViewName("/myNeighborhood/neighborhoodStore");
		
		return mv;
	}

	@Override
	public Object update(Object vo) {
		ModelAndView mv = new ModelAndView();
		boolean result = false;

		BananaShopVO svo = (BananaShopVO)vo;
		
		if(svo.getFile1().getSize() != 0) {
			UUID uuid = UUID.randomUUID();	
			svo.setSmain_img(svo.getFile1().getOriginalFilename());
			svo.setSmain_simg(uuid + "_" + svo.getFile1().getOriginalFilename());
			
			result = shopDAO.shopUpdate(svo);
			
			if(result) {
				//3. 서버 저장 --> upload 폴더에 저장(폴더위치)
				//String path1 = request.getSession().getServletContext().getRealPath("/");
				//String path2 = "\\resources\\upload\\";
				File file = new File(svo.getSavepath1()+svo.getSmain_simg());
				try {
					svo.getFile1().transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}else {
			//기존 파일 유지
			result = shopDAO.shopUpdateNofile(svo);
		}
		
		if(result) {
			mv.setViewName("redirect:/neighborhood.do");
		}else
			mv.setViewName("errorPage");
		
		return mv;
	}

	@Override
	public Object getUpdateContent(Object sid) {
		ModelAndView mv = new ModelAndView();
		BananaShopVO svo = shopDAO.getShopContent((String)sid);
		
		mv.addObject("vo", svo);
		mv.addObject("sid", sid);
		mv.setViewName("/enrollstore/updateStore");
		
		return mv;
	}

	@Override
	public Object delete(Object sid) {
		boolean result = shopDAO.shopDelete((String)sid);
		
		String str="";
		if(result) {
			str="redirect:/neighborhood.do";
		}
		return str;
	}

}
