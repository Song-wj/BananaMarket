package com.banana.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
	 String rid, mid, pid, review, rfile, rsfile, rdate ,savepath , cancel_img ,nickname;
	String score;
	 String param;
	 String maddr;
	 String buy_mid;
	 
	 String file;
	 String sfile;
	 List<MultipartFile> list ;
		
	 
	 public String getNickname() {
		 return nickname;
	 }
	 public void setNickname(String nickname) {
		 this.nickname = nickname;
	 }
	 public String getBuy_mid() {
		return buy_mid;
	}
	public void setBuy_mid(String buy_mid) {
		this.buy_mid = buy_mid;
	}
	public String getCancel_img() {
		 return cancel_img;
	 }
	 public void setCancel_img(String cancel_img) {
		 this.cancel_img = cancel_img;
	 }
	 public String getSavepath() {
		 return savepath;
	 }
	 public void setSavepath(String savepath) {
		 this.savepath = savepath;
	 }
	 public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public List<MultipartFile> getList() {
		return list;
	}
	public void setList(List<MultipartFile> list) {
		this.list = list;
	}
	
	 public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getRfile() {
		return rfile;
	}
	public void setRfile(String rfile) {
		this.rfile = rfile;
	}
	public String getRsfile() {
		return rsfile;
	}
	public void setRsfile(String rsfile) {
		this.rsfile = rsfile;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	
	
}
