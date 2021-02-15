package com.spring.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.pReviewDAO;
import com.banana.vo.ChatVO;
import com.banana.vo.ReviewVO;

@Service("mypageReviewService")
public class MypageReviewServiceImpl implements BananaService {

	@Autowired
	private pReviewDAO reviewDAO;
	
	@Override
	public Object insert(Object vo) {
		
		String path = "";
		
		ReviewVO rvo = (ReviewVO)vo;
		ArrayList<String> file_list = new ArrayList<String>();
		ArrayList<String> sfile_list = new ArrayList<String>();
		
		UUID uuid = UUID.randomUUID();
		if(rvo.getList().get(0).getSize() != 0)  {
			 	
		       for (MultipartFile mf : rvo.getList()) {    	   
		           		           
		           file_list.add(mf.getOriginalFilename());
		           sfile_list.add(uuid+ "_"+ mf.getOriginalFilename());
 
		       }
		      
		       rvo.setRfile(String.join(",", file_list));
		       rvo.setRsfile(String.join(",", sfile_list));
		}
		
		
		int dao_result = reviewDAO.reviewInsert(rvo);
		if(dao_result !=0) {
			try {
				 for (MultipartFile mf : rvo.getList()) { 
					File file = new File(rvo.getSavepath()+ uuid+ "_"+ mf.getOriginalFilename());
					mf.transferTo(file);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			path = "redirect:/mypage.do";
		}
		
		
		
		
		return path;
	}
	@Override
	public Object getList() {
	 return "";
	}
	
	
	
	
//	리뷰 구매자 아이디 가져오기
	public Object getBuyMidList(String pid) {
		ModelAndView mv = new ModelAndView();
		ArrayList<ChatVO> list = reviewDAO.getBuyMidList(pid);
		mv.addObject("pid",pid);
		mv.addObject("list", list);
		mv.setViewName("mypage/mypage_contract_review");
		return mv;
	}
	
	
	public Object getList(String mid) {
		ModelAndView mv = new ModelAndView();
		ArrayList<ReviewVO> list = reviewDAO.getReviewList(mid);
		ArrayList<ReviewVO> blist = reviewDAO.getBuyReviewList(mid);
		ArrayList<ReviewVO> slist = reviewDAO.getSellReviewList(mid);
		countDate(list);
		countDate(blist);
		countDate(slist);
		mv.addObject("list", list);
		mv.addObject("blist", blist);
		mv.addObject("slist", slist);
		mv.setViewName("mypage/mypage_review");
		return mv;
	};
	
	//날짜 계산
	public void countDate(ArrayList<ReviewVO> list) {
		
		String str ="";
		for(ReviewVO vo : list) {
			int date = Integer.parseInt(vo.getRdate());
			if(60>date && date>0) {
				str =  date +"분";
			}else if(1440 > date && date>60) {
				str = date/60 +"시간";
			}else if (1440<date) {
				str= date/60/24 + "일";
			}else {
				str="방금";
			}
			vo.setRdate(str);
		}
	}
	public Object getMyReviewList(String mid) {
		ModelAndView mv = new ModelAndView();
		ArrayList<ReviewVO> list = reviewDAO.getMyReviewList(mid);
		countDate(list);
		mv.addObject("list", list);
		mv.setViewName("mypage/mypage_MyReview");
		return mv;
	};
	/*
	 * public Object getList() { ModelAndView mv = new ModelAndView();
	 * ArrayList<ReviewVO> list =reviewDAO.getReviewList();
	 * 
	 * JsonArray jarray = new JsonArray(); JsonObject jobj = new JsonObject(); Gson
	 * gson = new Gson(); for(ReviewVO vo : list) { JsonObject obj = new
	 * JsonObject(); obj.addProperty("rid", vo.getRid()); obj.addProperty("pid",
	 * vo.getPid()); obj.addProperty("mid", vo.getMid()); obj.addProperty("review",
	 * vo.getReview()); obj.addProperty("date", vo.getRdate());
	 * obj.addProperty("addr", vo.getMaddr());
	 * 
	 * jarray.add(obj); } jobj.add("jlist" , jarray);
	 * 
	 * 
	 * mv.addObject("list", list); mv.setViewName("mypage/mypage_review");
	 * 
	 * return gson.toJson(jobj); };
	 */
	
	
	@Override
	public Object getUpdateContent(Object rid) {
		ModelAndView mv = new ModelAndView();
		ReviewVO vo = reviewDAO.getMyReview((String)rid);	
		int count =0;
		if(vo.getRfile() != null) {
			String[] sfile_list =vo.getRsfile().split(",");
			for(int i=0; i<sfile_list.length; i++) {
				count++;
			}
		}
		mv.addObject("count", count);	
		mv.addObject("vo", vo);
		mv.setViewName("mypage/mypage_myReview_update");
		return mv;

	};
	
	@Override
	public Object update(Object vo) {
		
		ModelAndView mv = new ModelAndView();
		int val =0;
		ArrayList<String> file_list = new ArrayList<String>();
		ArrayList<String> sfile_list = new ArrayList<String>();
		ReviewVO rvo = (ReviewVO)vo;
		
		UUID uuid = UUID.randomUUID();
		
		if(rvo.getList().get(0).getSize() != 0) {
		
		       for (MultipartFile mf : rvo.getList()) {    	   
		    	   
		    		 file_list.add(mf.getOriginalFilename());
		    		 sfile_list.add(uuid+ "_"+ mf.getOriginalFilename());
		    	  
	          }
		      
		       rvo.setRfile(String.join(",", file_list));
		       rvo.setRsfile(String.join(",", sfile_list));
		       
		       
		      
				if(rvo.getRid().contains("BR")){
					val = reviewDAO.updateBuyMyReview(rvo);	
				}else {
					val = reviewDAO.updateSellMyReview(rvo);	
				}
		       
		       
		       if(val !=0) {
		       try {
					 for (MultipartFile mf : rvo.getList()) { 									    		   
							 File file = new File(rvo.getSavepath()+ uuid+ "_"+ mf.getOriginalFilename());
							 mf.transferTo(file);		    	   				
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
		       }		       
		}else if(rvo.getCancel_img().equals("cancel")) {
			 rvo.setRfile("");
		     rvo.setRsfile("");
		     
		   
				if(rvo.getRid().contains("BR")){
					val = reviewDAO.updateBuyMyReview(rvo);	
				}else {
					val = reviewDAO.updateSellMyReview(rvo);	
				}
		    
		}else {
			
			if(rvo.getRid().contains("BR")){
				val = reviewDAO.updateBuyMyReview(rvo);	
			}else {
				val = reviewDAO.updateSellMyReview(rvo);	
			}
		
		}			
		
		String msg= "수정이 완료되었습니다.";
		
		if(val !=0) {
			mv.addObject("msg", msg);
			mv.setViewName("redirect:/mypage.do");			
		}
		
		return mv;
		
	
	};
	
	@Override
	public Object delete(Object id) {
		ModelAndView mv = new ModelAndView();
		String msg= "삭제가 완료되었습니다.";
		String rid = (String)id;
		int val=0;
		if(rid.contains("BR")){
			val= reviewDAO.deleteBuyMyReview(rid);	
		}else {
			val = reviewDAO.deleteSellMyReview(rid);	
		}
		if(val !=0) {
			mv.addObject("msg", msg);
			mv.setViewName("redirect:/mypage.do");			
		}
		
		return mv;
	};
	
	public ModelAndView deleteMyReview(String rid) {
		ModelAndView mv = new ModelAndView();
		String msg= "삭제가 완료되었습니다.";
		int val=0;
		if(rid.contains("BR")){
			val= reviewDAO.deleteBuyMyReview(rid);	
		}else {
			val = reviewDAO.deleteSellMyReview(rid);	
		}
		if(val !=0) {
			mv.addObject("msg", msg);
			mv.setViewName("mypage/mypage");			
		}
		
		return mv;
	}
	
	
	@Override
	public Object getContent(Object mid, String a) {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<ReviewVO> list = reviewDAO.getGradeList((String)mid);
		ArrayList<ReviewVO> good_list = new ArrayList<ReviewVO>();
		ArrayList<ReviewVO> bad_list = new ArrayList<ReviewVO>();
		
		
		
		for(ReviewVO vo : list) {
			if(Integer.parseInt(vo.getScore())>=3) {
				if(Integer.parseInt(vo.getScore())==5) {
					vo.setScore("😆");
				}else if(Integer.parseInt(vo.getScore())==4) {
					vo.setScore("🙂");
				}else if(Integer.parseInt(vo.getScore())==3) {
					vo.setScore("😮");
				}
				good_list.add(vo);
			}else {
				if(Integer.parseInt(vo.getScore())==2) {
					vo.setScore("😥");
				}else if(Integer.parseInt(vo.getScore())==1) {
					vo.setScore("😡");
				}
				bad_list.add(vo);
			 }
		}
		
		mv.addObject("good_list", good_list);
		mv.addObject("bad_list", bad_list);
		mv.setViewName("mypage/mypage_mannerGrade");
		return mv;
	};
	
	
	
}
