package com.banana.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.banana.vo.BuylistVO;
import com.banana.vo.productVO;


public class BuylistDAO extends DBConn{

	public ArrayList<productVO> getBuylistList(String buy_mid){
		ArrayList<productVO> list = new ArrayList<productVO>();
		try {
			String sql = "select p.pid, p.mid, p.ptitle, p.pcategory, p.pprice, p.pcontent, p.plike, p.pchat, to_char(p.pdate,'yyyy.mm.dd'), p.pchk, p.pfile, p.psfile, p.buy_mid, m.maddr "
					+ "from banana_product p, banana_member m "
					+ "where p.buy_mid=m.mid and p.pchk='o' and p.BUY_MID=?";
			getPreparedStatement(sql);
			pstmt.setString(1, buy_mid);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				productVO vo = new productVO();
				
				vo.setPid(rs.getString(1));
				vo.setMid(rs.getString(2));
				vo.setPtitle(rs.getString(3));
				vo.setPcategory(rs.getString(4));
				vo.setPprice(rs.getString(5));
				vo.setPcontent(rs.getString(6));
				vo.setPlike(rs.getString(7));
				vo.setPchat(rs.getString(8));
				vo.setPdate(rs.getString(9));
				vo.setPchk(rs.getString(10));
				vo.setPfile(rs.getString(11));
				vo.setPsfile(rs.getString(12));
				vo.setBuy_mid(rs.getString(13));
				vo.setMaddr(rs.getString(14));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
