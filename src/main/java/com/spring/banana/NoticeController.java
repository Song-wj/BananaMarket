package com.spring.banana;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController {
	
	/**
	 * 관리자 공지사항 리스트
	 * @return
	 */
	@RequestMapping(value="/admin_notice_list.do",method=RequestMethod.GET)
	public String admin_notice_list() {
		return "/notice/admin_notice_list";
	}
	
	/**
	 * 관리자 공지사항 내용
	 * @return
	 */
	@RequestMapping(value="/admin_notice_content.do",method=RequestMethod.GET)
	public String admin_notice_content() {
		return "/notice/admin_notice_content";
	}
	
	/**
	 * 관리자 공지사항 삽입
	 * @return
	 */
	@RequestMapping(value="/admin_notice_write.do",method=RequestMethod.GET)
	public String admin_notice_write() {
		return "/notice/admin_notice_write";
	}
	
	/**
	 * 관리자 공지사항 삭제
	 * @return
	 */
	@RequestMapping(value="/admin_notice_delete.do",method=RequestMethod.GET)
	public String admin_notice_delete() {
		return "/notice/admin_notice_delete";
	}
	
	/**
	 * 관리자 공지사항 수정
	 * @return
	 */
	@RequestMapping(value="/admin_notice_update.do",method=RequestMethod.GET)
	public String admin_notice_update() {
		return "/notice/admin_notice_update";
	}
	
	/**
	 * 공지사항 리스트
	 * @return
	 */
	@RequestMapping(value="/notice_list.do",method=RequestMethod.GET)
	public String notice_list() {
		return "/notice/notice_list";
	}
	
	
	/**
	 * 공지사항 내용
	 * @return
	 */
	@RequestMapping(value="/notice_content.do" , method=RequestMethod.GET)
	public String notice_content() {
		
		return "/notice/notice_content";
	}
	
	
}
