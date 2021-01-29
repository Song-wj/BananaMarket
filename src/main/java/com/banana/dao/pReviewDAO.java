package com.banana.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.banana.vo.ReviewVO;

public class pReviewDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private static String namespace ="mapper.preview";
	
	
	public int reviewInsert(ReviewVO vo) {	
		
		return sqlSession.insert(namespace+".insert" , vo);
	}
}
