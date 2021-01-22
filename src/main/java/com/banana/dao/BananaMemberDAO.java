package com.banana.dao;

import com.banana.vo.BananaMemberVO;

public class BananaMemberDAO extends DBConn{
	
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
