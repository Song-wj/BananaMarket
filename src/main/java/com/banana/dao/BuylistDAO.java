package com.banana.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.banana.vo.BuylistVO;


public class BuylistDAO extends DBConn{

	public ArrayList<BuylistVO> getBuylistList(){
		ArrayList<BuylistVO> list = new ArrayList<BuylistVO>();
		try {
			String sql = "select p.ptitle, m.maddr, p.pprice, p.pfile, p.psfile "
					+ "from banana_product p, banana_selllist s, banana_member m "
					+ "where s.sell_mid=m.mid and p.pchk='o' and p.BUY_MID='whtjdrnr010'";
			getPreparedStatement(sql);
	         ResultSet rs = pstmt.executeQuery(sql);
			
			/*
			 * 
			 * pstmt.setString(1, mid); rs=pstmt.executeQuery();
			 */
			
			while(rs.next()) {
				BuylistVO vo = new BuylistVO();
				
				vo.setPtitle(rs.getString(1));
				vo.setMaddr(rs.getString(2));
				vo.setPprice(rs.getString(3));
				vo.setPfile(rs.getString(4));
				vo.setPsfile(rs.getString(5));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
