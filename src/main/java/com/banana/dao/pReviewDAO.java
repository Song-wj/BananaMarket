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
}
