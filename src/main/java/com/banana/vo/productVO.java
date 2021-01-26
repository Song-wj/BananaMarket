package com.banana.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class productVO {
	String pid, mid, ptitle, pcategory , pprice, pcontent, plike, pchat, pdate, pchk;
	String pfile, psfile, savepath, pimg1, psimg1, pimg2, psimg2, pimg3, psimg3, pimg4, psimg4, pimg5, psimg5;
	CommonsMultipartFile[] file_list;

	
	public String getPimg1() {
		return pimg1;
	}

	public void setPimg1(String pimg1) {
		this.pimg1 = pimg1;
	}

	public String getPsimg1() {
		return psimg1;
	}

	public void setPsimg1(String psimg1) {
		this.psimg1 = psimg1;
	}

	public String getPimg2() {
		return pimg2;
	}

	public void setPimg2(String pimg2) {
		this.pimg2 = pimg2;
	}

	public String getPsimg2() {
		return psimg2;
	}

	public void setPsimg2(String psimg2) {
		this.psimg2 = psimg2;
	}

	public String getPimg3() {
		return pimg3;
	}

	public void setPimg3(String pimg3) {
		this.pimg3 = pimg3;
	}

	public String getPsimg3() {
		return psimg3;
	}

	public void setPsimg3(String psimg3) {
		this.psimg3 = psimg3;
	}

	public String getPimg4() {
		return pimg4;
	}

	public void setPimg4(String pimg4) {
		this.pimg4 = pimg4;
	}

	public String getPsimg4() {
		return psimg4;
	}

	public void setPsimg4(String psimg4) {
		this.psimg4 = psimg4;
	}

	public String getPimg5() {
		return pimg5;
	}

	public void setPimg5(String pimg5) {
		this.pimg5 = pimg5;
	}

	public String getPsimg5() {
		return psimg5;
	}

	public void setPsimg5(String psimg5) {
		this.psimg5 = psimg5;
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

	public CommonsMultipartFile[] getFile_list() {
		return file_list;
	}

	public void setFile_list(CommonsMultipartFile[] file_list) {
		this.file_list = file_list;
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
