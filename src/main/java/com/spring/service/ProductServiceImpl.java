package com.spring.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.productDAO;
import com.banana.vo.LikeVO;
import com.banana.vo.SessionVO;
import com.banana.vo.productVO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private productDAO productDAO;
	
	public Object insert(Object vo) {
		String result="";
		int dao_result = 0;
		productVO pvo = (productVO)vo;
		
		ArrayList<String> file_list = new ArrayList<String>();
		ArrayList<String> pfile_list = new ArrayList<String>();
		
		UUID uuid = UUID.randomUUID();
		if(pvo.getList().get(0).getSize() != 0)  {
			 	
		       for (MultipartFile mf : pvo.getList()) {    	   
		           file_list.add(mf.getOriginalFilename());
		           pfile_list.add(uuid+ "_"+ mf.getOriginalFilename());
		       }
		       
		       pvo.setPfile(String.join(",", file_list));
		       pvo.setPsfile(String.join(",", pfile_list));
		}
		dao_result = productDAO.getInsert(pvo);
		if(dao_result != 0) {
			try {
				 for (MultipartFile mf : pvo.getList()) { 
					File file = new File(pvo.getSavepath()+ uuid+ "_"+ mf.getOriginalFilename());
					mf.transferTo(file);
				 }
			} catch (Exception e) { 	e.printStackTrace(); }
			result= "redirect:/popularProduct.do";
		}else
			result ="errorPage";
		
		return result;
		/*UUID uuid = UUID.randomUUID(); 
			//System.out.println(pvo.getFile_list().length);
			for(CommonsMultipartFile file : pvo.getFile_list()) {
				//System.out.println(file.getOriginalFilename());
				if(pvo.getFile_list().length != 0 ) {
					pvo.setPfile(file.getOriginalFilename());
					pvo.setPsfile(uuid+"_"+file.getOriginalFilename());
				}	
				//DB저장 
				boolean dao_result = productDAO.getInsert(pvo);
				if(dao_result){
					//서버저장 --> upload 폴더에 저장(폴더위치)
					File file1 = new File(pvo.getSavepath()+pvo.getPsfile());
					try {	
						file.transferTo(file1);
					}catch (Exception e) {	e.printStackTrace();	}
					result= "redirect:/popularProduct.do";
				}else 
					result ="errorPage";
			}return result; */
		} 
	
	
	 public Object getList() {
		  ModelAndView mv = new ModelAndView();
		  ArrayList<productVO> list = productDAO.getProductList();
			mv.addObject("list", list);
			mv.setViewName("/popularProduct/popularProduct");
			return mv;
	  }

	 public Object getSellList() {
		  ModelAndView mv = new ModelAndView();
		  ArrayList<productVO> list = productDAO.getProductList();
		  
			mv.addObject("list", list);
			mv.setViewName("/mypage/mypage_contract");
			return mv;
	  }
	 
	 public Object getContent(Object pid, String mid) {
		ModelAndView mv = new ModelAndView();
		
		int result = productDAO.likeResult(mid, (String)pid);
		mv.addObject("result",result);
		productVO vo = productDAO.getProductContent((String)pid);
			if(vo.getPsfile() != null) {
				String[] pfile_list =vo.getPsfile().split(",");
		
				mv.addObject("pfile_list", pfile_list);
			}
			/*
			String str ="";	
			int date = Integer.parseInt(vo.getPdate());
				if(60>date) {
					str = date +"분";
				}else if(1440 > date && date>60) {
					str = date/60 +"시간";
				}else if (1440<date) {
					str= date/60/60 + "일";
				}else if(date ==0) {
					str="방금";
				}
				vo.setPdate(str);
			*/
				mv.addObject("vo", vo);
				mv.setViewName("/popularProduct/productContent");
			
			return mv;
	 }
	 
	 
	 public Object getUpdateContent(Object pid) {
		 ModelAndView mv = new ModelAndView();
			productVO vo = productDAO.getProductContent((String)pid);
			int count = 0;
			if(vo.getPfile() != null) {
				String[] pfile_list =vo.getPsfile().split(",");
				for(int i=0; i<pfile_list.length; i++) {
					count++;
				}
			}
			mv.addObject("count", count);	
			mv.addObject("vo", vo);
			mv.setViewName("/popularProduct/updatePage");
			return mv;
	  }
	 
	 public Object update(Object vo) {
		 	ModelAndView mv = new ModelAndView();
			int  result = 0;
			ArrayList<String> file_list = new ArrayList<String>();
			ArrayList<String> pfile_list = new ArrayList<String>();
			productVO pvo = (productVO)vo;
			
			UUID uuid = UUID.randomUUID();
			if(pvo.getList().get(0).getSize() != 0) {
			       for (MultipartFile mf : pvo.getList()) {    	   
			    		 file_list.add(mf.getOriginalFilename());
			    		 pfile_list.add(uuid+ "_"+ mf.getOriginalFilename());
			       }
			       pvo.setPfile(String.join(",", file_list));
			       pvo.setPsfile(String.join(",", pfile_list));
			       
			       result = productDAO.getProductUpdate((productVO)vo);
			       
			       if(result != 0 ) {
				       try {
							 for (MultipartFile mf : pvo.getList()) { 									    		   
									 File file = new File(pvo.getSavepath()+ uuid+ "_"+ mf.getOriginalFilename());
									 mf.transferTo(file);		    	   				
							 }
						} catch (Exception e) {	e.printStackTrace();	}
			       }		       
			}else if(pvo.getCancel_file().equals("cancel")) {
				pvo.setPfile(null);
				pvo.setPsfile(null);
		        result = productDAO.getProductUpdate((productVO)vo);
			}
			/*else {
				result = productDAO.getUpdateNofile((productVO)vo);
			}*/
				if(result != 0) {			
					mv.setViewName("redirect:mypage.do");
				}else {
					mv.setViewName("errorPage");
				}
			
			return mv;	
		}
	 
	 public Object sellUpdate(Object pid) {
		 ModelAndView mv = new ModelAndView();
		 int result = 0;
		 result = productDAO.getSellUpdate((String)pid);
		 
		 if(result != 0 ){
				mv.setViewName("redirect:/mypage.do");
			}else{
				mv.setViewName("errorPage");
			}
		 
		 return mv;
	 }
	 
	 public Object delete(Object pid) {
		 int result = 0;
		 result = productDAO.getProductDelete((String)pid);
			String str="";
			if(result != 0) {
				//str="/popularProduct/deletePage";
				str="/mypage/mypage";
			}
			return str;
		}
	 
	 
	 /** 좋아요 **/
	 public ModelAndView product_like(String mid, String pid) {
		 ModelAndView mv = new ModelAndView();
		 boolean result = productDAO.getPickContent(mid,pid); 
			
			if(result) {
				//좋아요 버튼 잘 반영
				ArrayList<LikeVO> list = productDAO.getLikelist(mid); 
				//list객체의 데이터를 JSON 객체로 변환작업 필요 ---> JSON 라이브러리 존재(gson)
				JsonArray jarray = new JsonArray();
				JsonObject jdata = new JsonObject();
				Gson gson = new Gson();
				
				for(LikeVO vo : list){
					JsonObject jobj = new JsonObject();
					jobj.addProperty("ptitle", vo.getPtitle()); 
					jobj.addProperty("maddr", vo.getMaddr());
					jobj.addProperty("pprice", vo.getPprice());
					jobj.addProperty("pfile", vo.getPfile());
					jobj.addProperty("psfile", vo.getPsfile());
					jobj.addProperty("mid", vo.getMid());
					jobj.addProperty("pid", vo.getPid());
					
					jarray.add(jobj);
				}
				jdata.add("jlist", jarray);		//java객체
				
				mv.setViewName(gson.toJson(jdata));
				
			}
			return mv;
	 }
	 
	 /** 좋아요 취소 **/
	 public ModelAndView product_unlike(String mid, String pid) {
		 ModelAndView mv = new ModelAndView();
		 boolean result = productDAO.getDeleteContent(mid,pid); 
			
			if(result) {
				//좋아요 버튼 잘 반영
				ArrayList<LikeVO> list = productDAO.getLikelist(mid); 
				//list객체의 데이터를 JSON 객체로 변환작업 필요 ---> JSON 라이브러리 존재(gson)
				JsonArray jarray = new JsonArray();
				JsonObject jdata = new JsonObject();
				Gson gson = new Gson();
				
				for(LikeVO vo : list){
					JsonObject jobj = new JsonObject();
					jobj.addProperty("ptitle", vo.getPtitle()); 
					jobj.addProperty("maddr", vo.getMaddr());
					jobj.addProperty("pprice", vo.getPprice());
					jobj.addProperty("pfile", vo.getPfile());
					jobj.addProperty("psfile", vo.getPsfile());
					jobj.addProperty("mid", vo.getMid());
					jobj.addProperty("pid", vo.getPid());
					
					jarray.add(jobj);
				}
				jdata.add("jlist", jarray);		//java객체
				
				mv.setViewName(gson.toJson(jdata));
				
			}
			return mv;
	 }
	 
		
		
		 
	 
		 
}
