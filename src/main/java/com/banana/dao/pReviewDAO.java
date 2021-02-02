package com.banana.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.banana.vo.ReviewVO;

public class pReviewDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private static String namespace ="mapper.preview";
	
	// 리뷰 등록
	public int reviewInsert(ReviewVO vo) {	
		
		if(vo.getParam().equals("구매자리뷰")) {
			return sqlSession.insert(namespace+".buyreviewinsert" , vo);
		}else {
			return sqlSession.insert(namespace+".sellreviewinsert" , vo);
		}
	}
	// 리스트 불러오기
	public ArrayList<ReviewVO> getReviewList(){
		List<ReviewVO> list =sqlSession.selectList(namespace+".getlist");
		return (ArrayList<ReviewVO>)list ; 
	}
	// 판매자 리뷰
	public ArrayList<ReviewVO> getSellReviewList(){
		List<ReviewVO> list =sqlSession.selectList(namespace+".getselllist");
		return (ArrayList<ReviewVO>)list ; 
	}
	// 구매자 리뷰
	public ArrayList<ReviewVO> getBuyReviewList(){
		List<ReviewVO> list =sqlSession.selectList(namespace+".getbuylist");
		return (ArrayList<ReviewVO>)list ; 
	}
	// 내가 쓴 리뷰
	public ArrayList<ReviewVO> getMyReviewList(String mid){
		List<ReviewVO> list =sqlSession.selectList(namespace+".getmyreviewlist" , mid);
		return (ArrayList<ReviewVO>)list ; 
	}
	// 리뷰 수정 페이지
	public ReviewVO getMyReview(String rid) {
		return sqlSession.selectOne(namespace+".getmyreview" , rid);
		
	}
	// 리뷰 수정
	public int updateBuyMyReview(ReviewVO vo) {
		return sqlSession.update(namespace+".updatebuymyreview" , vo);
	}
	public int updateSellMyReview(ReviewVO vo) {
		return sqlSession.update(namespace+".updatesellmyreview" , vo);
	}
	
	// 리뷰 삭제
	public int deleteBuyMyReview(String rid) {
		return sqlSession.delete(namespace+".deletebuymyreview" , rid);
	}
	public int deleteSellMyReview(String rid) {
		return sqlSession.delete(namespace+".deletesellmyreview" , rid);
	}
	
	
	//매너점수 불러오기
	public ArrayList<ReviewVO> getGradeList(String mid){
		List<ReviewVO> list =sqlSession.selectList(namespace + ".gradelist" , mid);
		return (ArrayList<ReviewVO>)list;
	}
	
	
}
