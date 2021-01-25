package com.banana.dao;

import com.banana.vo.BananaMemberVO;
import com.banana.vo.SessionVO;

public class BananaMemberDAO extends DBConn{
	
	/**
	 * 로그인
	 */
	public SessionVO getLogin(BananaMemberVO vo) {
		SessionVO svo = new SessionVO();
		
		try {
			String sql = "select count(*), nickname from banana_member where mid=? and pw=? group by nickname";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPw());
			System.out.println(vo.getMid());
			System.out.println(vo.getPw());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				svo.setResult(rs.getInt(1));
				svo.setNickname(rs.getString(2));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return svo;
	}
	
	/** 
	 * 아이디 중복체크
	 */
	public int getIdCheck(String id) {
		int result = 0;
		
		try {
			String sql = "select count(*) from banana_member where mid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 회원가입
	 */
	public boolean InsertMember(BananaMemberVO vo) {
		boolean result = false;

		try {
			String sql = "insert into banana_member values(?,?,?,?,?,?,?,?,?,sysdate)";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickname());
			pstmt.setString(3, vo.getPw());
			pstmt.setString(4, vo.getPh());
			pstmt.setString(5, vo.getMaddr_num());
			pstmt.setString(6, vo.getMaddr());
			pstmt.setString(7, vo.getMfile());
			pstmt.setString(8, vo.getMsfile());
			pstmt.setInt(9, 36);
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
