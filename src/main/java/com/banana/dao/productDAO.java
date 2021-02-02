package com.banana.dao;



import java.sql.ResultSet;
import java.util.ArrayList;

import com.banana.vo.BuylistVO;
import com.banana.vo.LikeVO;
import com.banana.vo.productVO;

public class productDAO extends DBConn{
	
	/**
	 * Insert : 중고 물품 등록
	 */
	public boolean getInsert(productVO vo) {
		boolean result = false;
		
		try {
			String sql = "insert into banana_product values "
					+ "('p_'||sqe_banana_product.nextval,?,?,?,?,?,0,0,sysdate,?,?,?,?)";
			
			getPreparedStatement(sql);
			
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPtitle());
			pstmt.setString(3, vo.getPcategory());
			pstmt.setString(4, vo.getPprice());
			pstmt.setString(5, vo.getPcontent());
			pstmt.setString(6, vo.getPchk());
			pstmt.setString(7, vo.getPfile());
			pstmt.setString(8, vo.getPsfile());
			pstmt.setString(9, vo.getBuy_mid());
			
			int val = pstmt.executeUpdate();
			
			if(val != 0) result = true;			
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
		return result;
	}
	
	
	/**
	 *  중고 제품 리스트
	 */
	public ArrayList<productVO> getProductList(){
		ArrayList<productVO> list = new ArrayList<productVO>();
		try {
			String sql = "select pid, mid, ptitle, pcategory, pprice, pcontent, plike, pchat, to_char(pdate,'yyyy.mm.dd'), pchk, pfile, psfile, buy_mid "
						+ " from banana_product order by pdate desc ";
			getPreparedStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				productVO vo = new productVO();
				
				vo.setPid(rs.getString(1));
				vo.setMid(rs.getString(2));
				vo.setPtitle(rs.getString(3));
				vo.setPcategory(rs.getString(4));
				vo.setPprice(rs.getString(5));
				vo.setPcontent(rs.getString(6));
				vo.setPlike(rs.getString(7));
				vo.setPchat(rs.getString(8));
				vo.setPdate(rs.getString(9));
				vo.setPchk(rs.getString(10));
				vo.setPfile(rs.getString(11));
				vo.setPsfile(rs.getString(12));
				vo.setBuy_mid(rs.getString(13));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 *  판매내역 - 판매중 제품 리스트 
	 */
	public ArrayList<productVO> getProductSellList(){
		ArrayList<productVO> list = new ArrayList<productVO>();
		try {
			String sql = "select pid, mid, ptitle, pcategory, pprice, pcontent, plike, pchat, to_char(pdate,'yyyy.mm.dd'), pchk, pfile, psfile, buy_mid "
						+ " from banana_product where pchk='x' ";
			getPreparedStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				productVO vo = new productVO();
				
				vo.setPid(rs.getString(1));
				vo.setMid(rs.getString(2));
				vo.setPtitle(rs.getString(3));
				vo.setPcategory(rs.getString(4));
				vo.setPprice(rs.getString(5));
				vo.setPcontent(rs.getString(6));
				vo.setPlike(rs.getString(7));
				vo.setPchat(rs.getString(8));
				vo.setPdate(rs.getString(9));
				vo.setPchk(rs.getString(10));
				vo.setPfile(rs.getString(11));
				vo.setPsfile(rs.getString(12));
				vo.setBuy_mid(rs.getString(13));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	/**
	 *  중고제품 상세 보기
	 */
	public productVO getProductContent(String pid) {
		productVO vo = new productVO();
		try {
			String sql ="select p.pid, p.mid, p.ptitle, p.pcategory, p.pprice, p.pcontent, "
					+ "      p.plike, p.pchat, p.pdate, p.pfile, p.psfile, m.MADDR, m.NICKNAME, m.SCORE "
					+ " from banana_product p, banana_member m "
					+ " where p.pid = ?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, pid);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setPid(rs.getString(1));
				vo.setMid(rs.getString(2));
				vo.setPtitle(rs.getString(3));
				vo.setPcategory(rs.getString(4));
				vo.setPprice(rs.getString(5));
				vo.setPcontent(rs.getString(6));
				vo.setPlike(rs.getString(7));
				vo.setPchat(rs.getString(8));
				vo.setPdate(rs.getString(9));
				vo.setPfile(rs.getString(10));
				vo.setPsfile(rs.getString(11));
				vo.setMaddr(rs.getString(12));
				vo.setNickname(rs.getString(13));
				vo.setScore(rs.getString(14));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	/**
	 *  중고제품 수정
	 */
	public boolean getProductUpdate(productVO vo) {
		boolean result = false;
		
		try {
			String sql ="update banana_product set ptitle=?,pcategory=?,pprice=?, pcontent=?, pfile=? , psfile=? where pid=? ";
			getPreparedStatement(sql);
			
			pstmt.setString(1,vo.getPtitle());
			pstmt.setString(2,vo.getPcategory());
			pstmt.setString(3,vo.getPprice());
			pstmt.setString(4,vo.getPcontent());
			pstmt.setString(5,vo.getPfile());
			pstmt.setString(6,vo.getPsfile());
			pstmt.setString(7,vo.getPid());
			
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
	public boolean getPickContent(String mid,String pid) {
		boolean result = false;
		
		try {
			String sql = "insert into BANANA_INTEREST values(?,?,'','')";
			getPreparedStatement(sql);
			pstmt.setString(1,mid);
			pstmt.setString(2,pid);
			
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
	public boolean getDeleteContent(String mid, String pid) {
		boolean result = false;
		
		try {
			String sql = "delete from BANANA_INTEREST where mid=? and pid=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pid);
			
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
	public ArrayList<LikeVO> getLikelist(String mid){
		ArrayList<LikeVO> list = new ArrayList<LikeVO>();
		
		try {
			String sql = "select p.ptitle, m.maddr, p.pprice, p.pfile, p.psfile, p.pid"
					+ " from banana_product p, banana_interest i, banana_member m "
					+ " where i.mid=m.mid and i.pid=p.pid and i.mid=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				LikeVO vo = new LikeVO();
				
				vo.setPtitle(rs.getString(1));
				vo.setMaddr(rs.getString(2));
				vo.setPprice(rs.getString(3));
				vo.setPfile(rs.getString(4));
				vo.setPsfile(rs.getString(5));
				vo.setPid(rs.getString(6));
				
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
	public int likeResult(String mid, String pid) {
		int result = 0;
		
		try {
			String sql ="select count(*) from BANANA_INTEREST where mid=? and pid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	

	
	public boolean getUpdateNofile(productVO vo) {
		boolean result = false;
		try {
		
			String sql ="update banana_product set ptitle=?, pcategory=?, pprice=?, pcontent=?,  where pid=?";
			getPreparedStatement(sql);
			pstmt.setString(1,vo.getPtitle());
			pstmt.setString(2,vo.getPcategory());
			pstmt.setString(3,vo.getPprice());
			pstmt.setString(4,vo.getPcontent());
			pstmt.setString(5,vo.getPid());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	/**
	 *  중고 물품 삭제
	 */
	public boolean getProductDelete(String pid) {
		boolean result = false;
		try {
			String sql="delete from banana_product where pid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, pid);
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
