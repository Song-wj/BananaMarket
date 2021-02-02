package com.banana.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.banana.vo.BananaMemberVO;
import com.banana.vo.SessionVO;

public class BananaMemberDAO extends DBConn{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.member";
	
	public ArrayList<BananaMemberVO> getMemberList() {
		List<BananaMemberVO> list = sqlSession.selectList(namespace+".memberlist");
		return (ArrayList<BananaMemberVO>)list;
	}
	
	public int getLoginChk(String mid, String pw) {
		Map<String,String> param = new HashMap<String, String>();
		param.put("mid", mid);
		param.put("pw", pw);
		return sqlSession.selectOne(namespace+".logincheck", param);
	}
	
	/**
	 * 로그인
	 */
	public SessionVO getLogin(BananaMemberVO vo) {
		return sqlSession.selectOne(namespace+".login", vo);
	}
	
	/**
	 * 닉네임 중복체크
	 */
	public int getNickCheck(String nickname) {
		return sqlSession.selectOne(namespace+".nickcheck", nickname);
	}
	
	/** 
	 * 아이디 중복체크
	 */
	public int getIdCheck(String mid) {
		return sqlSession.selectOne(namespace+".idcheck",mid);
	}
	
	/**
	 * 회원가입
	 */
	public boolean InsertMember(BananaMemberVO vo) {
		boolean result = false;
		int val = sqlSession.insert(namespace+".join", vo);
		if(val != 0) result = true;
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
