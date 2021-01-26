package com.banana.dao;


import java.util.ArrayList;

import com.banana.vo.productVO;

public class productDAO extends DBConn{
	
	/**
	 * Insert : 중고 물품 등록
	 */
	public boolean getInsert(productVO vo) {
		boolean result = false;
		
		try {
			String sql = "insert into banana_product values "
					+ "('p_'||sqe_banana_product.nextval,?,?,?,?,?,0,0,sysdate,?,?,?)";
			
			getPreparedStatement(sql);
			
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPtitle());
			pstmt.setString(3, vo.getPcategory());
			pstmt.setString(4, vo.getPprice());
			pstmt.setString(5, vo.getPcontent());
			pstmt.setString(6, vo.getPchk());
			pstmt.setString(7, vo.getPfile());
			pstmt.setString(8, vo.getPsfile());
			//pstmt.setString(7, vo.getPimg1());
			//pstmt.setString(8, vo.getPsimg1());
			//pstmt.setString(9, vo.getPimg2());
			//pstmt.setString(10, vo.getPsimg2());
			//pstmt.setString(11, vo.getPimg3());
			//pstmt.setString(12, vo.getPsimg3());
			//pstmt.setString(13, vo.getPimg4());
			//pstmt.setString(14, vo.getPsimg4());
			//pstmt.setString(15, vo.getPimg5());
			//pstmt.setString(16, vo.getPsimg5());
			
			int val = pstmt.executeUpdate();
			
			if(val != 0) result = true;			
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
		return result;
	}
	
	
	/**
	 *  중고 제품 리스트
	 */
	public ArrayList<productVO> getProductList(){
		ArrayList<productVO> list = new ArrayList<productVO>();
		try {
			String sql = "select pid, mid, ptitle, pcategory, pprice, pcontent, plike, pchat, to_char(pdate,'yyyy.mm.dd'), pchk, pfile, psfile "
						+ " from banana_product";
			getPreparedStatement(sql);
			
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
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
