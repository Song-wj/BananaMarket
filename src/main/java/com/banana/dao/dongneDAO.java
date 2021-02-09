package com.banana.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.banana.vo.BananaReviewAlarmVO;
import com.banana.vo.DongneCommentVO;
import com.banana.vo.dongneSubjectVO;
import com.banana.vo.dongneVO;
import com.banana.vo.productVO;

public class dongneDAO extends DBConn{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.dongne";
	
	/*
	public ArrayList<BananaReviewAlarmVO> getReviewContent(String mid) {
		List<BananaReviewAlarmVO> list = sqlSession.selectList(namespace+".getReviewContent", mid);
		return (ArrayList<BananaReviewAlarmVO>)list;
	}
	*/
	
	public boolean deleteReviewAlarmProc(String brid) {
		boolean result = false;
		int val = sqlSession.delete(namespace+".deleteReviewAlarm", brid);
		if(val != 0) result = true;
		return result;
	}
	
	public ArrayList<BananaReviewAlarmVO> getReviewContent(String mid) {
		ArrayList<BananaReviewAlarmVO> list = new ArrayList<BananaReviewAlarmVO>();
		
		try {
			String sql ="select DISTINCT bbr.btopic, bbr.mid, bbr.bcomment, ra.brid, ra.ra_date, bbr.bid "
					+ "from (select b.bid, b.btopic, br.mid, br.bcomment, br.brid "
					+ "      from banana_board b, banana_board_review br "
					+ "      where b.bid = br.bid and b.mid = ?) bbr, banana_review_alarm ra "
					+ "where bbr.bid=ra.bid and bbr.brid = ra.brid and ra.mid != ?"
					+ "order by ra.ra_date desc";
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BananaReviewAlarmVO vo = new BananaReviewAlarmVO();
				vo.setBtopic(rs.getString(1));
				vo.setMid(rs.getString(2));
				vo.setBcomment(rs.getString(3));
				vo.setBrid(rs.getString(4));
				vo.setRa_date(rs.getString(5));
				vo.setBid(rs.getString(6));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int getAlarmCount(String mid) {
		return sqlSession.selectOne(namespace+".getAlarmCount", mid);
	}
	
	public boolean reviewAlarmWrite(BananaReviewAlarmVO vo) {
		boolean result = false;
		int val = sqlSession.insert(namespace+".reviewAlarmWrite", vo);
		if(val != 0) result = true;
		return result;
	}
	
	public boolean deleteSubjectProc(String bsid) {
		boolean result = false;
		int val = sqlSession.delete(namespace+".deleteSubject", bsid);
		if(val != 0) result = true;
		return result;
	}
	
	public boolean updateSubjectProc(dongneSubjectVO vo) {
		boolean result = false;
		int val = sqlSession.update(namespace+".updateSubject",vo);
		if(val != 0) result = true;
		return result;
	}
	
	public dongneSubjectVO getSubjectContent(String bsid) {
		return sqlSession.selectOne(namespace+".getDongneSubjectContent", bsid);
	}
	
	public ArrayList<dongneVO> getSubjectList(String btitle) {
		List<dongneVO> list =sqlSession.selectList(namespace+".getDongneSubjectlist", btitle);
		return (ArrayList<dongneVO>)list;
	}
	
	public ArrayList<dongneSubjectVO> getDongneSubject() {
		List<dongneSubjectVO> list = sqlSession.selectList(namespace+".getDongneSubject");
		return (ArrayList<dongneSubjectVO>)list;
	}

	public boolean writeSubject(dongneSubjectVO vo) {
		boolean result = false;
		int val = sqlSession.insert(namespace+".writesubject",vo);
		if(val != 0) result = true;
		return result;
	}
	
	
	// 동네생활 글쓰기
	public int insertBoard(dongneVO vo) {
		return sqlSession.insert(namespace+".insertboard" , vo);	
	}
	
	// board 리스트 불러오기
	public ArrayList<dongneVO> getBoardList(){	
		List<dongneVO> list = sqlSession.selectList(namespace+".boardlist" );
		return (ArrayList<dongneVO>)list;
	}
	// board content 
	public dongneVO getBoardContent(String bid) {
		return sqlSession.selectOne(namespace+".boardcontent" , bid);
		
	}
	//board update
	
	public int boardUpdate(dongneVO vo) {	
		return sqlSession.update(namespace+".boardupdate" ,vo);	
	}
	
	// board delete
	public int boardDelete(String bid) {
		return sqlSession.delete(namespace+".boarddelete" ,bid);
		
	}
	
	// 내 게시물 리스트
	public ArrayList<dongneVO> getMyPost(String mid){
		List<dongneVO> list = sqlSession.selectList(namespace+".getmypost" , mid);
		return (ArrayList<dongneVO>)list;
	}
	
	public ArrayList<DongneCommentVO> getMyComment(String mid){
		List<DongneCommentVO> list = sqlSession.selectList(namespace+".getmycomment" , mid);
		return (ArrayList<DongneCommentVO>)list;
	}
	
	/**
	 * 좋아요
	 */
	public boolean getPickContent(String mid,String bid) {
		boolean result = false;
		
		try {
			String sql = "insert into BANANA_INTEREST values(?,'',?,'')";
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
			String sql ="select count(*) from BANANA_INTEREST where mid=? and bid=?";
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
	
	/**
	 * 검색 목록
	 * @param search
	 * @return
	 */
	public ArrayList<dongneVO> getsearchlist(String search){
		ArrayList<dongneVO> list = new ArrayList<dongneVO>();
		String set_search = "%" + search + "%";
		
		try {
			String sql = "select *\r\n" + 
					"from (select *\r\n" + 
					"from (select rownum rno, b.bid, b.mid, b.btitle, b.btopic, b.bdate, m.nickname, m.maddr\r\n" + 
					"      from banana_board b, banana_member m\r\n" + 
					"      where b.mid = m.mid)\r\n" + 
					"where (btitle like ? or btopic like ? or nickname like ? or maddr like ?)\r\n" + 
					")";
			
			getPreparedStatement(sql);
			
			pstmt.setString(1, set_search);
			pstmt.setString(2, set_search);
			pstmt.setString(3, set_search);
			pstmt.setString(4, set_search);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dongneVO vo = new dongneVO();
				
				vo.setRno(rs.getString(1));
				vo.setBid(rs.getString(2));
				vo.setMid(rs.getString(3));
				vo.setBtitle(rs.getString(4));
				vo.setBtopic(rs.getString(5));
				vo.setBdate(rs.getString(6));
				vo.setNickname(rs.getString(7));
				vo.setMaddr(rs.getString(8));
				
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
					"from (select rownum rno, b.bid, b.mid, b.btitle, b.btopic, b.bdate, m.nickname, m.maddr\r\n" + 
					"      from banana_board b, banana_member m\r\n" + 
					"      where b.mid = m.mid)\r\n" + 
					"where (btitle like ? or btopic like ? or nickname like ? or maddr like ?)\r\n" + 
					")";
			
			getPreparedStatement(sql);
			
			pstmt.setString(1, set_search);
			pstmt.setString(2, set_search);
			pstmt.setString(3, set_search);
			pstmt.setString(4, set_search);
			
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
