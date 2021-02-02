package com.banana.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.banana.vo.DongneCommentVO;
import com.banana.vo.dongneSubjectVO;
import com.banana.vo.dongneVO;

public class dongneDAO extends DBConn{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.dongne";
	
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
	
	public ArrayList<dongneVO> getSubjectList(String bstitle) {
		Map <String,String> param = new HashMap<String,String>();
		param.put("bstitle", bstitle);
		List<dongneVO> list =sqlSession.selectList(namespace+".getDongneSubjectlist", param);
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
}
