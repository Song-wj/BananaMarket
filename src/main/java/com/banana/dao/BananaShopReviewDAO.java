package com.banana.dao;

import java.util.ArrayList;

import com.banana.vo.BananaShopReviewVO;

public class BananaShopReviewDAO extends DBConn {
	
	/**
	 * srid로 sid 구하기
	 * @param vo
	 * @return
	 */
	public String getSid(BananaShopReviewVO vo) {
		String sid = "";
		
		try {
			String sql ="select sid from banana_shop_review where srid=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getSrid());
				
			rs=pstmt.executeQuery();
			if(rs.next()) {
				sid = (rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return sid;
	}
	
	/**
	 * sid로 sname 구하기
	 * @param vo
	 * @return
	 */
	public String getSname(String sid) {
		String sname = "";
		
		try {
			String sql ="select sname from banana_shop where sid=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, sid);
				
			rs=pstmt.executeQuery();
			if(rs.next()) {
				sname = (rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return sname;
	}
	
	/**
	 * Delete - 업체리뷰 삭제
	 * @param srid
	 * @return
	 */
	public boolean shopReviewDelete(String srid) {
		boolean result = false;
		try {
			String sql="delete from banana_shop_review where srid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, srid);
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
	public boolean shopReviewUpdate(BananaShopReviewVO vo) {
		boolean result = false;
		try {
			String sql ="UPDATE BANANA_SHOP_REVIEW SET SRCONTENT=?\r\n" + 
					"WHERE SRID=?";
			getPreparedStatement(sql);
			
			pstmt.setString(1,vo.getSrcontent());
			pstmt.setString(2,vo.getSrid());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
				
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return result;
	}
	
	/**
	 * Select - 업체리뷰 상세 정보
	 * @param srid
	 * @return
	 */
	public BananaShopReviewVO getShopReviewDetail(String srid) {
		BananaShopReviewVO vo = new BananaShopReviewVO();
		try {
			String sql ="select *\r\n" + 
					"from (select mem.mid, mem.nickname, mem.maddr, mem.msfile, rev.srid, rev.sid, shop.sname\r\n" + 
					"from banana_member mem, banana_shop_review rev, banana_shop shop\r\n" + 
					"where mem.mid = rev.mid and rev.sid = shop.sid)\r\n" + 
					"where srid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, srid);
				
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo.setMid(rs.getString(1));
				vo.setNickname(rs.getString(2));
				vo.setMaddr(rs.getString(3));
				vo.setMsfile(rs.getString(4));
				vo.setSrid(rs.getString(5));
				vo.setSid(rs.getString(6));
				vo.setSname(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return vo;
	}
	
	/**
	 * Select - 업체리뷰 상세 정보
	 * @param srid
	 * @return
	 */
	public BananaShopReviewVO getShopReviewContent(String srid) {
		BananaShopReviewVO vo = new BananaShopReviewVO();
		try {
			String sql ="select srid, sid , mid, srcontent, srdate\r\n"
						+ "from banana_shop_review where srid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, srid);
				
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo.setSrid(rs.getString(1));
				vo.setSid(rs.getString(2));
				vo.setMid(rs.getString(3));
				vo.setSrcontent(rs.getString(4));
				vo.setSrdate(rs.getString(5));
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
	public int getShopReviewCount(String sid) {
		int count = 0;
		
		try {
			String sql ="select count(*) from banana_shop_review where sid=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, sid);
				
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
	 * List - 특정 업체리뷰 목록 불러오기
	 * @return
	 */
	public ArrayList<BananaShopReviewVO> getShopReviewList(String sid){
		ArrayList<BananaShopReviewVO> list = new ArrayList<BananaShopReviewVO>();
		try {
			String sql = "select *\r\n" + 
					"from (select mem.mid, mem.nickname, mem.maddr, mem.msfile, rev.srid, rev.sid, rev.srdate, shop.sname, rev.srcontent\r\n" + 
					"from banana_member mem, banana_shop_review rev, banana_shop shop\r\n" + 
					"where mem.mid = rev.mid and rev.sid = shop.sid\r\n" + 
					"order by rev.srdate desc)\r\n" + 
					"where sid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, sid);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BananaShopReviewVO vo = new BananaShopReviewVO();
				vo.setMid(rs.getString(1));
				vo.setNickname(rs.getString(2));
				vo.setMaddr(rs.getString(3));
				vo.setMsfile(rs.getString(4));
				vo.setSrid(rs.getString(5));
				vo.setSid(rs.getString(6));
				vo.setSrdate(rs.getString(7));
				vo.setSname(rs.getString(8));
				vo.setSrcontent(rs.getString(9));
					
				list.add(vo);
					
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return list;
	}	
	
	/**
	 * List - 업체리뷰 목록 불러오기
	 * @return
	 */
	public ArrayList<BananaShopReviewVO> getShopReviewList(){
		ArrayList<BananaShopReviewVO> list = new ArrayList<BananaShopReviewVO>();
		try {
			String sql = "select srid, sid, mid, srcontent, srdate\r\n"
						+ "from banana_shop_review order by srdate desc";
			getStatement();
			rs= stmt.executeQuery(sql);
			while(rs.next()) {
				BananaShopReviewVO vo = new BananaShopReviewVO();
				vo.setSrid(rs.getString(1));
				vo.setSid(rs.getString(2));
				vo.setMid(rs.getString(3));
				vo.setSrcontent(rs.getString(4));
				vo.setSrdate(rs.getString(5));
					
				list.add(vo);
					
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return list;
	}	
	
	/**
	 * Insert - 업체리뷰 등록
	 * @param vo
	 * @return
	 */
	public boolean insertShopReview(BananaShopReviewVO vo) {
		boolean result = false;
		try {
			String sql ="insert into banana_shop_review "
					+ " values('sr_'||SQE_BANANA_SHOP_REVIEW.NEXTVAL,?,?,?,sysdate)";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getSid());
			pstmt.setString(2, vo.getMid());
			pstmt.setString(3, vo.getSrcontent());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
