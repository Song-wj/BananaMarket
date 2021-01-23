package com.spring.dao;

import java.util.ArrayList;

import com.spring.vo.dongneVO;

public class dongneDAO extends DBConn{

	public boolean insertBoard(dongneVO vo) {
		boolean result = false;
		try {
			String sql ="insert into banana_board values('b_'||SQE_BANANA_BOARD.NEXTVAL, ?,?,?,?,?,sysdate )";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getBtitle());
			pstmt.setString(3, vo.getBfile());
			pstmt.setString(4, vo.getBsfile());
			pstmt.setString(5, vo.getBtopic());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<dongneVO> getBoardList(){
		ArrayList<dongneVO> list = new ArrayList<dongneVO>();
		try {
			String sql = "select bid, nickname, btitle, bfile,bsfile,btopic,maddr, bdate\r\n"
						+ "from banana_member m , banana_board b\r\n"
						+ "where m.mid = b.mid";
			getStatement();
			rs= stmt.executeQuery(sql);
			while(rs.next()) {
				dongneVO vo = new dongneVO();
				vo.setBid(rs.getString(1));
				vo.setNickname(rs.getString(2));
				vo.setBtitle(rs.getString(3));
				vo.setBfile(rs.getString(4));
				vo.setBsfile(rs.getString(5));
				vo.setBtopic(rs.getString(6));
				vo.setMaddr(rs.getString(7));
				vo.setBdate(rs.getString(8));
				
				list.add(vo);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
