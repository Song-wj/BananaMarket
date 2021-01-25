package com.banana.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.banana.vo.productVO;

public class productDAO extends DBConn{
	
	/**
	 * Insert : 중고 물품 등록
	 */
	public boolean getInsert(productVO vo) {
		boolean result = false;
		
		try {
			String sql = "insert into banana_product values('p_'||sqe_banana_product.nextval,?,?,?,?,?,sysdate,?)";
			
			getPreparedStatement(sql);
			
			pstmt.setString(1, "test");
			pstmt.setString(2, vo.getPname());
			pstmt.setString(3, vo.getPrice());
			pstmt.setString(4, vo.getPlike());
			pstmt.setString(5, vo.getPchat());
			pstmt.setString(6, vo.getPchk());
			
			int val = pstmt.executeUpdate();
			
			if(val != 0) result = true;			
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
		return result;
	}
	
	
	/**
	 * Select : 전체 리스트
	 */
	public ArrayList<productVO> getList(){
		ArrayList<productVO> list = new ArrayList<productVO>();
		
		try {
			String sql = "select pid, mid, pname, price, plike, pchat, to_char(pdate,'yyyy.mm.dd'), pchk " + 
					" from (select * from banana_product order by pdate desc)";
			
			getPreparedStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				productVO vo = new productVO();
				vo.setPid(rs.getString(1));
				vo.setMid(rs.getString(2));
				vo.setPname(rs.getString(3));
				vo.setPrice(rs.getString(4));
				vo.setPlike(rs.getString(5));
				vo.setPchat(rs.getString(6));
				vo.setPdate(rs.getString(7));
				vo.setPchk(rs.getString(8));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
