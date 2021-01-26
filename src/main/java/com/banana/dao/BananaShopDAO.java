package com.banana.dao;

import java.util.ArrayList;

import com.banana.vo.BananaShopVO;

public class BananaShopDAO extends DBConn {
	
	/**
	 * Delete - 업체 삭제
	 * @param sid
	 * @return
	 */
	public boolean shopDelete(String sid) {
		boolean result = false;
		try {
			String sql="delete from banana_shop where sid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, sid);
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * Update - 업체 수정
	 * @param vo
	 * @return
	 */
	public boolean shopUpdate(BananaShopVO vo) {
		boolean result = false;
		try {
			String sql ="UPDATE BANANA_SHOP SET SNAME=?, SKINDS=?, SKINDS2=?, SINTRO=?, SADDR_NUM=?, SADDR=?, SPH=?\r\n" + 
					"WHERE SID=?";
			getPreparedStatement(sql);
			
			pstmt.setString(1,vo.getSname());
			pstmt.setString(2,vo.getSkinds());
			pstmt.setString(3,vo.getSkinds2());
			pstmt.setString(4,vo.getSintro());
			pstmt.setString(5,vo.getSaddr_num());
			pstmt.setString(6,vo.getSaddr());
			pstmt.setString(7,vo.getSph());
			pstmt.setString(8,vo.getSid());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
				
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return result;
	}
	
	/**
	 * Select - 업체 상세 정보
	 * @param sid
	 * @return
	 */
	public BananaShopVO getShopContent(String sid) {
		BananaShopVO vo = new BananaShopVO();
		try {
			String sql ="select  sid , mid, sname, skinds, skinds2, sintro, saddr_num, saddr, sph, sdate \r\n"
						+ "from banana_shop where sid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, sid);
				
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo.setSid(rs.getString(1));
				vo.setMid(rs.getString(2));
				vo.setSname(rs.getString(3));
				vo.setSkinds(rs.getString(4));
				vo.setSkinds2(rs.getString(5));
				vo.setSintro(rs.getString(6));
				vo.setSaddr_num(rs.getString(7));
				vo.setSaddr(rs.getString(8));
				vo.setSph(rs.getString(9));
				vo.setSdate(rs.getString(10));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return vo;
	}
	
	/**
	 * List - 업체 목록 불러오기
	 * @return
	 */
	public ArrayList<BananaShopVO> getShopList(){
		ArrayList<BananaShopVO> list = new ArrayList<BananaShopVO>();
		try {
			String sql = "select sid, mid, sname, skinds, skinds2, saddr_num, saddr, sph, sdate\r\n"
						+ "from banana_shop";
			getStatement();
			rs= stmt.executeQuery(sql);
			while(rs.next()) {
				BananaShopVO vo = new BananaShopVO();
				vo.setSid(rs.getString(1));
				vo.setMid(rs.getString(2));
				vo.setSname(rs.getString(3));
				vo.setSkinds(rs.getString(4));
				vo.setSkinds2(rs.getString(5));
				vo.setSaddr_num(rs.getString(6));
				vo.setSaddr(rs.getString(7));
				vo.setSph(rs.getString(8));
					
				list.add(vo);
					
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return list;
	}	
	
	/**
	 * Insert - 업체 등록
	 * @param vo
	 * @return
	 */
	public boolean insertShop(BananaShopVO vo) {
		boolean result = false;
		try {
			String sql ="insert into banana_shop "
					+ " values('shop_'||SQE_BANANA_BOARD.NEXTVAL,?,?,?,?,?,?,?,?,sysdate )";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getSname());
			pstmt.setString(3, vo.getSkinds());
			pstmt.setString(4, vo.getSkinds2());
			pstmt.setString(5, vo.getSintro());
			pstmt.setString(6, vo.getSaddr_num());
			pstmt.setString(7, vo.getSaddr());
			pstmt.setString(8, vo.getSph());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
