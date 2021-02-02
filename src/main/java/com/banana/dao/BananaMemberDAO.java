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
	
	public boolean memberUpdate(BananaMemberVO vo) {
		boolean result = false;
		int val = sqlSession.update(namespace+".memberUpdate", vo);
		if(val != 0) result = true;
		return result;
	}
	
	public BananaMemberVO getMember(String mid) {
		/*
		 * System.out.println(mid); return sqlSession.selectOne(namespace+".getmember",
		 * mid);
		 */
		BananaMemberVO vo = new BananaMemberVO();
		
		try {
			String sql = "select mid, nickname, substr(ph,1,3), substr(ph,5,4), substr(ph,10,4), "
					+ "maddr, msfile, score, mdate, pw, maddr_num from banana_member where mid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setMid(rs.getString(1));
				vo.setNickname(rs.getString(2));
				vo.setPh1(rs.getString(3));
				vo.setPh2(rs.getString(4));
				vo.setPh3(rs.getString(5));
				int idx = rs.getString(6).indexOf(",");
				String addr1 = rs.getString(6).substring(0,idx);
				String addr2 = rs.getString(6).substring(idx+1);
				vo.setMaddr1(addr1);
				vo.setMaddr2(addr2);
				vo.setMsfile(rs.getString(7));
				vo.setScore(rs.getInt(8));
				vo.setMdate(rs.getString(9));
				vo.setPw(rs.getString(10));
				vo.setMaddr_num(rs.getString(11));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
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
}
