package com.banana.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.banana.vo.LikeVO;
import com.banana.vo.dongneVO;

public class dongneDAO extends DBConn{

	// 동네생활 글쓰기
	public boolean insertBoard(dongneVO vo) {
		boolean result = false;
		try {
			String sql ="insert into banana_board values('b_'||SQE_BANANA_BOARD.NEXTVAL, ?,?,?,?,?,sysdate )";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getBtitle());
			pstmt.setString(3, vo.getBfile());
			pstmt.setString(4, vo.getBsfile());
			pstmt.setString(5, vo.getBtopic());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// board 리스트 불러오기
	public ArrayList<dongneVO> getBoardList(){
		ArrayList<dongneVO> list = new ArrayList<dongneVO>();
		try {
			String sql = "select bid, nickname, btitle, bfile,bsfile,btopic,maddr, bdate\r\n"
						+ "from banana_member m , banana_board b\r\n"
						+ "where m.mid = b.mid order by bdate desc";
			getStatement();
			rs= stmt.executeQuery(sql);
			while(rs.next()) {
				dongneVO vo = new dongneVO();
				vo.setBid(rs.getString(1));
				vo.setNickname(rs.getString(2));
				vo.setBtitle(rs.getString(3));
				vo.setBfile(rs.getString(4));
				vo.setBsfile(rs.getString(5));
				vo.setBtopic(rs.getString(6));
				vo.setMaddr(rs.getString(7));
				vo.setBdate(rs.getString(8));
				
				list.add(vo);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	// board content 
	public dongneVO getBoardContent(String bid) {
		dongneVO vo = new dongneVO();
		try {
			String sql ="select  bid ,nickname, btitle, bfile,bsfile,btopic, maddr, bdate \r\n"
						+ "from banana_member m , banana_board b\r\n"
						+ "where m.mid = b.mid and bid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, bid);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo.setBid(rs.getString(1));
				vo.setNickname(rs.getString(2));
				vo.setBtitle(rs.getString(3));
				vo.setBfile(rs.getString(4));
				vo.setBsfile(rs.getString(5));
				vo.setBtopic(rs.getString(6));
				vo.setMaddr(rs.getString(7));
				vo.setBdate(rs.getString(8));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	//board update
	
	public boolean boardU(dongneVO vo) {
		boolean result = false;
		try {
			String sql = "update banana_board set btitle=? , btopic=?, bfile=? , bsfile=? where bid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBtopic());
			pstmt.setString(3, vo.getBfile());
			pstmt.setString(4, vo.getBsfile());
			pstmt.setString(5, vo.getBid());
			
			
			int val = pstmt.executeUpdate();
			if(val != 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	/*
	 * public boolean boardUpdate(dongneVO vo) { boolean result = false; try {
	 * String sql
	 * ="update banana_board set btitle=?, btopic=?, bfile=?, bsfile=? where bid=?";
	 * 
	 * getPreparedStatement(sql); pstmt.setString(1,vo.getBtitle());
	 * pstmt.setString(2,vo.getBtopic()); pstmt.setString(3,vo.getBfile());
	 * pstmt.setString(4,vo.getBsfile()); pstmt.setString(5,vo.getBid());
	 * System.out.println(sql);
	 * 
	 * int count = pstmt.executeUpdate(); System.out.println(count); if(count != 0)
	 * result = true;
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return result; }
	 */
	public boolean boardUpdateNofile(dongneVO vo) {
		boolean result = false;
		try {
		
			String sql ="update banana_board set btopic=?, btitle=? where bid=?";
			getPreparedStatement(sql);
			pstmt.setString(1,vo.getBtopic());
			pstmt.setString(2,vo.getBtitle());
			pstmt.setString(3,vo.getBid());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	// board delete
	public boolean boardDelete(String bid) {
		boolean result = false;
		try {
			String sql="delete from banana_board where bid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, bid);
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
	public boolean getPickContent(String mid,String bid) {
		boolean result = false;
		
		try {
			String sql = "insert into BANANA_INTEREST values(?,'',?)";
			getPreparedStatement(sql);
			pstmt.setString(1,mid);
			pstmt.setString(2,bid);
			
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
	public boolean getDeleteContent(String mid, String bid) {
		boolean result = false;
		
		try {
			String sql = "delete from BANANA_INTEREST where mid=? and bid=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, bid);
			
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
	public ArrayList<dongneVO> getLikelist(String mid){
		ArrayList<dongneVO> list = new ArrayList<dongneVO>();
		try {
			String sql = "select b.btitle, m.nickname, m.maddr, b.btopic, b.bfile, b.bsfile ,b.bid"
					+ " from banana_board b, banana_interest i, banana_member m "
					+ " where i.mid=m.mid and i.bid=b.bid and i.mid=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dongneVO vo = new dongneVO();
				
				vo.setBtitle(rs.getString(1));
				vo.setNickname(rs.getString(2));
				vo.setMaddr(rs.getString(3));
				vo.setBtopic(rs.getString(4));
				vo.setBfile(rs.getString(5));
				vo.setBsfile(rs.getString(6));
				vo.setBid(rs.getString(7));
				
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
	public int likeResult(String mid, String bid) {
		int result = 0;
		
		try {
			String sql ="select count(*) from BANANA_INTEREST where mid=? and pid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, bid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
