package com.spring.banana;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.banana.vo.BananaFAQVO;
import com.spring.service.BoardService;

@Controller
public class QuestionController {
	
	@Autowired
	private BoardService questionService;
	
	/**
	 * 관리자 자주묻는질문 리스트
	 * @return
	 */
	@RequestMapping(value="/admin_question_list.do",method=RequestMethod.GET)
	public ModelAndView admin_question_list(String rpage) {
		return questionService.getList(rpage, "admin");
	}
	
	/**
	 * 관리자 자주묻는질문 내용
	 * @return
	 */
	@RequestMapping(value="/admin_question_content.do",method=RequestMethod.GET)
	public ModelAndView admin_question_content(String fid) {
		return questionService.getContent(fid,"admin");
	}
	
	/**
	 * 관리자 자주묻는질문 삽입
	 * @return
	 */
	@RequestMapping(value="/admin_question_write.do",method=RequestMethod.GET)
	public String admin_question_write() {
		return "/question/admin_question_write";
	}
	@RequestMapping(value="/admin_question_write_proc.do",method=RequestMethod.POST)
	public String admin_question_write_proc(BananaFAQVO vo) {
		return (String) questionService.insert(vo);
	}
	
	/**
	 * 관리자 자주묻는질문 삭제
	 * @return
	 */
	@RequestMapping(value="/admin_question_delete.do",method=RequestMethod.GET)
	public ModelAndView admin_question_delete(String fid) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("fid",fid);
		mv.setViewName("/question/admin_question_delete");
		
		return mv;
	}
	@RequestMapping(value="/admin_question_delete_proc.do",method=RequestMethod.GET)
	public ModelAndView admin_question_delete_proc(String fid) {
		return questionService.getResultDelete(fid);
	}
	
	/**
	 * 관리자 자주묻는질문 수정
	 * @return
	 */
	@RequestMapping(value="/admin_question_update.do",method=RequestMethod.GET)
	public ModelAndView admin_question_update(String fid) {
		return questionService.getUpdate(fid);
	}
	
	@RequestMapping(value="/admin_question_update_proc.do",method=RequestMethod.POST)
	public ModelAndView admin_question_update_proc(BananaFAQVO vo) {
		return questionService.getResultUpdate(vo);
	}
	
	/**
	 * 자주묻는질문 리스트
	 * @return
	 */
	@RequestMapping(value="/question_list.do",method=RequestMethod.GET)
	public ModelAndView question_list(String rpage) {
		return questionService.getList(rpage,"user");
	}
	
	
	/**
	 * 자주묻는질문 내용
	 * @return
	 */
	@RequestMapping(value="/question_content.do" , method=RequestMethod.GET)
	public ModelAndView question_content(String fid) {
		return questionService.getContent(fid,"user");
	}
}
