package com.banana.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.banana.vo.BananaFAQVO;

public class BananaFAQDAO extends DBConn{
	
	/**
	 * Insert : 공지사항 글쓰기
	 */
	public boolean getInsert(BananaFAQVO vo) {
		boolean result = false;
		try {
			String sql="insert into banana_FAQ "
					+ " values('q_'||SQE_BANANA_FAQ.nextval,?,?,sysdate,0)";
			getPreparedStatement(sql);
			pstmt.setString(1,vo.getFtitle());
			pstmt.setString(2,vo.getFcontent());
			
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
			String sql = "select count(*) from banana_FAQ";
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
			String sql = "update banana_FAQ set fhits = fhits+1 where fid=?";
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
	public ArrayList<BananaFAQVO> getList(int start, int end){
		ArrayList<BananaFAQVO> list = new ArrayList<BananaFAQVO>();
		
		try {
			String sql = "select * from (select rownum rno, fid, ftitle, fcontent, to_char(fdate,'yyyy.mm.dd'), fhits"
					+ " from (select * from banana_FAQ order by fdate desc))"
					+ " where rno between ? and ?";
			getPreparedStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				BananaFAQVO vo = new BananaFAQVO();
				vo.setRno(rs.getInt(1));
				vo.setFid(rs.getString(2));
				vo.setFtitle(rs.getString(3));
				vo.setFcontent(rs.getString(4));
				vo.setFdate(rs.getString(5));
				vo.setFhits(rs.getInt(6));
				
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
   public ArrayList<BananaFAQVO> getList(){
      ArrayList<BananaFAQVO> list = new ArrayList<BananaFAQVO>();
      
      try {
         String sql =  "select * from (select rownum rno, fid, ftitle, fcontent, to_char(fdate,'yyyy.mm.dd'), fhits"
					+ " from (select * from banana_FAQ order by fdate desc))";
         getPreparedStatement(sql);
         ResultSet rs = pstmt.executeQuery(sql);
         
         while(rs.next()){
        	 BananaFAQVO vo = new BananaFAQVO();
            vo.setRno(rs.getInt(1));
            vo.setFid(rs.getString(2));
            vo.setFtitle(rs.getString(3));
            vo.setFcontent(rs.getString(4));
            vo.setFdate(rs.getString(5));
            vo.setFhits(rs.getInt(6));
            
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
  public BananaFAQVO getContent(String fid) {
	  BananaFAQVO vo = new BananaFAQVO();
	   
	   try {
		   String sql ="select fid, ftitle, fcontent,"
		   		+ " to_char(fdate,'yyyy.mm.dd'), fhits from banana_FAQ where fid =?";
		   getPreparedStatement(sql);
		   pstmt.setString(1, fid);
		
		   ResultSet rs = pstmt.executeQuery();
		
			while(rs.next()) {
				vo.setFid(rs.getString(1));
				vo.setFtitle(rs.getString(2));
				vo.setFcontent(rs.getString(3));
				vo.setFdate(rs.getString(4));
				vo.setFhits(rs.getInt(5));
			}
			
	   } catch (Exception e) {
		e.printStackTrace();;
	   }
	   
	   return vo;
  }

  /**
	 * Update : 내용수정
	 */
	public boolean getUpdate(BananaFAQVO vo) {
		boolean result = false;
		try {
			String sql = "update banana_FAQ set Ftitle=?, Fcontent=? "
					+ "where Fid=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getFtitle());
			pstmt.setString(2, vo.getFcontent());
			pstmt.setString(3, vo.getFid());
		
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
	public boolean getDelete(String fid) {
		boolean result = false;
		try {
			String sql =" delete from banana_FAQ where fid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, fid);
			
			int val= pstmt.executeUpdate();
			if(val!=0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
