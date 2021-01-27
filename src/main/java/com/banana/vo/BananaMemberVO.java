package com.banana.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class BananaMemberVO {
	String mid, nickname, pw, ph, maddr_num, maddr, mfile, msfile, savepath, mdate;
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	String ph1, ph2, ph3, maddr1, maddr2;
	int score;
	CommonsMultipartFile file1;
	
	public String getSavepath() {
		return savepath;
	}
	public void setSavepath(String savepath) {
		this.savepath = savepath;
	}
	public CommonsMultipartFile getFile1() {
		return file1;
	}
	public void setFile1(CommonsMultipartFile file1) {
		this.file1 = file1;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPh() {
		String str = "";
		if(ph1 != null) {
			str = getPh1() + "-" + getPh2() + "-" + getPh3();
		} else {
			str = ph;
		}
		return str;
	}
	public void setPh(String ph) {
		this.ph = ph;
	}
	public String getMaddr_num() {
		return maddr_num;
	}
	public void setMaddr_num(String maddr_num) {
		this.maddr_num = maddr_num;
	}
	public String getMaddr() {
		String str = "";
		if(maddr1 != null) {
			str = getMaddr1() + "," + getMaddr2();
		} else {
			str = maddr;
		}
		
		return str;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public String getMfile() {
		return mfile;
	}
	public void setMfile(String mfile) {
		this.mfile = mfile;
	}
	public String getMsfile() {
		return msfile;
	}
	public void setMsfile(String msfile) {
		this.msfile = msfile;
	}
	public String getPh1() {
		return ph1;
	}
	public void setPh1(String ph1) {
		this.ph1 = ph1;
	}
	public String getPh2() {
		return ph2;
	}
	public void setPh2(String ph2) {
		this.ph2 = ph2;
	}
	public String getPh3() {
		return ph3;
	}
	public void setPh3(String ph3) {
		this.ph3 = ph3;
	}
	public String getMaddr1() {
		return maddr1;
	}
	public void setMaddr1(String maddr1) {
		this.maddr1 = maddr1;
	}
	public String getMaddr2() {
		return maddr2;
	}
	public void setMaddr2(String maddr2) {
		this.maddr2 = maddr2;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	
}
