package com.banana.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.banana.vo.ChatContentVO;
import com.banana.vo.ChatVO;
import com.banana.vo.productVO;

public class ChatDAO extends DBConn{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.chat";
	
	
	/**채팅 하기 **/
	public int getInsert(ChatVO vo) {
		return sqlSession.insert(namespace+".InsertChat", vo);
	}
	
	/** 채팅 리스트 **/
	public ArrayList<ChatVO> getChatList(){
		List <ChatVO> list = sqlSession.selectList(namespace+".ChatList");
		return (ArrayList<ChatVO>) list;
	}
	
	
	/** 채팅 content **/
	public productVO getContent2(String pid) {
		
		return sqlSession.selectOne(namespace+".ChatContent2", pid);
	}
	
	/** 채팅 content2 **/
	public ChatContentVO getContent(String cid) {
		return sqlSession.selectOne(namespace+".ChatContent", cid);
	}	
	
	public ArrayList<ChatContentVO> chat(String pid) {
		List <ChatContentVO> list =  sqlSession.selectList(namespace+".Chat", pid);
		return (ArrayList<ChatContentVO>) list;
	}
}
