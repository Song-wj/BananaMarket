package com.enroll.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.banana.dao.BananaShopDAO;
import com.banana.dao.BananaShopReviewDAO;
import com.banana.vo.BananaShopVO;

@Service("shopService")
public class EnrollstoreServiceImpl implements EnrollService {
	
	@Autowired
	private BananaShopDAO shopDAO;
	
	@Autowired
	private BananaShopReviewDAO shopReviewDAO;

	@Override
	public Object getList() {
		ModelAndView mv = new ModelAndView();
		ArrayList<BananaShopVO> list = shopDAO.getShopList();
		
		mv.addObject("list",list);
		mv.setViewName("/myNeighborhood/neighborhood");
		
		return mv;
	}

	@Override
	public Object insert(Object vo) {
		ModelAndView mv = new ModelAndView();

		UUID uuid = UUID.randomUUID();
		BananaShopVO svo = (BananaShopVO)vo;
		
		if(svo.getFile1().getSize() != 0) {
			svo.setSmain_img(svo.getFile1().getOriginalFilename());
			svo.setSmain_simg(uuid + "_" + svo.getFile1().getOriginalFilename());
		}
		
		ArrayList<String> file_list = new ArrayList<String>();
		ArrayList<String> sfile_list = new ArrayList<String>();
		if(svo.getFlie_list().size() != 0) {
			
			for(MultipartFile mf : svo.getFlie_list()) {
				file_list.add(mf.getOriginalFilename());
				sfile_list.add(uuid+ "_"+ mf.getOriginalFilename());
			}
			
			if(file_list.size() == 1) {
				
				svo.setScaro_img1(file_list.get(0));
				svo.setScaro_simg1(sfile_list.get(0));
				
			}else if(file_list.size() == 2) {
				
				svo.setScaro_img1(file_list.get(0));
				svo.setScaro_img2(file_list.get(1));
				svo.setScaro_simg1(sfile_list.get(0));
				svo.setScaro_simg2(sfile_list.get(1));
				
			}else if(file_list.size() == 3) {
				
				svo.setScaro_img1(file_list.get(0));
				svo.setScaro_img2(file_list.get(1));
				svo.setScaro_img3(file_list.get(2));
				
				svo.setScaro_simg1(sfile_list.get(0));
				svo.setScaro_simg2(sfile_list.get(1));
				svo.setScaro_simg3(sfile_list.get(2));
				
			}
			
		}
		
		boolean dao_result = shopDAO.insertShop(svo);
		
		if(dao_result) {
			File file = new File(svo.getSavepath1()+svo.getSmain_simg());
			try {
				svo.getFile1().transferTo(file);
				
				for (MultipartFile mf : svo.getFlie_list()) { 
					File file2 = new File(svo.getSavepath1()+ uuid+ "_"+ mf.getOriginalFilename());
					mf.transferTo(file2);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			mv.setViewName("redirect:/neighborhood.do");
		}else
			mv.setViewName("errorPage");
		
		return mv;
	}

	@Override
	public Object getContent(Object sid) {
		ModelAndView mv = new ModelAndView();
		BananaShopVO svo = shopDAO.getShopContent((String)sid);
		svo.getSintro().replace("\r\n", "<br>");
		int review_count = shopReviewDAO.getShopReviewCount((String)sid);
		
		mv.addObject("review_count", review_count);
		mv.addObject("vo", svo);
		mv.setViewName("/myNeighborhood/neighborhoodStore");
		
		return mv;
	}

	@Override
	public Object update(Object vo) {
		ModelAndView mv = new ModelAndView();
		boolean result2 = false;
		boolean result3 = false;
		boolean result4 = false;
		boolean result5 = false;

		BananaShopVO svo = (BananaShopVO)vo;
		UUID uuid = UUID.randomUUID();	
		
		if(svo.getFile1().getSize() != 0) {
			//메인 이미지 수정사항 있을 때 
			
			//메인 이미지 수정사항 있을 때 + 광고이미지 수정사항 있을 때
			ArrayList<String> file_list = new ArrayList<String>();
			ArrayList<String> sfile_list = new ArrayList<String>();
			if(svo.getFlie_list().size() != 0) {
				//1.
				svo.setSmain_img(svo.getFile1().getOriginalFilename());
				svo.setSmain_simg(uuid + "_" + svo.getFile1().getOriginalFilename());
				
				result2 = shopDAO.shopUpdate(svo);
				
				if(result2) {
					File file = new File(svo.getSavepath1()+svo.getSmain_simg());
					try {
						svo.getFile1().transferTo(file);
					}catch (Exception e) {
						e.printStackTrace();
					}
				}
				
				//2.
				for(MultipartFile mf : svo.getFlie_list()) {
					file_list.add(mf.getOriginalFilename());
					sfile_list.add(uuid+ "_"+ mf.getOriginalFilename());
				}
				
				if(file_list.size() == 1) {
					
					svo.setScaro_img1(file_list.get(0));
					svo.setScaro_simg1(sfile_list.get(0));
					
				}else if(file_list.size() == 2) {
					
					svo.setScaro_img1(file_list.get(0));
					svo.setScaro_img2(file_list.get(1));
					svo.setScaro_simg1(sfile_list.get(0));
					svo.setScaro_simg2(sfile_list.get(1));
					
				}else if(file_list.size() == 3) {
					
					svo.setScaro_img1(file_list.get(0));
					svo.setScaro_img2(file_list.get(1));
					svo.setScaro_img3(file_list.get(2));
					
					svo.setScaro_simg1(sfile_list.get(0));
					svo.setScaro_simg2(sfile_list.get(1));
					svo.setScaro_simg3(sfile_list.get(2));
					
				}
				
				if(!svo.getScaro_img1().equals("")) {
					result2 = shopDAO.shopUpdateCaro(svo);
					if(result2) {
						try {
							for (MultipartFile mf : svo.getFlie_list()) { 
								File file2 = new File(svo.getSavepath1()+ uuid+ "_"+ mf.getOriginalFilename());
								mf.transferTo(file2);
							}
						}catch (Exception e) {
							e.printStackTrace();
						}
					}
				}else {
					//메인 이미지 수정사항 있을 때 + 광고이미지 수정사항 없을 때
					svo.setSmain_img(svo.getFile1().getOriginalFilename());
					svo.setSmain_simg(uuid + "_" + svo.getFile1().getOriginalFilename());
					
					result3 = shopDAO.shopUpdate(svo);
					
					if(result3) {
						File file = new File(svo.getSavepath1()+svo.getSmain_simg());
						try {
						}catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
			
		}else if(svo.getFile1().getSize() == 0) {
			//메인 이미지 수정사항 없을 때
			
			ArrayList<String> file_list = new ArrayList<String>();
			ArrayList<String> sfile_list = new ArrayList<String>();
				
			if(svo.getFlie_list().size() != 0) {
				//메인 이미지 수정사항 없을 때 + 광고이미지 수정사항 있을 때
				//1.
				result5 = shopDAO.shopUpdateNofile(svo);
				
				//2.
				for(MultipartFile mf : svo.getFlie_list()) {
					file_list.add(mf.getOriginalFilename());
					sfile_list.add(uuid+ "_"+ mf.getOriginalFilename());
				}
				
				if(file_list.size() == 1) {
					
					svo.setScaro_img1(file_list.get(0));
					svo.setScaro_simg1(sfile_list.get(0));
					
				}else if(file_list.size() == 2) {
					
					svo.setScaro_img1(file_list.get(0));
					svo.setScaro_img2(file_list.get(1));
					svo.setScaro_simg1(sfile_list.get(0));
					svo.setScaro_simg2(sfile_list.get(1));
					
				}else if(file_list.size() == 3) {
					
					svo.setScaro_img1(file_list.get(0));
					svo.setScaro_img2(file_list.get(1));
					svo.setScaro_img3(file_list.get(2));
					
					svo.setScaro_simg1(sfile_list.get(0));
					svo.setScaro_simg2(sfile_list.get(1));
					svo.setScaro_simg3(sfile_list.get(2));
					
				}
				
				if(!svo.getScaro_img1().equals("")) {
					result4 = shopDAO.shopUpdateCaro(svo);
					if(result4) {
						try {
							for (MultipartFile mf : svo.getFlie_list()) { 
								File file2 = new File(svo.getSavepath1()+ uuid+ "_"+ mf.getOriginalFilename());
								mf.transferTo(file2);
							}
						}catch (Exception e) {
							e.printStackTrace();
						}
					}
				}else {
					//메인 이미지 수정사항 없을 때 + 광고이미지 수정사항 없을 때
					result5 = shopDAO.shopUpdateNofile(svo);
				}
			}
		}
		
		if(result2 || result3 || result4 || result5) {
			mv.setViewName("redirect:/neighborhood.do");
		}else
			mv.setViewName("errorPage");
		
		return mv;
	}

	@Override
	public Object getUpdateContent(Object sid) {
		ModelAndView mv = new ModelAndView();
		BananaShopVO svo = shopDAO.getShopContent((String)sid);
		
		mv.addObject("vo", svo);
		mv.addObject("sid", sid);
		mv.setViewName("/enrollstore/updateStore");
		
		return mv;
	}

	@Override
	public Object delete(Object sid) {
		boolean result = shopDAO.shopDelete((String)sid);
		
		String str="";
		if(result) {
			str="redirect:/neighborhood.do";
		}
		return str;
	}

	@Override
	public Object getSelectList(String sid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getCommentListAjaxProc(String bid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getUpdateContent(Object id, String rno) {
		// TODO Auto-generated method stub
		return null;
	}

}
