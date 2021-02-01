package com.banana.dao;

import java.util.ArrayList;

import com.banana.vo.DongneCommentVO;

public class DongneCommentDAO extends DBConn{
	
	/**
	 * brid로 bid 구하기
	 * @param vo
	 * @return
	 */
	public String getBid(DongneCommentVO vo) {
		String bid = "";
		
		try {
			String sql ="select bid from banana_board_review where brid=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getBrid());
				
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bid = (rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return bid;
	}
	
	/**
	 * Select - 특정 댓글 카운트
	 * @param sid
	 * @return
	 */
	public int getCommentCount(String bid) {
		int count = 0;
		
		try {
			String sql ="select count(*) from banana_board_review where bid=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, bid);
				
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count = Integer.parseInt(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return count;
	}
	
	/**
	 * Delete - 업체리뷰 삭제
	 * @param brid
	 * @return
	 */
	public boolean dongneCommentDelete(String brid) {
		boolean result = false;
		try {
			String sql="delete from banana_board_review where brid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, brid);
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * Update - 업체리뷰 수정
	 * @param vo
	 * @return
	 */
	public boolean dongneCommentUpdate(DongneCommentVO vo) {
		boolean result = false;
		try {
			String sql ="UPDATE BANANA_BOARD_REVIEW SET BCOMMENT=?\r\n" + 
					"WHERE BRID=?";
			getPreparedStatement(sql);
			
			pstmt.setString(1,vo.getBcomment());
			pstmt.setString(2,vo.getBrid());
			
			int count = pstmt.executeUpdate();
			
			if(count != 0) result = true;
				
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return result;
	}
	
	/**
	 * Select - 업체리뷰 상세 정보
	 * @param brid
	 * @return
	 */
	public DongneCommentVO getDongneCommentContent(String brid) {
		DongneCommentVO vo = new DongneCommentVO();
		try {
			String sql ="select brid, bid , mid, bcomment, brdate\r\n"
						+ "from banana_board_review where brid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, brid);
				
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo.setBrid(rs.getString(1));
				vo.setBid(rs.getString(2));
				vo.setMid(rs.getString(3));
				vo.setBcomment(rs.getString(4));
				vo.setBrdate(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return vo;
	}
	
	/**
	 * Select - 특정 업체리뷰 count
	 * @param sid
	 * @return
	 */
	public int getDongneCommentCount(String bid) {
		int count = 0;
		
		try {
			String sql ="select count(*) from banana_board_review where bid=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, bid);
				
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count = Integer.parseInt(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return count;
	}
	
	/**
	 * List - 특정 게시판 댓글 목록 불러오기
	 * @return
	 */
	public ArrayList<DongneCommentVO> getDongneCommentList(String bid){
		ArrayList<DongneCommentVO> list = new ArrayList<DongneCommentVO>();
		try {
			String sql = "select mid, nickname, maddr, msfile, brid, bid, bcomment, brdate, rownum rno\r\n" + 
					"from (select mem.mid, mem.nickname, mem.maddr, mem.msfile, rev.brid, rev.bid, rev.bcomment, rev.brdate\r\n" + 
					"from banana_member mem, banana_board_review rev, banana_board board\r\n" + 
					"where mem.mid = rev.mid and rev.bid = board.bid\r\n" + 
					"order by rev.brdate desc)\r\n" + 
					"where bid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, bid);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DongneCommentVO vo = new DongneCommentVO();
				
				vo.setMid(rs.getString(1));
				vo.setNickname(rs.getString(2));
				vo.setMaddr(rs.getString(3));
				vo.setMsfile(rs.getString(4));
				vo.setBrid(rs.getString(5));
				vo.setBid(rs.getString(6));
				vo.setBcomment(rs.getString(7));
				vo.setBrdate(rs.getString(8));
				vo.setRno(rs.getString(9));
				
				list.add(vo);
					
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return list;
	}	
	
	/**
	 * List - 게시판 댓글 목록 불러오기
	 * @return
	 */
	public ArrayList<DongneCommentVO> getDongneCommentList(){
		ArrayList<DongneCommentVO> list = new ArrayList<DongneCommentVO>();
		try {
			String sql = "select brid, bid, mid, bcomment, brdate\r\n"
						+ "from banana_board_review order by brdate desc";
			getStatement();
			rs= stmt.executeQuery(sql);
			while(rs.next()) {
				DongneCommentVO vo = new DongneCommentVO();
				vo.setBrid(rs.getString(1));
				vo.setBid(rs.getString(2));
				vo.setMid(rs.getString(3));
				vo.setBcomment(rs.getString(4));
				vo.setBrdate(rs.getString(5));
					
				list.add(vo);
					
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return list;
	}	
	
	/**
	 * Insert - 게시판 댓글 등록
	 * @param vo
	 * @return
	 */
	public boolean insertDongneComment(DongneCommentVO vo) {
		boolean result = false;
		try {
			String sql ="insert into banana_board_review "
					+ " values('br_'||SQE_BANANA_BOARD_REVIEW.NEXTVAL,?,?,?,sysdate)";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getBid());
			pstmt.setString(2, vo.getMid());
			pstmt.setString(3, vo.getBcomment());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
