package com.banana.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.banana.vo.BananaShopVO;
import com.banana.vo.dongneVO;

public class BananaShopDAO extends DBConn {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.shop";
	
	/**
	 * Delete - 업체 삭제
	 * @param sid
	 * @return
	 */
	public boolean shopDelete(String sid) {
		boolean result = false;
		try {
			String sql="delete from banana_shop where sid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, sid);
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * Update - 업체 수정 : 메인 이미지 수정사항 없을 때 + 광고이미지 수정사항 없을 때
	 * @param vo
	 * @return
	 */
	public boolean shopUpdateNofile(BananaShopVO vo) {
		boolean result = false;
		try {
			String sql ="UPDATE BANANA_SHOP SET SNAME=?, SKINDS=?, SKINDS2=?, SINTRO=?, SADDR_NUM=?, SADDR=?, SPH=?\r\n" + 
					"WHERE SID=?";
			getPreparedStatement(sql);
			
			pstmt.setString(1,vo.getSname());
			pstmt.setString(2,vo.getSkinds());
			pstmt.setString(3,vo.getSkinds2());
			pstmt.setString(4,vo.getSintro());
			pstmt.setString(5,vo.getSaddr_num());
			pstmt.setString(6,vo.getSaddr());
			pstmt.setString(7,vo.getSph());
			pstmt.setString(8,vo.getSid());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
				
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return result;
	}
	
	/**
	 * Update - 업체 수정 
	 * 메인 이미지 수정사항 있을 때 + 광고이미지 수정사항 있을 때
	 * 메인 이미지 수정사항 없을 때 + 광고이미지 수정사항 있을 때
	 * @param vo
	 * @return
	 */
	public boolean shopUpdateCaro(BananaShopVO vo) {
		boolean result = false;
		try {
			String sql ="update banana_shop set scaro_img1=?, scaro_simg1=?, scaro_img2=?, scaro_simg2=?, scaro_img3=?, scaro_simg3=? where sid=?";
			getPreparedStatement(sql);
			
			if(vo.getScaro_img2() == null && vo.getScaro_img3() == null){
				//이미지 한개 (Scaro_img1)
				pstmt.setString(1, vo.getScaro_img1());
				pstmt.setString(2, vo.getScaro_simg1());
				pstmt.setString(3, "");
				pstmt.setString(4, "");
				pstmt.setString(5, "");
				pstmt.setString(6, "");
				pstmt.setString(7, vo.getSid());
			}else if(vo.getScaro_img2().length() != 0 && vo.getScaro_img3() == null) {
				//이미지 두개 (Scaro_img1, Scaro_img2)
				pstmt.setString(1, vo.getScaro_img1());
				pstmt.setString(2, vo.getScaro_simg1());
				pstmt.setString(3, vo.getScaro_img2());
				pstmt.setString(4, vo.getScaro_simg2());
				pstmt.setString(5, "");
				pstmt.setString(6, "");
				pstmt.setString(7, vo.getSid());
			}else if(vo.getScaro_img2().length() != 0 && vo.getScaro_img3().length() != 0) {
				//셋 다 있음 (Scaro_img1, Scaro_img2, Scaro_img3)
				pstmt.setString(1, vo.getScaro_img1());
				pstmt.setString(2, vo.getScaro_simg1());
				pstmt.setString(3, vo.getScaro_img2());
				pstmt.setString(4, vo.getScaro_simg2());
				pstmt.setString(5, vo.getScaro_img3());
				pstmt.setString(6, vo.getScaro_simg3());
				pstmt.setString(7, vo.getSid());
			}
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
				
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return result;
	}
	
	/**
	 * Update - 업체 수정 : 메인 이미지 수정사항 있을 때 + 광고이미지 수정사항 없을 때
	 * @param vo
	 * @return
	 */
	public boolean shopUpdate(BananaShopVO vo) {
		boolean result = false;
		try {
			String sql ="UPDATE BANANA_SHOP SET SNAME=?, SKINDS=?, SKINDS2=?, SINTRO=?, SADDR_NUM=?, SADDR=?, SPH=?, SMAIN_IMG=?, SMAIN_SIMG=?\r\n" + 
					"WHERE SID=?";
			getPreparedStatement(sql);
			
			pstmt.setString(1,vo.getSname());
			pstmt.setString(2,vo.getSkinds());
			pstmt.setString(3,vo.getSkinds2());
			pstmt.setString(4,vo.getSintro());
			pstmt.setString(5,vo.getSaddr_num());
			pstmt.setString(6,vo.getSaddr());
			pstmt.setString(7,vo.getSph());
			pstmt.setString(8,vo.getSmain_img());
			pstmt.setString(9,vo.getSmain_simg());
			pstmt.setString(10,vo.getSid());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
				
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return result;
	}
	
	/**
	 * Select - 업체 상세 정보
	 * @param sid
	 * @return
	 */
	public BananaShopVO getShopContent(String sid) {
		BananaShopVO vo = new BananaShopVO();
		try {
			String sql ="select  sid , mid, sname, skinds, skinds2, sintro, saddr_num, saddr, sph, sdate, smain_img, smain_simg,\r\n" + 
					"        scaro_img1, scaro_simg1, scaro_img2, scaro_simg2, scaro_img3, scaro_simg3\r\n" + 
					"from banana_shop where sid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, sid);
				
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo.setSid(rs.getString(1));
				vo.setMid(rs.getString(2));
				vo.setSname(rs.getString(3));
				vo.setSkinds(rs.getString(4));
				vo.setSkinds2(rs.getString(5));
				vo.setSintro(rs.getString(6));
				vo.setSaddr_num(rs.getString(7));
				vo.setSaddr(rs.getString(8));
				vo.setSph(rs.getString(9));
				vo.setSdate(rs.getString(10));
				vo.setSmain_img(rs.getString(11));
				vo.setSmain_simg(rs.getString(12));
				vo.setScaro_img1(rs.getString(13));
				vo.setScaro_simg1(rs.getString(14));
				vo.setScaro_img2(rs.getString(15));
				vo.setScaro_simg2(rs.getString(16));
				vo.setScaro_img3(rs.getString(17));
				vo.setScaro_simg3(rs.getString(18));
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return vo;
	}
	
	/**
	 * List - 업체 목록 불러오기 (좋아요 많은 순)
	 * @return
	 */
	public ArrayList<BananaShopVO> getLikeShopList(){
		List<BananaShopVO> list = sqlSession.selectList(namespace+".getshoplist");
		return (ArrayList<BananaShopVO>)list;
	}	
	
	/**
	 * List - 업체 목록 불러오기 (등록 최신 순)
	 * @return
	 */
	public ArrayList<BananaShopVO> getShopList(){
		List<BananaShopVO> list = sqlSession.selectList(namespace+".getshoplist2");
		return (ArrayList<BananaShopVO>)list;
	}	
	
	/**
	 * Insert - 업체 등록
	 * @param vo
	 * @return
	 */
	public boolean insertShop(BananaShopVO vo) {
		boolean result = false;
		try {
			String set_img = "";
			
			if(vo.getScaro_img2() == null && vo.getScaro_img3() == null){
				//이미지 한개 (Scaro_img1)
				set_img = ",?,?,null,null,null,null";
			}else if(vo.getScaro_img2().length() != 0 && vo.getScaro_img3() == null) {
				//이미지 두개 (Scaro_img1, Scaro_img2)
				set_img = ",?,?,?,?,null,null";
			}else if(vo.getScaro_img2().length() != 0 && vo.getScaro_img3().length() != 0) {
				//셋 다 있음 (Scaro_img1, Scaro_img2, Scaro_img3)
				set_img = ",?,?,?,?,?,?";
			}
			String sql ="insert into banana_shop "
					+ " values('shop_'||SQE_BANANA_BOARD.NEXTVAL,?,?,?,?,?,?,?,?,sysdate,?,?"+set_img+")";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getSname());
			pstmt.setString(3, vo.getSkinds());
			pstmt.setString(4, vo.getSkinds2());
			pstmt.setString(5, vo.getSintro());
			pstmt.setString(6, vo.getSaddr_num());
			pstmt.setString(7, vo.getSaddr());
			pstmt.setString(8, vo.getSph());
			pstmt.setString(9, vo.getSmain_img());
			pstmt.setString(10, vo.getSmain_simg());
			
			if(vo.getScaro_img2() == null && vo.getScaro_img3() == null){
				//이미지 한개 (Scaro_img1)
				pstmt.setString(11, vo.getScaro_img1());
				pstmt.setString(12, vo.getScaro_simg1());
			}else if(vo.getScaro_img2().length() != 0 && vo.getScaro_img3() == null) {
				//이미지 두개 (Scaro_img1, Scaro_img2)
				pstmt.setString(11, vo.getScaro_img1());
				pstmt.setString(12, vo.getScaro_simg1());
				pstmt.setString(13, vo.getScaro_img2());
				pstmt.setString(14, vo.getScaro_simg2());
			}else if(vo.getScaro_img2().length() != 0 && vo.getScaro_img3().length() != 0) {
				//셋 다 있음 (Scaro_img1, Scaro_img2, Scaro_img3)
				pstmt.setString(11, vo.getScaro_img1());
				pstmt.setString(12, vo.getScaro_simg1());
				pstmt.setString(13, vo.getScaro_img2());
				pstmt.setString(14, vo.getScaro_simg2());
				pstmt.setString(15, vo.getScaro_img3());
				pstmt.setString(16, vo.getScaro_simg3());
				
			}
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 좋아요
	 */
	public boolean getPickContent(String mid,String sid) {
		boolean result = false;
		
		try {
			String sql = "insert into BANANA_INTEREST values(?,'','',?)";
			getPreparedStatement(sql);
			pstmt.setString(1,mid);
			pstmt.setString(2,sid);
			
			int val = pstmt.executeUpdate();
			
			if(val != 0) {
				result = true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 좋아요 취소 
	 */
	public boolean getDeleteContent(String mid, String sid) {
		boolean result = false;
		
		try {
			String sql = "delete from BANANA_INTEREST where mid=? and sid=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, sid);
			
			int val = pstmt.executeUpdate();
			if(val != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 좋아요 목록
	 */
	public ArrayList<BananaShopVO> getLikelist(String mid){
		ArrayList<BananaShopVO> list = new ArrayList<BananaShopVO>();
		
		try {
			String sql = "select s.sname, s.skinds, s.saddr, s.sph, s.smain_img, s.smain_simg, m.mid, s.sid"
					+ " from banana_shop s, banana_interest i, banana_member m "
					+ " where i.mid=m.mid and i.sid=s.sid and i.mid=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				BananaShopVO vo = new BananaShopVO();
				
				vo.setSname(rs.getString(1));
				vo.setSkinds(rs.getString(2));
				vo.setSaddr(rs.getString(3));
				vo.setSph(rs.getString(4));
				vo.setSmain_img(rs.getString(5));
				vo.setSmain_simg(rs.getString(6));
				vo.setMid(rs.getString(7));
				vo.setSid(rs.getString(8));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * 좋아요 중복 체크
	 */
	public int likeResult(String mid, String sid) {
		int result = 0;
		
		try {
			String sql ="select count(*) from BANANA_INTEREST where mid=? and sid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, sid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 검색 목록
	 * @param search
	 * @return
	 */
	public ArrayList<BananaShopVO> getsearchlist(String search){
		ArrayList<BananaShopVO> list = new ArrayList<BananaShopVO>();
		String set_search = "%" + search + "%";
		
		try {
			String sql = "select *\r\n" + 
					"from (select *\r\n" + 
					"from (select rownum rno, s.sid, s.mid, s.sname, s.skinds, s.skinds2, s.sintro, s.saddr_num, s.saddr, s.sph, s.sdate, s.smain_simg, m.nickname, m.maddr\r\n" + 
					"      from banana_shop s, banana_member m\r\n" + 
					"      where s.mid = m.mid)\r\n" + 
					"where (sname like ? or skinds like ? or sintro like ? or saddr like ? or sph like ?)\r\n" + 
					")";
			
			getPreparedStatement(sql);
			
			pstmt.setString(1, set_search);
			pstmt.setString(2, set_search);
			pstmt.setString(3, set_search);
			pstmt.setString(4, set_search);
			pstmt.setString(5, set_search);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				BananaShopVO vo = new BananaShopVO();
				
				vo.setRno(rs.getString(1));
				vo.setSid(rs.getString(2));
				vo.setMid(rs.getString(3));
				vo.setSname(rs.getString(4));
				vo.setSkinds(rs.getString(5));
				vo.setSkinds2(rs.getString(6));
				vo.setSintro(rs.getString(7));
				vo.setSaddr_num(rs.getString(8));
				vo.setSaddr(rs.getString(9));
				vo.setSph(rs.getString(10));
				vo.setSdate(rs.getString(11));
				vo.setSmain_simg(rs.getString(12));
				vo.setNickname(rs.getString(13));
				vo.setMaddr(rs.getString(14));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * 검색 카운트
	 * @param search
	 * @return
	 */
	public int getsearchCount(String search){
		int result = 0;
		String set_search = "%" + search + "%";
		
		try {
			String sql = "select count(*)\r\n" + 
					"from (select *\r\n" + 
					"from (select rownum rno, s.sid, s.mid, s.sname, s.skinds, s.skinds2, s.sintro, s.saddr_num, s.saddr, s.sph, s.sdate, s.smain_simg, m.nickname, m.maddr\r\n" + 
					"      from banana_shop s, banana_member m\r\n" + 
					"      where s.mid = m.mid)\r\n" + 
					"where (sname like ? or skinds like ? or sintro like ? or saddr like ? or sph like ?)\r\n" + 
					")";
			
			getPreparedStatement(sql);
			
			pstmt.setString(1, set_search);
			pstmt.setString(2, set_search);
			pstmt.setString(3, set_search);
			pstmt.setString(4, set_search);
			pstmt.setString(5, set_search);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
