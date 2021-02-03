package com.spring.banana;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.banana.vo.SessionVO;
import com.banana.vo.dongneVO;
import com.spring.service.BananaService;
import com.spring.service.DongneServiceImpl;
import com.spring.service.ProductServiceImpl;

@Controller
public class DongneController  {
	
	
	@Autowired
	@Qualifier("dongneService")
	private BananaService dongneService;
	
	@Autowired
	private DongneServiceImpl dongneServiceImpl;
	
	/**
	 * 동네생활 - 글정보 삭제화면
	 * @return
	 */
	@RequestMapping(value ="/dongneLife_delete.do", method = RequestMethod.GET)
	public String dongneLife_delete(String bid) {	
		return (String)dongneService.delete(bid);
	}
	
	/**
	 * 동네생활 - 글정보 수정화면
	 * @return
	 */
	@RequestMapping(value ="/dongneLife_update.do", method = RequestMethod.GET)
	public ModelAndView dongneLife_update(String bid) {
		
		return (ModelAndView)dongneService.getUpdateContent(bid);
	}
	
	@RequestMapping(value ="/dongneLife_update_proc.do", method = RequestMethod.POST)
	public ModelAndView dongneLife_update_proc(dongneVO vo ,  MultipartHttpServletRequest mtfRequest ,HttpServletRequest request) {	
		
		 List<MultipartFile> fileList = mtfRequest.getFiles("file1");
		
		 String path1 = request.getSession().getServletContext().getRealPath("/");
		 String path2 = "\\resources\\upload\\";
		
		
		 vo.setSavepath(path1+path2);
		 vo.setList(fileList);
		
		return (ModelAndView) dongneService.update(vo);
	}

	/**
	 * 동네생활 - 글정보 화면
	 * @return
	 */
	@RequestMapping(value ="/dongneLife_content.do", method = RequestMethod.GET)
	public ModelAndView dongneLife_content(String bid, HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		return (ModelAndView)dongneService.getContent(bid,svo.getMid());
	}
	
	/**
	 * 동네생활 - 글쓰기 화면
	 * @return
	 */
	@RequestMapping(value ="/dongneLife_write.do", method = RequestMethod.GET)
	public String dongnelife_write() {
		return "/dongneLife/dongneLife_write";
	}
	
	@RequestMapping(value ="/dongneLife_write_proc.do", method = RequestMethod.POST)
	public String dongneLife_write_proc(dongneVO vo , MultipartHttpServletRequest mtfRequest ,HttpServletRequest request ,HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		 vo.setMid(svo.getMid());

		 List<MultipartFile> fileList = mtfRequest.getFiles("file1");
		 String path1 = request.getSession().getServletContext().getRealPath("/");
		 String path2 = "\\resources\\upload\\";
		
		 vo.setSavepath(path1+path2);
		 vo.setList(fileList);
		return (String) dongneService.insert(vo);
	}

	/**
	 * 동네생활 - 홈 화면
	 * @return
	 */
	@RequestMapping(value ="/dongneLife.do", method = RequestMethod.GET)
	public ModelAndView dongnelife() {
		
		return (ModelAndView)dongneService.getList();
	}
	
	@ResponseBody
	@RequestMapping(value="/dongnelife_like.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public ModelAndView product_like(String mid, String bid) {
		return dongneServiceImpl.product_like(mid, bid);
	}
	
	@ResponseBody
	@RequestMapping(value="/dongnelife_unlike.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String product_unlike(HttpSession session, String bid) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		return dongneServiceImpl.product_unlike(svo.getMid(), bid);
	}
	
	
}

