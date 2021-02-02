package com.spring.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.BananaMemberDAO;
import com.banana.dao.dongneDAO;
import com.banana.vo.BananaMemberVO;
import com.banana.vo.ReviewVO;
import com.banana.vo.dongneSubjectVO;
import com.banana.vo.dongneVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;



@Service("dongneService")
public class DongneServiceImpl implements BananaService{

	@Autowired
	private dongneDAO dongneDAO;
	
	@Autowired
	private BananaMemberDAO bananaMemberDAO;
	
	public String mypageUpdateProc(Object vo) {
		String result = "";
		
		BananaMemberVO bvo = (BananaMemberVO) vo;
		if(bvo.getFile1().getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			bvo.setMfile(bvo.getFile1().getOriginalFilename());
			bvo.setMsfile(uuid+"_"+bvo.getFile1().getOriginalFilename());
		}
		
		boolean update_result = bananaMemberDAO.memberUpdate(bvo);
		if(update_result) {
			File file = new File(bvo.getSavepath()+bvo.getMsfile());
			try {
				bvo.getFile1().transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			result = "redirect:/mypage_update.do?mid="+bvo.getMid();
		} else {
			result = "errorPage";
		}
		return result;
	}
	
	public ModelAndView getMemberInfoUpdate(String mid) {
		ModelAndView mv = new ModelAndView();
		
		BananaMemberVO vo = bananaMemberDAO.getMember(mid);
		mv.addObject("vo",vo);
		mv.setViewName("mypage/mypage_update");
		
		return mv;
	}
	
	public ModelAndView getMemberInfo(String mid) {
		ModelAndView mv = new ModelAndView();
		
		BananaMemberVO vo = bananaMemberDAO.getMember(mid);
		mv.addObject("vo",vo);
		mv.setViewName("mypage/mypage");
		
		return mv;
	}
	
	public String deleteSubjectProc(String bsid) {
		boolean result = dongneDAO.deleteSubjectProc(bsid);
		return String.valueOf(result);
	}
	
	public ModelAndView getSubjectListContent(String bsid) {
		ModelAndView mv = new ModelAndView();
		dongneSubjectVO vo = dongneDAO.getSubjectContent(bsid);
		mv.addObject("vo", vo);
		mv.setViewName("mypage/mypage_subjectContent");
		return mv;
	}
	
	public ModelAndView getSubjectList2() {
		ModelAndView mv = new ModelAndView();
		ArrayList<dongneSubjectVO> list = dongneDAO.getDongneSubject();
		mv.addObject("list", list);
		mv.setViewName("mypage/mypage_subjectList2");
		return mv;
	}
	
	public ModelAndView getSubjectList() {
		ModelAndView mv = new ModelAndView();
		ArrayList<dongneSubjectVO> list = dongneDAO.getDongneSubject();
		mv.addObject("list", list);
		mv.setViewName("mypage/mypage_subjectList");
		return mv;
	}
	
	public ModelAndView getSubjectListAdmin() {
		ModelAndView mv = new ModelAndView();
		ArrayList<dongneSubjectVO> list = dongneDAO.getDongneSubject();
		mv.addObject("list", list);
		mv.setViewName("admin/boardSubjectManage");
		return mv;
	}
	
	public String updateSubjectProc(Object vo) {
		String result = "";
		
		dongneSubjectVO dvo = (dongneSubjectVO) vo;
		if(dvo.getFile1().getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			dvo.setBsfile(dvo.getFile1().getOriginalFilename());
			dvo.setBssfile(uuid + "_" + dvo.getFile1().getOriginalFilename());
		}
		
		//DB연동
		boolean update_result = dongneDAO.updateSubjectProc(dvo);
		if(update_result) {
			File file = new File(dvo.getSavepath() + dvo.getBssfile());
			
			try {
				dvo.getFile1().transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			result = "redirect:/boardSubjectManage.do";
		} else {
			result = "errorPage";
		}
		
		return result;
	}

	public ModelAndView updateSubject(String bsid) {
		ModelAndView mv = new ModelAndView();
		dongneSubjectVO vo = dongneDAO.getSubjectContent(bsid);
		mv.addObject("vo", vo);
		mv.setViewName("/admin/boardSubjectManageUpdate");
		return mv;
	}
	
	public String writeSubject(Object vo) {
		String result = "";
		
		dongneSubjectVO dvo = (dongneSubjectVO) vo;
		if(dvo.getFile1().getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			dvo.setBsfile(dvo.getFile1().getOriginalFilename());
			dvo.setBssfile(uuid + "_" + dvo.getFile1().getOriginalFilename());
		}
		
		boolean dvo_result = dongneDAO.writeSubject(dvo);
		
		if(dvo_result) {
			File file = new File(dvo.getSavepath() + dvo.getBssfile());
			
			try {
				dvo.getFile1().transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			result = "redirect:/boardSubjectManage.do";
		}else {
			result = "errorPage";
		}
		
		return result;
	}
	
	public Object  insert(Object vo) {
		String result="";
		dongneVO dvo = (dongneVO)vo;
		ArrayList<String> file_list = new ArrayList<String>();
		ArrayList<String> sfile_list = new ArrayList<String>();
		
		UUID uuid = UUID.randomUUID();
		if(dvo.getList().get(0).getSize() != 0)  {
			 	
		       for (MultipartFile mf : dvo.getList()) {    	   
		           		           
		           file_list.add(mf.getOriginalFilename());
		           sfile_list.add(uuid+ "_"+ mf.getOriginalFilename());
 
		       }
		      
		       dvo.setBfile(String.join(",", file_list));
		       dvo.setBsfile(String.join(",", sfile_list));
		}
		
		
		int  dao_result = dongneDAO.insertBoard(dvo);
		if(dao_result != 0) {
			try {
				 for (MultipartFile mf : dvo.getList()) { 
					File file = new File(dvo.getSavepath()+ uuid+ "_"+ mf.getOriginalFilename());
					mf.transferTo(file);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			result= "redirect:/dongneLife.do";
		}else
			result ="errorPage";
		
		return result;
	}
	
	public Object  getList() {
		ModelAndView mv = new ModelAndView();
		ArrayList<dongneVO> list =dongneDAO.getBoardList();
		
		String str ="";
		for(dongneVO vo : list) {
			int date = Integer.parseInt(vo.getBdate());
			if(60>date) {
				str = date +"분";
			}else if(1440 > date && date>60) {
				str = date/60 +"시간";
			}else if (1440<date) {
				str= date/60/60 + "일";
			}else if(date ==0) {
				str="방금";
			}
				
			vo.setBdate(str);
		}
		
		
		mv.addObject("list",list);
		mv.setViewName("/dongneLife/dongneLife");
		
		return mv;
	}
	
	
	
	public Object getContent(Object bid) {
		ModelAndView mv = new ModelAndView();
		dongneVO vo = dongneDAO.getBoardContent((String)bid);
		if(vo.getBsfile() != null) {
			String[] sfile_list =vo.getBsfile().split(",");
	
			mv.addObject("sfile_list", sfile_list);
		}
		
		String str ="";	
		int date = Integer.parseInt(vo.getBdate());
			if(60>date) {
				str = date +"분";
			}else if(1440 > date && date>60) {
				str = date/60 +"시간";
			}else if (1440<date) {
				str= date/60/60 + "일";
			}else if(date ==0) {
				str="방금";
			}
				
			vo.setBdate(str);
		
		
		mv.addObject("vo", vo);
		mv.setViewName("/dongneLife/dongneLife_content");
		return mv;
	}
	
	public Object getUpdateContent(Object bid) {
		ModelAndView mv = new ModelAndView();
		dongneVO vo = dongneDAO.getBoardContent((String)bid);
		int count =0;
		if(vo.getBfile() != null) {
			String[] sfile_list =vo.getBsfile().split(",");
			for(int i=0; i<sfile_list.length; i++) {
				count++;
			}
		}
		mv.addObject("count", count);	
		mv.addObject("vo", vo);
		mv.setViewName("/dongneLife/dongneLife_update");
		return mv;
	}
	
	
	public Object  update(Object vo) {
		
		
		ModelAndView mv = new ModelAndView();
		int dao_result =0;
		ArrayList<String> file_list = new ArrayList<String>();
		ArrayList<String> sfile_list = new ArrayList<String>();
		dongneVO dvo = (dongneVO)vo;
		
		UUID uuid = UUID.randomUUID();
		
		if(dvo.getList().get(0).getSize() != 0) {
		
		       for (MultipartFile mf : dvo.getList()) {    	   
		    	   
		    		 file_list.add(mf.getOriginalFilename());
		    		 sfile_list.add(uuid+ "_"+ mf.getOriginalFilename());
		    	  
	          }
		      
		       dvo.setBfile(String.join(",", file_list));
		       dvo.setBsfile(String.join(",", sfile_list));
		       
		      dao_result = dongneDAO.boardUpdate((dongneVO)vo);
		       
		       if(dao_result !=0) {
		       try {
					 for (MultipartFile mf : dvo.getList()) { 									    		   
							 File file = new File(dvo.getSavepath()+ uuid+ "_"+ mf.getOriginalFilename());
							 mf.transferTo(file);		    	   				
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
		       }		       
		}else if(dvo.getCancel_img().equals("cancel")) {
			 dvo.setBfile("");
		     dvo.setBsfile("");
		     dao_result = dongneDAO.boardUpdate((dongneVO)vo);
		}else {
			dao_result = dongneDAO.boardUpdate((dongneVO)vo);
		
		}
			
		
		
		if(dao_result !=0) {			
			mv.setViewName("redirect:/dongneLife.do");
		}
		
		return mv;
	}
	public Object delete(Object bid) {
		int result = dongneDAO.boardDelete((String)bid);
		String str="";
		if(result!=0) {
			str="redirect:/dongneLife.do";
		}
		return str;
	}
	
	public ModelAndView getMyPost(String mid) {
		ModelAndView mv = new ModelAndView();
		ArrayList<dongneVO> list = dongneDAO.getMyPost(mid);
		ArrayList<dongneVO> clist = dongneDAO.getMyComment(mid);
		
		mv.addObject("list", list);
		mv.addObject("clist", clist);
		mv.setViewName("mypage/mypage_mypost");
		return mv;
		
	}
	
}
