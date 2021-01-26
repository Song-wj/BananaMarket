package com.spring.banana;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.banana.vo.BananaFAQVO;
import com.banana.vo.BananaNoticeVO;
import com.spring.service.BoardService;

@Controller
public class NoticeController {
	
	@Autowired
	private BoardService noticeService;
	
	/**
	 * 관리자 공지사항 리스트
	 * @return
	 */
	@RequestMapping(value="/admin_notice_list.do",method=RequestMethod.GET)
	public ModelAndView admin_notice_list(String rpage) {
		return noticeService.getList(rpage, "admin");
	}
	
	/**
	 * 관리자 공지사항 내용
	 * @return
	 */
	@RequestMapping(value="/admin_notice_content.do",method=RequestMethod.GET)
	public ModelAndView admin_notice_content(String nid) {
		return noticeService.getContent(nid,"admin");
	}
	
	/**
	 * 관리자 공지사항 삽입
	 * @return
	 */
	@RequestMapping(value="/admin_notice_write.do",method=RequestMethod.GET)
	public String admin_notice_write() {
		return "/notice/admin_notice_write";
	}
	@RequestMapping(value="/admin_notice_write_proc.do",method=RequestMethod.POST)
	public String admin_notice_write_proc(BananaNoticeVO vo) {
		return (String) noticeService.insert(vo);
	}
	
	/**
	 * 관리자 공지사항 삭제
	 * @return
	 */
	@RequestMapping(value="/admin_notice_delete.do",method=RequestMethod.GET)
	public ModelAndView admin_notice_delete(String nid) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("nid",nid);
		mv.setViewName("/notice/admin_notice_delete");
		
		return mv;
	}
	@RequestMapping(value="/admin_notice_delete_proc.do",method=RequestMethod.GET)
	public ModelAndView admin_notice_delete_proc(String nid) {
		return noticeService.getResultDelete(nid);
	}
	
	/**
	 * 관리자 공지사항 수정
	 * @return
	 */
	@RequestMapping(value="/admin_notice_update.do",method=RequestMethod.GET)
	public ModelAndView admin_notice_update(String nid) {
		return noticeService.getUpdate(nid);
	}
	
	@RequestMapping(value="/admin_notice_update_proc.do",method=RequestMethod.POST)
	public ModelAndView admin_notice_update_proc(BananaNoticeVO vo) {
		return noticeService.getResultUpdate(vo);
	}
	
	/**
	 * 공지사항 리스트
	 * @return
	 */
	@RequestMapping(value="/notice_list.do",method=RequestMethod.GET)
	public ModelAndView notice_list(String rpage) {
		return noticeService.getList(rpage,"user");
	}
	
	
	/**
	 * 공지사항 내용
	 * @return
	 */
	@RequestMapping(value="/notice_content.do" , method=RequestMethod.GET)
	public ModelAndView notice_content(String nid) {
		return noticeService.getContent(nid,"user");
	}
	
	
}
