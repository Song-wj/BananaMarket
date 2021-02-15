package com.banana.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.banana.vo.BananaShopAlarmVO;
import com.banana.vo.BananaShopReviewVO;

public class BananaShopReviewDAO extends DBConn {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.store";
	
	/*
	public boolean shopAlarmWrite(BananaShopAlarmVO vo) {
		boolean result = false;
		int val = sqlSession.insert(namespace+".shopAlarmWrite", vo);
		if(val != 0) result = true;
		return result;
	}
	*/
	
	public boolean shopAlarmWrite(BananaShopAlarmVO vo) {
		boolean result = false;
		
		try {
			String sql = "insert into banana_shop_alarm values(?,?,?,to_char(sysdate, 'YYYY-MM-DD AM HH12:MI'))";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getSid());
			pstmt.setString(3, vo.getSrid());
			int val = pstmt.executeUpdate();
			if(val != 0) result = true;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return result;
	}
	
	public String getShopId(String sid) {
		String srid = "";
		try {
			String sql ="select srid from banana_shop_review where sid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, sid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				srid = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return srid;
	}
	
	/**
	 * srid로 sid 구하기
	 * @param vo
	 * @return
	 */
	public String getSid(BananaShopReviewVO vo) {
		String sid = "";
		sid = sqlSession.selectOne(namespace2 + ".getSid", vo);
		return sid;
	}
	
	private static String namespace2 = "mapper.shop";
	
	/**
	 * sid로 sname 구하기
	 * @param vo
	 * @return
	 */
	public String getSname(String sid) {
		String sname = "";
		sname = sqlSession.selectOne(namespace2 + ".getSname", sid);
		return sname;
	}
	
	/**
	 * Delete - 업체리뷰 삭제
	 * @param srid
	 * @return
	 */
	public boolean shopReviewDelete(String srid) {
		boolean result = false;
		int val = sqlSession.delete(namespace2 + ".shopReviewDelete", srid);
		if (val != 0)
			result = true;
		return result;
	}
	
	
	/**
	 * Update - 업체리뷰 수정
	 * @param vo
	 * @return
	 */
	public boolean shopReviewUpdate(BananaShopReviewVO vo) {
		boolean result = false;
		int value = sqlSession.update(namespace2 + ".shopReviewUpdate", vo);
		if (value != 0)
			result = true;
		return result;
	}
	
	/**
	 * Select - 업체리뷰 상세 정보
	 * @param srid
	 * @return
	 */
	public BananaShopReviewVO getShopReviewDetail(String srid) {
		return sqlSession.selectOne(namespace2 + ".getShopReviewDetail", srid);
	}
	
	/**
	 * Select - 업체리뷰 상세 정보
	 * @param srid
	 * @return
	 */
	public BananaShopReviewVO getShopReviewContent(String srid) {
		return sqlSession.selectOne(namespace2 + ".getShopReviewContent", srid);
	}
	
	/**
	 * Select - 특정 업체리뷰 count
	 * @param sid
	 * @return
	 */
	public int getShopReviewCount(String sid) {
		int count = 0;
		count = sqlSession.selectOne(namespace2 + ".getShopReviewCount", sid);
		return count;
	}
	
	/**
	 * List - 특정 업체리뷰 목록 불러오기
	 * @return
	 */
	public ArrayList<BananaShopReviewVO> getShopReviewList(String sid){
		List<BananaShopReviewVO> list = sqlSession.selectList(namespace2+".getShopReviewList2", sid);
		return (ArrayList<BananaShopReviewVO>)list;
	}	
	
	/**
	 * List - 업체리뷰 목록 불러오기
	 * @return
	 */
	public ArrayList<BananaShopReviewVO> getShopReviewList(){
		List<BananaShopReviewVO> list = sqlSession.selectList(namespace2+".getShopReviewList");
		return (ArrayList<BananaShopReviewVO>)list;
	}	
	
	/**
	 * Insert - 업체리뷰 등록
	 * @param vo
	 * @return
	 */
	public boolean insertShopReview(BananaShopReviewVO vo) {
		boolean result = false;
		int value = sqlSession.insert(namespace2 + ".insertShopReview", vo);
		if (value != 0)
			result = true;
		return result;
	}

}
