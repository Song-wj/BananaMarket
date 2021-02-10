package com.spring.banana;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.BananaShopReviewDAO;
import com.banana.vo.BananaShopAlarmVO;
import com.banana.vo.BananaShopReviewVO;
import com.banana.vo.SessionVO;
import com.enroll.service.EnrollService;
import com.enroll.service.EnrollstoreServiceImpl;

@Controller
public class NeighborhoodController {
	
	@Autowired
	private EnrollService shopService;
	
	@Autowired
	private EnrollstoreServiceImpl EnrollstoreServiceImpl;
	
	@Autowired
	private EnrollService shopReviewService;
	
	@Autowired
	private BananaShopReviewDAO shopReviewDAO;
	
	/**
	 * 업체 후기 alarm
	 */
	@ResponseBody
	@RequestMapping(value="/shop_alarm_write.do", method=RequestMethod.GET)
	public String shop_alarm_write(BananaShopAlarmVO vo, HttpSession session, String sid, String srid) {
		boolean result = false;
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		vo.setMid(svo.getMid());
		vo.setSid(sid);
		vo.setSrid(srid);
		System.out.println(svo.getMid()+","+sid+","+srid);
		result = shopReviewDAO.shopAlarmWrite(vo);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="/getShopId.do", method=RequestMethod.GET)
	public String getShopId(String sid) {
		//return shopReviewService.getShopId(sid);
		String srid = shopReviewDAO.getShopId(sid);
		System.out.println("srid: "+ srid);
		return srid;
	}
	
	
	/**
	 * 내 근처 - 업체 후기 삭제 처리
	 * @return
	 */
	@RequestMapping(value ="/neighborStoreReview_delete_proc.do", method = RequestMethod.GET)
	public String deleteStore_delete_proc(String srid) {	
		return (String)shopReviewService.delete(srid);
	}
	
	/**
	 * 내 근처 - 업체 후기 삭제 화면
	 * @return
	 */
	@RequestMapping(value ="/neighborStoreReview_delete.do", method = RequestMethod.GET)
	public ModelAndView deleteStore_delete(String srid) {	
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("srid", srid);
		mv.setViewName("/myNeighborhood/neighborStoreReview_delete");
		
		return mv;
	} 
	
	/**
	 * 내 근처 - 업체 후기 수정 처리
	 * @return
	 */
	@RequestMapping(value ="/neighborStoreReview_update_proc.do", method = RequestMethod.POST)
	public ModelAndView neighborStoreReview_update_proc(BananaShopReviewVO vo) {	
		return (ModelAndView)shopReviewService.update(vo);
	}
	
	/**
	 * 내 근처 - 업체 후기 수정 화면
	 * @return
	 */
	@RequestMapping(value="/neighborStoreReview_update.do",method=RequestMethod.GET)
	public ModelAndView neighborStoreReview_update(String srid) {
		return (ModelAndView)shopReviewService.getUpdateContent(srid);
	}
	
	/**
	 * 내 근처 - 업체 후기 내용 화면
	 */
	@RequestMapping(value="/neighborStoreReview_content.do", method=RequestMethod.GET)
	public ModelAndView neighborStoreReview_content(String srid, String mid) {
		return (ModelAndView)shopReviewService.getContent(srid,null);
	}
	
	/**
	 * 내 근처 - 업체 후기 리스트
	 * @return
	 */
	@RequestMapping(value="/neighborStoreReview_list.do" , method=RequestMethod.GET)
	public ModelAndView neighborhoodStoreReview_list(String sid) {
		return (ModelAndView)shopReviewService.getSelectList(sid);
	}
	
	/**
	 * 내 근처 - 업체 후기 등록 처리
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/neighborStoreReview_write_proc.do",method=RequestMethod.GET)
	public String neighborStoreReview_write_proc(BananaShopReviewVO vo, String sid, HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		vo.setMid(svo.getMid());
		vo.setSid(sid);
		
		return shopReviewService.insertStore(vo);
	}
	
	/**
	 * 내 근처 - 업체 후기 등록 화면
	 */
	@RequestMapping(value="/neighborStoreReview_write.do" , method=RequestMethod.GET)
	public ModelAndView neighborStoreReview_write(String sid, String mid) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("sid", sid);
		mv.addObject("mid", mid);
		mv.setViewName("/myNeighborhood/neighborStoreReview_write");
		
		return mv;
	}
	
	/**
	 * 내 근처 - 업체정보 화면
	 * @return
	 */
	@RequestMapping(value="/neighborhoodStore.do" , method=RequestMethod.GET)
	public ModelAndView neighborhoodStore(String sid,HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		return (ModelAndView)shopService.getContent(sid,svo.getMid());
	}
	
	@RequestMapping(value="/neighborhood.do" , method=RequestMethod.GET)
	public ModelAndView neighborhood() {
		return (ModelAndView)shopService.getList();
	}
	
	@RequestMapping(value="/footer.do", method=RequestMethod.GET)
	public String index() {
		return "footer";
	}
	
	@ResponseBody
	@RequestMapping(value="/shop_like.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public ModelAndView product_like(String mid, String sid) {
		return EnrollstoreServiceImpl.product_like(mid, sid);
	}
	
	@ResponseBody
	@RequestMapping(value="/shop_unlike.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String product_unlike(HttpSession session, String sid) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		return EnrollstoreServiceImpl.product_unlike(svo.getMid(), sid);
	}
}
