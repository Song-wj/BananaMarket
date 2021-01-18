package com.spring.banana;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QuestionController {
	
	/**
	 * 관리자 자주묻는질문 리스트
	 * @return
	 */
	@RequestMapping(value="/admin_question_list.do",method=RequestMethod.GET)
	public String admin_question_list() {
		return "/question/admin_question_list";
	}
	
	/**
	 * 관리자 자주묻는질문 내용
	 * @return
	 */
	@RequestMapping(value="/admin_question_content.do",method=RequestMethod.GET)
	public String admin_question_content() {
		return "/question/admin_question_content";
	}
	
	/**
	 * 관리자 자주묻는질문 삽입
	 * @return
	 */
	@RequestMapping(value="/admin_question_write.do",method=RequestMethod.GET)
	public String admin_question_write() {
		return "/question/admin_question_write";
	}
	
	/**
	 * 관리자 자주묻는질문 삭제
	 * @return
	 */
	@RequestMapping(value="/admin_question_delete.do",method=RequestMethod.GET)
	public String admin_question_delete() {
		return "/question/admin_question_delete";
	}
	
	/**
	 * 관리자 자주묻는질문 수정
	 * @return
	 */
	@RequestMapping(value="/admin_question_update.do",method=RequestMethod.GET)
	public String admin_question_update() {
		return "/question/admin_question_update";
	}
	
	/**
	 * 자주묻는질문 리스트
	 * @return
	 */
	@RequestMapping(value="/question_list.do",method=RequestMethod.GET)
	public String question_list() {
		return "/question/question_list";
	}
	
	
	/**
	 * 자주묻는질문 내용
	 * @return
	 */
	@RequestMapping(value="/question_content.do" , method=RequestMethod.GET)
	public String question_content() {
		
		return "/question/question_content";
	}
}
