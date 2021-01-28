package com.banana.dao;

import java.util.ArrayList;

import com.banana.vo.BananaShopReviewVO;

public class BananaShopReviewDAO extends DBConn {
	
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
			String sql = "select srid, sid, mid, srcontent, srdate\r\n"
						+ "from banana_shop_review where sid=? order by srdate desc";
			getPreparedStatement(sql);
			pstmt.setString(1, sid);
			
			rs=pstmt.executeQuery();
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
