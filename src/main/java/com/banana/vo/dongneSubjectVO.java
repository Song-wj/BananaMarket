package com.banana.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class dongneSubjectVO {
	String bsid, bstitle, bstopic, bsfile, bssfile, savepath;
	CommonsMultipartFile file1;
	public String getBsid() {
		return bsid;
	}
	public void setBsid(String bsid) {
		this.bsid = bsid;
	}
	public String getBstitle() {
		return bstitle;
	}
	public void setBstitle(String bstitle) {
		this.bstitle = bstitle;
	}
	public String getBstopic() {
		return bstopic;
	}
	public void setBstopic(String bstopic) {
		this.bstopic = bstopic;
	}
	public String getBsfile() {
		return bsfile;
	}
	public void setBsfile(String bsfile) {
		this.bsfile = bsfile;
	}
	public String getBssfile() {
		return bssfile;
	}
	public void setBssfile(String bssfile) {
		this.bssfile = bssfile;
	}
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
	
	
}
