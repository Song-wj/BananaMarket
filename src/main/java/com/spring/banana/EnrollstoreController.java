package com.spring.banana;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.banana.vo.BananaShopVO;
import com.enroll.service.EnrollService;

@Controller
public class EnrollstoreController {
	
	@Autowired
	private EnrollService shopService;
	
	@RequestMapping(value="/enroll_jusoPopup.do",method= {RequestMethod.POST, RequestMethod.GET})
	public String enroll_jusoPopup() {
		return "/enrollstore/jusoPopup";
	}
	
	/**
	 * 업체 삭제 처리
	 * @return
	 */
	@RequestMapping(value ="/deleteStore_delete_proc.do", method = RequestMethod.GET)
	public String deleteStore_delete_proc(String sid) {	
		return (String)shopService.delete(sid);
	}
	
	/**
	 * 업체 삭제 화면
	 * @return
	 */
	@RequestMapping(value ="/deleteStore_delete.do", method = RequestMethod.GET)
	public ModelAndView deleteStore_delete(String sid) {	
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("sid", sid);
		mv.setViewName("/enrollstore/deleteStore");
		
		return mv;
	} 
	
	/**
	 * 업체 수정 처리
	 * @return
	 */
	@RequestMapping(value ="/updateStore_update_proc.do", method = RequestMethod.POST)
	public ModelAndView updateStore_update_proc(BananaShopVO vo, MultipartHttpServletRequest mtfRequest, HttpServletRequest request) {	
		List<MultipartFile> fileList = mtfRequest.getFiles("file_list");
		//서버의 저장경로
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
		
		System.out.println(fileList.size());
		//vo에 저장경로 추가
		vo.setSavepath1(path1+path2);
		vo.setFlie_list(fileList);
		/*
		 * System.out.println(vo.getFlie_list().get(0));
		 * System.out.println(vo.getFlie_list().get(1));
		 */
		
		return (ModelAndView)shopService.update(vo);
	}
	
	/**
	 * 업체 수정 화면
	 * @return
	 */
	@RequestMapping(value="/updateStore.do",method=RequestMethod.GET)
	public ModelAndView updateStore(String sid) {
		return (ModelAndView)shopService.getUpdateContent(sid);
	}
	
	/**
	 * 업체 등록 처리
	 * @return
	 */
	@RequestMapping(value="/enrollstore_write_proc.do",method=RequestMethod.POST)
	public ModelAndView enrollstore_write_proc(BananaShopVO vo, MultipartHttpServletRequest mtfRequest, HttpServletRequest request) {
		List<MultipartFile> fileList = mtfRequest.getFiles("file_list");
		//서버의 저장경로
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
				
		//vo에 저장경로 추가
		vo.setSavepath1(path1+path2);
		vo.setFlie_list(fileList);
		
		return (ModelAndView)shopService.insert(vo);
	}

	/**
	 * 업체 등록 화면
	 * @return
	 */
	@RequestMapping(value="/enrollstore.do",method=RequestMethod.GET)
	public String enrollStore() {
		return "/enrollstore/enrollstore";
	}
}
