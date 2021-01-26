package com.banana.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.banana.vo.BananaFAQVO;
import com.banana.vo.BananaNoticeVO;

public class BananaNoticeDAO extends DBConn{
	/**
	 * Insert : 공지사항 글쓰기
	 */
	public boolean getInsert(BananaNoticeVO vo) {
		boolean result = false;
		try {
			String sql="insert into banana_notice "
					+ " values('n_'||SQE_BANANA_NOTICE.nextval,?,?,sysdate,0)";
			getPreparedStatement(sql);
			pstmt.setString(1,vo.getNtitle());
			pstmt.setString(2,vo.getNcontent());
			
			int val = pstmt.executeUpdate();
			
			if(val != 0) result = true;
			
		}catch (Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 전체 리스트 카운트
	 */
	public int getListCount() {
		int result = 0;
		
		try {
			String sql = "select count(*) from banana_notice";
			getPreparedStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 조회수
	 */
	
	public void getUpdateHits(String fid) {
		try {
			String sql = "update banana_notice set nhits = nhits+1 where nid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, fid);
			pstmt.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Select : 전체 리스트 출력
	 */
	public ArrayList<BananaNoticeVO> getList(int start, int end){
		ArrayList<BananaNoticeVO> list = new ArrayList<BananaNoticeVO>();
		
		try {
			String sql = "select * from (select rownum rno, nid, ntitle, ncontent, to_char(ndate,'yyyy.mm.dd'), nhits"
					+ " from (select * from banana_notice order by ndate desc))"
					+ " where rno between ? and ?";
			getPreparedStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				BananaNoticeVO vo = new BananaNoticeVO();
				vo.setRno(rs.getInt(1));
				vo.setNid(rs.getString(2));
				vo.setNtitle(rs.getString(3));
				vo.setNcontent(rs.getString(4));
				vo.setNdate(rs.getString(5));
				vo.setNhits(rs.getInt(6));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * Select : 전체 리스트 출력
	 */
   public ArrayList<BananaNoticeVO> getList(){
      ArrayList<BananaNoticeVO> list = new ArrayList<BananaNoticeVO>();
      
      try {
         String sql =  "select * from (select rownum rno, nid, ntitle, ncontent, to_char(ndate,'yyyy.mm.dd'), nhits"
					+ " from (select * from banana_notice order by ndate desc))";
         getPreparedStatement(sql);
         ResultSet rs = pstmt.executeQuery(sql);
         
         while(rs.next()){
        	 BananaNoticeVO vo = new BananaNoticeVO();
            vo.setRno(rs.getInt(1));
            vo.setNid(rs.getString(2));
            vo.setNtitle(rs.getString(3));
            vo.setNcontent(rs.getString(4));
            vo.setNdate(rs.getString(5));
            vo.setNhits(rs.getInt(6));
            
            list.add(vo);
         }
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      return list;
   }
   
   /**
	 * Select : 상세정보 출력
	 */
   public BananaNoticeVO getContent(String nid) {
	   BananaNoticeVO vo = new BananaNoticeVO();
	   
	   try {
		   String sql ="select nid, ntitle, ncontent,"
		   		+ " to_char(ndate,'yyyy.mm.dd'), nhits from banana_notice where nid =?";
		   getPreparedStatement(sql);
		   pstmt.setString(1, nid);
		
		   ResultSet rs = pstmt.executeQuery();
		
			while(rs.next()) {
				vo.setNid(rs.getString(1));
				vo.setNtitle(rs.getString(2));
				vo.setNcontent(rs.getString(3));
				vo.setNdate(rs.getString(4));
				vo.setNhits(rs.getInt(5));
			}
			
	   } catch (Exception e) {
		e.printStackTrace();;
	   }
	   
	   return vo;
   }

   	/**
	 * Update : 내용수정
	 */
	public boolean getUpdate(BananaNoticeVO vo) {
		boolean result = false;
		try {
			String sql = "update banana_notice set Ntitle=?, Ncontent=? "
					+ "where Nid=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getNtitle());
			pstmt.setString(2, vo.getNcontent());
			pstmt.setString(3, vo.getNid());
		
			int val = pstmt.executeUpdate();
			if(val != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * Delete : 삭제
	 */
	public boolean getDelete(String nid) {
		boolean result = false;
		try {
			String sql =" delete from banana_notice where nid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, nid);
			
			int val= pstmt.executeUpdate();
			if(val!=0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
