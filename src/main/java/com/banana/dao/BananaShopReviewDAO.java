package com.banana.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.banana.vo.BananaShopReviewVO;

public class BananaShopReviewDAO extends DBConn {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.shop";
	
	/**
	 * srid로 sid 구하기
	 * @param vo
	 * @return
	 */
	public String getSid(BananaShopReviewVO vo) {
		String sid = "";
		sid = sqlSession.selectOne(namespace + ".getSid", vo);
		return sid;
	}
	
	/**
	 * sid로 sname 구하기
	 * @param vo
	 * @return
	 */
	public String getSname(String sid) {
		String sname = "";
		sname = sqlSession.selectOne(namespace + ".getSname", sid);
		return sname;
	}
	
	/**
	 * Delete - 업체리뷰 삭제
	 * @param srid
	 * @return
	 */
	public boolean shopReviewDelete(String srid) {
		boolean result = false;
		int val = sqlSession.delete(namespace + ".shopReviewDelete", srid);
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
		int value = sqlSession.update(namespace + ".shopReviewUpdate", vo);
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
		return sqlSession.selectOne(namespace + ".getShopReviewDetail", srid);
	}
	
	/**
	 * Select - 업체리뷰 상세 정보
	 * @param srid
	 * @return
	 */
	public BananaShopReviewVO getShopReviewContent(String srid) {
		return sqlSession.selectOne(namespace + ".getShopReviewContent", srid);
	}
	
	/**
	 * Select - 특정 업체리뷰 count
	 * @param sid
	 * @return
	 */
	public int getShopReviewCount(String sid) {
		int count = 0;
		count = sqlSession.selectOne(namespace + ".getShopReviewCount", sid);
		return count;
	}
	
	/**
	 * List - 특정 업체리뷰 목록 불러오기
	 * @return
	 */
	public ArrayList<BananaShopReviewVO> getShopReviewList(String sid){
		List<BananaShopReviewVO> list = sqlSession.selectList(namespace+".getShopReviewList2", sid);
		return (ArrayList<BananaShopReviewVO>)list;
	}	
	
	/**
	 * List - 업체리뷰 목록 불러오기
	 * @return
	 */
	public ArrayList<BananaShopReviewVO> getShopReviewList(){
		List<BananaShopReviewVO> list = sqlSession.selectList(namespace+".getShopReviewList");
		return (ArrayList<BananaShopReviewVO>)list;
	}	
	
	/**
	 * Insert - 업체리뷰 등록
	 * @param vo
	 * @return
	 */
	public boolean insertShopReview(BananaShopReviewVO vo) {
		boolean result = false;
		int value = sqlSession.insert(namespace + ".insertShopReview", vo);
		if (value != 0)
			result = true;
		return result;
	}

}
