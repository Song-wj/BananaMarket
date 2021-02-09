package com.banana.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.banana.vo.ChatContentVO;
import com.banana.vo.ChatVO;

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
	public ChatContentVO getContent(String cid) {
		
		return sqlSession.selectOne(namespace+".ChatContent", cid);
	}	
}
