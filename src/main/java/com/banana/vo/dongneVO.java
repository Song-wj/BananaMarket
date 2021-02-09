package com.banana.vo;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public class dongneVO {

	String bid, nickname,mid, btitle, bfile, bsfile, btopic, blike, maddr, bdate ,savepath ,cancel_img;
	
	
	String file;
	String sfile;
	
	List<MultipartFile> list ;
	
	String rno;
	
	public String getRno() {
		return rno;
	}

	public void setRno(String rno) {
		this.rno = rno;
	}

	public String getCancel_img() {
		return cancel_img;
	}
	
	public void setCancel_img(String cancel_img) {
		this.cancel_img = cancel_img;
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

	public String getSavepath() {
		return savepath;
	}
	
	public void setSavepath(String savepath) {
		this.savepath = savepath;
	}

	public List<MultipartFile> getList() {
		return list;
	}

	public void setList(List<MultipartFile> list) {
		this.list = list;
	}

	

	public String getMaddr() {
		return maddr;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBfile() {
		return bfile;
	}

	public void setBfile(String bfile) {
		this.bfile = bfile;
	}

	public String getBsfile() {
		return bsfile;
	}

	public void setBsfile(String bsfile) {
		this.bsfile = bsfile;
	}

	public String getBtopic() {
		return btopic;
	}

	public void setBtopic(String btopic) {
		this.btopic = btopic;
	}

	public String getBlike() {
		return blike;
	}

	public void setBlike(String blike) {
		this.blike = blike;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	
}
