package com.spring.banana;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.banana.vo.ReviewVO;
import com.banana.vo.productVO;
import com.spring.service.DongneServiceImpl;
import com.spring.service.MypageReviewServiceImpl;
import com.spring.service.ProductService;

@Controller
public class MypageController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private DongneServiceImpl dongneService;
	
	
	@Autowired

	private MypageReviewServiceImpl MypageReviewService ;
	
	
	
	/**
	 * 마이페이지 - 동네생활 글 삭제화면
	 * @return
	 */
	@RequestMapping(value ="/mypage_subjectList_delete.do", method = RequestMethod.GET)
	public String mypage_subjectList_delete() {
	
		return "mypage/mypage_subjectList_delete";
	}
	
	/**
	 * 마이페이지 - 동네생활 글 수정화면
	 * @return
	 */
	@RequestMapping(value ="/mypage_subjectList_update.do", method = RequestMethod.GET)
	public String mypage_subjectList_update() {
	
		return "mypage/mypage_subjectList_update";
	}
	
	
	/**
	 * 마이페이지 - 동네생활 ~~~주제로 글쓰기
	 * @return
	 */
	@RequestMapping(value="/mypage_subjectList_write.do", method=RequestMethod.GET)
	public String mypage_subjectList_write() {
		return "mypage/mypage_subjectList_write";
	}
	
	/**
	 * 마이페이지 - 동네생활 주제 Content
	 * @return
	 */
	@RequestMapping(value="/mypage_mannerGrade.do", method=RequestMethod.GET)
	public String mypage_mannerGrade() {
		return "mypage/mypage_mannerGrade";
	}
	
	@RequestMapping(value="/mypage_subjectContent.do", method=RequestMethod.GET)
	public ModelAndView mypage_subjectContent(String bsid) {
		return dongneService.getSubjectListContent(bsid);
	}
	
	/**
	 * 마이페이지 - 동네생활 주제 목록2
	 * @return
	 */
	@RequestMapping(value="/mypage_subjectList2.do", method=RequestMethod.GET)
	public ModelAndView mypage_subjectList2() {
		return dongneService.getSubjectList2();
	}

	/**
	 * 마이페이지 - 동네생활 주제 목록
	 * @return
	 */
	@RequestMapping(value="/mypage_subjectList.do", method=RequestMethod.GET)
	public ModelAndView mypage_subjectList() {
		return dongneService.getSubjectList();
	}
	
	/**
	 * 마이페이지 - 내 댓글
	 * @return
	 */
	@RequestMapping(value="/mypage_mycomment.do", method=RequestMethod.GET)
	public String mypage_comment() {
		return "mypage/mypage_mycomment";
	}
	
	/**
	 * 마이페이지 - 내 게시물
	 * @return
	 */
	@RequestMapping(value="/mypage_mypost.do", method=RequestMethod.GET)
	public String mypage_mypost() {
		return "mypage/mypage_mypost";
	}
	
	/**
	 * 마이페이지 - 모아보기
	 * @return
	 */
	@RequestMapping(value="/mypage_collectView.do", method=RequestMethod.GET)
	public String mypage_collectView() {
		return "mypage/mypage_collectView";
	}
	
	/**
	 * 마이페이지 - 키워드 알림설정
	 * @return
	 */
	@RequestMapping(value="/mypage_keyword.do", method=RequestMethod.GET)
	public String mypage_keyword() {
		return "mypage/mypage_keyword";
	}
	/**
	 * 마이페이지 - 동네인증
	 * @return
	 */
	@RequestMapping(value="/mypage_locationCheck.do", method=RequestMethod.GET)
	public String mypage_locationCheck() {
		return "mypage/mypage_locationCheck";
	}
	
	/**
	 * 마이페이지 - 동네설정
	 * @return
	 */
	@RequestMapping(value="/mypage_setLocation.do", method=RequestMethod.GET)
	public String mypage_setLocation() {
		return "mypage/mypage_setLocation";
	}
	
	/**
	 * 마이페이지 - 관심목록
	 * @return
	 */
	@RequestMapping(value="/mypage_like.do", method=RequestMethod.GET)
	public String mypage_like() {
		return "mypage/mypage_like";
	}
	
	/**
	 * 마이페이지 - 판매내역 - 삭제
	 * @return
	 */
	@RequestMapping(value ="/deletePage.do", method = RequestMethod.GET)
	public String deletePage(String pid) {	
		return (String)productService.delete(pid);
	}
	
	
	/**
	 * 마이페이지 - 판매내역 - 수정
	 * @param pid
	 * @return
	 */
	@RequestMapping(value="/updatePage.do", method=RequestMethod.GET)
	public ModelAndView updatePage(String pid) {
		return (ModelAndView)productService.getUpdateContent(pid);
	}
	/**
	 * 마이페이지 - 판매내역 - 수정 처리
	 * @return
	 */
	@RequestMapping(value="/updatePage_proc.do", method=RequestMethod.POST)
	public ModelAndView updatePage_proc(productVO vo,  MultipartHttpServletRequest mtfRequest ,HttpServletRequest request) {
			
		 List<MultipartFile> fileList = mtfRequest.getFiles("file1");
		 String path1 = request.getSession().getServletContext().getRealPath("/");
		 String path2 = "\\resources\\upload\\";
		
		 vo.setSavepath(path1+path2);
		 vo.setList(fileList);
		
		return (ModelAndView)productService.update(vo);
	}
	
	/**
	 * 마이페이지 - 판매내역
	 * @return
	 */
	@RequestMapping(value="/mypage_contract.do", method=RequestMethod.GET)
	public ModelAndView mypage_contract() {
		return (ModelAndView)productService.getSellList();
	}
	@RequestMapping(value="/mypage_contract_review.do", method=RequestMethod.GET)
	public String mypage_contract_review() {
		return "mypage/mypage_contract_review";
	}
	@RequestMapping(value="/contract_reivew_write_proc.do", method=RequestMethod.POST)
	public String contract_reivew_write_proc(ReviewVO vo , MultipartHttpServletRequest mtfRequest ,HttpServletRequest request) {
		 List<MultipartFile> fileList = mtfRequest.getFiles("file1");
		 String path1 = request.getSession().getServletContext().getRealPath("/");
		 String path2 = "\\resources\\upload\\";
		
		 vo.setSavepath(path1+path2);
		 vo.setList(fileList);
		 
		vo.setParam("판매자리뷰");
		return (String)MypageReviewService.insert(vo); 
	}
	/**
	 * 마이페이지 - 구매내역
	 * @return
	 */
	@RequestMapping(value="/mypage_purchased.do", method=RequestMethod.GET)
	public String mypage_purchased() {
		return "mypage/mypage_purchased";
	}
	// 구매내역 리뷰 쓰기
	@RequestMapping(value="/mypage_purchase_review.do", method=RequestMethod.GET)
	public String mypage_purchase_review() {
		return "mypage/mypage_purchase_review";
	}
	@RequestMapping(value="/purchase_reivew_write_proc.do", method=RequestMethod.POST)
	public String purchase_reivew_write_proc(ReviewVO vo , MultipartHttpServletRequest mtfRequest ,HttpServletRequest request) {
		

		 List<MultipartFile> fileList = mtfRequest.getFiles("file1");
		 String path1 = request.getSession().getServletContext().getRealPath("/");
		 String path2 = "\\resources\\upload\\";
		
		 vo.setSavepath(path1+path2);
		 vo.setList(fileList);
		 vo.setParam("구매자리뷰");
		return (String)MypageReviewService.insert(vo); 
	}
	
	
	/**
	 * 마이페이지 - 프로필 수정
	 * @return
	 */
	@RequestMapping(value="/mypage_update.do", method=RequestMethod.GET)
	public String mypage_update() {
		return "mypage/mypage_update";
	}
	
	/**
	 * 마이페이지 - 홈화면
	 * @return
	 */
	@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
	public String mypage() {
		return "mypage/mypage";
	}
	
	/**
	 * 마이페이지 - 내 댓글
	 * @return
	 */
	// 전체 리뷰
	@RequestMapping(value="/mypage_review.do", method=RequestMethod.GET)
	public ModelAndView mypage_review() {
		return (ModelAndView)MypageReviewService.getList();
		
	}
	
	// 내리뷰
	@RequestMapping(value="/mypage_myReview.do", method=RequestMethod.GET)
	public ModelAndView mypage_myRreview() {
		String mid ="qqq123";
		return (ModelAndView)MypageReviewService.getMyReviewList(mid);
		
	}
	// 리뷰 수정
	@RequestMapping(value="myReview_update.do", method=RequestMethod.GET)
	public ModelAndView myReview_update_proc(String rid ) {
		
		return (ModelAndView)MypageReviewService.getUpdateContent(rid);	
	}
	
	
		
	@RequestMapping(value="update_myReview_proc.do", method=RequestMethod.POST)
	public ModelAndView update_myReview_proc(ReviewVO vo ,MultipartHttpServletRequest mtfRequest ,HttpServletRequest request) {	
		
		 List<MultipartFile> fileList = mtfRequest.getFiles("file1");
		
		 String path1 = request.getSession().getServletContext().getRealPath("/");
		 String path2 = "\\resources\\upload\\";
		
		
		 vo.setSavepath(path1+path2);
		 vo.setList(fileList);
		return (ModelAndView)MypageReviewService.update(vo);
		
	}
	// 리뷰 삭제
		@RequestMapping(value="myReview_delete_proc.do", method=RequestMethod.GET)
		public ModelAndView myReview_delete_proc(String rid) {
			
			return (ModelAndView)MypageReviewService.delete(rid); 
		
			
		}
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/mypage_review.do", method=RequestMethod.GET) public
	 * String mypage_review() { return (String)MypageReviewService.getList();
	 * 
	 * }
	 */
}
