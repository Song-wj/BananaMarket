package com.banana.vo;

public class ReviewVO {
	 String rid, mid, pid, review, rfile, rsfile, date ;
	 String score;
	 String param;
	
	 
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
	
	public String getscore() { 
		  return score;
    }
	public void setscore(String score) { 
		this.score = score; 
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	
}
