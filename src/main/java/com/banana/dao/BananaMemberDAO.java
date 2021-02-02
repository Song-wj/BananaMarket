package com.banana.dao;

import java.util.ArrayList;

import com.banana.vo.BananaMemberVO;
import com.banana.vo.SessionVO;

public class BananaMemberDAO extends DBConn{
	
	public ArrayList<BananaMemberVO> getMemberList() {
		ArrayList<BananaMemberVO> list = new ArrayList<BananaMemberVO>();
		
		try {
			String sql = "select mid, nickname, ph, maddr, mdate from banana_member order by mdate";
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BananaMemberVO vo = new BananaMemberVO();
				vo.setMid(rs.getString(1));
				vo.setNickname(rs.getString(2));
				vo.setPh(rs.getString(3));
				vo.setMaddr(rs.getString(4));
				vo.setMdate(rs.getString(5));
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int getLoginChk(String id, String pass) {
		int result = 0;
		
		try {
			String sql = "select count(*) from banana_member where mid=? and pw=?";
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
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
	 * 닉네임 중복체크
	 */
	public int getNickCheck(String nick) {
		int result = 0;
		
		try {
			String sql = "select count(*) from banana_member where nickname=?";
			getPreparedStatement(sql);
			pstmt.setString(1, nick);
			rs = pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
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
	
	/**
	 * 	프로필 불러오기 (마이페이지 - 프로필 수정)
	 */
	public BananaMemberVO MemberContent(String mid) {
		BananaMemberVO  vo = new BananaMemberVO();
		
		try {
			String sql = "select mid, nickname, pw, ph, maddr_num, maddr, mfile, msfile "
							+ " from banana_member where mid=?";
			getPreparedStatement(sql);
			
			pstmt.setString(1, mid);		
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo.setMid(rs.getString(1));
				vo.setNickname(rs.getString(2));
				vo.setPw(rs.getString(3));
				vo.setPh(rs.getString(4));
				vo.setMaddr_num(rs.getString(5));
				vo.setMaddr(rs.getString(6));
				vo.setMfile(rs.getString(7));
				vo.setMsfile(rs.getString(8));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	/**
	 * 	프로필 수정
	 */
	public boolean UpdateMember(BananaMemberVO vo) {
		boolean result = false;
		
		try {
			String sql = "update set banana_member pw=?, ph=?, maddr_num=?, maddr=?, mfile=?, msfile=? where mid=?";
			getPreparedStatement(sql);
			
			pstmt.setString(1,vo.getPw());
			pstmt.setString(2,vo.getPh());
			pstmt.setString(3,vo.getMaddr_num());
			pstmt.setString(4,vo.getMaddr());
			pstmt.setString(5,vo.getMfile());
			pstmt.setString(6,vo.getMsfile());
			pstmt.setString(7,vo.getMid());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public boolean getUpdateNofile(BananaMemberVO vo) {
		boolean result = false;
		try {
		
			String sql ="update set banana_member pw=?, ph=?, maddr_num=?, maddr=? where mid=?";
			getPreparedStatement(sql);
			
			pstmt.setString(1,vo.getPw());
			pstmt.setString(2,vo.getPh());
			pstmt.setString(3,vo.getMaddr_num());
			pstmt.setString(4,vo.getMaddr());
			pstmt.setString(5,vo.getMid());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
}
