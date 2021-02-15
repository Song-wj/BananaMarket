package com.banana.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class BananaShopVO {
	String sid, mid, sname, skinds, skinds2, sintro, saddr_num, saddr, sph, sdate;
	String addr2, addr3, hp1, hp2, hp3;
	String smain_img, smain_simg, 
		   scaro_img1, scaro_simg1, scaro_img2, scaro_simg2, scaro_img3, scaro_simg3;
	CommonsMultipartFile file1;
	List<MultipartFile> flie_list ;
	String rno, nickname, maddr;
	int like_count, review_count;
	String srid, srcontent, srdate;
	
	String savepath1;
	StringBuilder dong = new StringBuilder();
	
	public String getSrdate() {
		return srdate;
	}

	public void setSrdate(String srdate) {
		this.srdate = srdate;
	}

	public int getReview_count() {
		return review_count;
	}

	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}

	public String getSrid() {
		return srid;
	}

	public void setSrid(String srid) {
		this.srid = srid;
	}

	public String getSrcontent() {
		return srcontent;
	}

	public void setSrcontent(String srcontent) {
		this.srcontent = srcontent;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public String getRno() {
		return rno;
	}

	public void setRno(String rno) {
		this.rno = rno;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMaddr() {
		return maddr;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}

	public List<MultipartFile> getFlie_list() {
		return flie_list;
	}

	public void setFlie_list(List<MultipartFile> flie_list) {
		this.flie_list = flie_list;
	}

	public StringBuilder getDong() {
		return dong;
	}

	public void setDong(StringBuilder dong) {
		this.dong = dong;
	}

	public String getSavepath1() {
		return savepath1;
	}

	public void setSavepath1(String savepath1) {
		this.savepath1 = savepath1;
	}

	public CommonsMultipartFile getFile1() {
		return file1;
	}

	public void setFile1(CommonsMultipartFile file1) {
		this.file1 = file1;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSkinds() {
		return skinds;
	}

	public void setSkinds(String skinds) {
		this.skinds = skinds;
	}

	public String getSintro() {
		return sintro;
	}

	public void setSintro(String sintro) {
		this.sintro = sintro;
	}

	public String getSaddr_num() {
		return saddr_num;
	}

	public void setSaddr_num(String saddr_num) {
		this.saddr_num = saddr_num;
	}

	public String getSaddr() {
		String str="";
		if(addr2 != null) {
			str = addr2+"/"+addr3;
		}else {
			str = saddr;
		}
		return str;
	}

	public void setSaddr(String saddr) {
		this.saddr = saddr;
		
		String[] sadlist = saddr.split("/");
		setAddr2(sadlist[0]);
		setAddr3(sadlist[1]);
		
		if(sadlist[1].contains("(")) {
			if(sadlist[1].contains(",")) {
				for(int i=sadlist[1].indexOf("(")+1; i<sadlist[1].indexOf(",",sadlist[1].indexOf("(")+1); i++) {
					dong.append(Character.toString(sadlist[1].charAt(i)));
				}
			}else {
				if(sadlist[1].contains("µ¿")) {
					for(int i=sadlist[1].indexOf("(")+1; i<=sadlist[1].indexOf("µ¿",sadlist[1].indexOf("(")+1); i++) {
						dong.append(Character.toString(sadlist[1].charAt(i)));
					}
				}else {
					dong.append("-");
				}
			}
		}else {
			dong.append("-");
		}
		
	}

	public String getSph() {
		String str="";
		if(hp1 != null) {
			str = hp1+"-"+hp2+"-"+hp3;
		}else {
			str = sph;
		}
		return str;
	}

	public void setSph(String sph) {
		this.sph = sph;
		String[] slist = sph.split("-");
		setHp1(slist[0]);
		setHp2(slist[1]);
		setHp3(slist[2]);
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getSmain_img() {
		return smain_img;
	}

	public void setSmain_img(String smain_img) {
		this.smain_img = smain_img;
	}

	public String getSmain_simg() {
		return smain_simg;
	}

	public void setSmain_simg(String smain_simg) {
		this.smain_simg = smain_simg;
	}

	public String getScaro_img1() {
		return scaro_img1;
	}

	public void setScaro_img1(String scaro_img1) {
		this.scaro_img1 = scaro_img1;
	}

	public String getScaro_simg1() {
		return scaro_simg1;
	}

	public void setScaro_simg1(String scaro_simg1) {
		this.scaro_simg1 = scaro_simg1;
	}

	public String getScaro_img2() {
		return scaro_img2;
	}

	public void setScaro_img2(String scaro_img2) {
		this.scaro_img2 = scaro_img2;
	}

	public String getScaro_simg2() {
		return scaro_simg2;
	}

	public void setScaro_simg2(String scaro_simg2) {
		this.scaro_simg2 = scaro_simg2;
	}

	public String getScaro_img3() {
		return scaro_img3;
	}

	public void setScaro_img3(String scaro_img3) {
		this.scaro_img3 = scaro_img3;
	}

	public String getScaro_simg3() {
		return scaro_simg3;
	}

	public void setScaro_simg3(String scaro_simg3) {
		this.scaro_simg3 = scaro_simg3;
	}

	public String getSkinds2() {
		return skinds2;
	}

	public void setSkinds2(String skinds2) {
		this.skinds2 = skinds2;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public String getHp1() {
		return hp1;
	}

	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}

	public String getHp2() {
		return hp2;
	}

	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}

	public String getHp3() {
		return hp3;
	}

	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	
}
