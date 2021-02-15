package com.banana.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class productVO {
	String pid, mid, ptitle, pcategory , pprice, pcontent, plike, pchat, pdate, pchk, buy_mid;
	String pfile, psfile, savepath;
	String maddr, nickname, score;
	String file, sfile, cancel_img;
	List<MultipartFile> list ;
	String rno;
	int phits;
	String msfile;
	
	
	
	//CommonsMultipartFile[] file_list;
	
	/*
	public CommonsMultipartFile[] getFile_list() {
		return file_list;
	}
	public void setFile_list(CommonsMultipartFile[] file_list) {
		this.file_list = file_list;
	}
	*/
	
	public String getMsfile() {
		return msfile;
	}

	public void setMsfile(String msfile) {
		this.msfile = msfile;
	}

	public int getPhits() {
		return phits;
	}

	public void setPhits(int phits) {
		this.phits = phits;
	}

	public String getMaddr() {
		return maddr;
	}

	public String getRno() {
		return rno;
	}

	public void setRno(String rno) {
		this.rno = rno;
	}

	public String getBuy_mid() {
		return buy_mid;
	}

	public void setBuy_mid(String buy_mid) {
		this.buy_mid = buy_mid;
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

	
	public String getCancel_img() {
		return cancel_img;
	}

	public void setCancel_img(String cancel_img) {
		this.cancel_img = cancel_img;
	}

	public List<MultipartFile> getList() {
		return list;
	}

	public void setList(List<MultipartFile> list) {
		this.list = list;
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

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getPfile() {
		return pfile;
	}

	public void setPfile(String pfile) {
		this.pfile = pfile;
	}

	public String getPsfile() {
		return psfile;
	}

	public void setPsfile(String psfile) {
		this.psfile = psfile;
	}

	public String getSavepath() {
		return savepath;
	}

	public void setSavepath(String savepath) {
		this.savepath = savepath;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPcategory() {
		return pcategory;
	}

	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}

	public String getPprice() {
		return pprice;
	}

	public void setPprice(String pprice) {
		this.pprice = pprice;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getPlike() {
		return plike;
	}

	public void setPlike(String plike) {
		this.plike = plike;
	}

	public String getPchat() {
		return pchat;
	}

	public void setPchat(String pchat) {
		this.pchat = pchat;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getPchk() {
		return pchk;
	}

	public void setPchk(String pchk) {
		this.pchk = pchk;
	}
	
	
}
