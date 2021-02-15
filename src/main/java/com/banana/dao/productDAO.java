package com.banana.dao;



import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.banana.vo.KeywordVO;
import com.banana.vo.LikeVO;
import com.banana.vo.dongneVO;
import com.banana.vo.productVO;

public class productDAO extends DBConn{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.product";
	
	public void getUpdateHits(String pid) {
		try {
			String sql = "update banana_product set phits = phits+1 where pid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, pid);
			pstmt.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getLikeHits(String pid) {
		try {
			String sql = "update banana_product set plike = plike+1 where pid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, pid);
			pstmt.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getLikeminus(String pid) {
		try {
			String sql = "update banana_product set plike = plike-1 where pid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, pid);
			pstmt.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Insert : 중고 물품 등록
	 */
	public int getInsert(productVO vo) {
		return sqlSession.insert(namespace+".InsertProduct", vo);
		/*
		boolean result = false;
		
		try {
			String sql = "insert into banana_product values "
					+ "('p_'||sqe_banana_product.nextval,?,?,?,?,?,0,0,sysdate,?,?,?,?)";
			
			getPreparedStatement(sql);
			
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPtitle());
			pstmt.setString(3, vo.getPcategory());
			pstmt.setString(4, vo.getPprice());
			pstmt.setString(5, vo.getPcontent());
			pstmt.setString(6, vo.getPchk());
			pstmt.setString(7, vo.getPfile());
			pstmt.setString(8, vo.getPsfile());
			pstmt.setString(9, vo.getBuy_mid());
			
			int val = pstmt.executeUpdate();
			
			if(val != 0) result = true;			
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
		return result;
		*/
	}
	
	
	/**
	 *  중고 제품 리스트
	 */
	public ArrayList<productVO> getProductList(){
		List <productVO> list = sqlSession.selectList(namespace+".ProductList");
		return (ArrayList<productVO>) list;
		/*
		ArrayList<productVO> list = new ArrayList<productVO>();
		try {
			String sql = "select pid, mid, ptitle, pcategory, pprice, pcontent, plike, pchat, to_char(pdate,'yyyy.mm.dd'), pchk, pfile, psfile, buy_mid "
						+ " from banana_product order by pdate desc ";
			getPreparedStatement(sql);
			
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
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		*/
	}
	
	/**
	 *  판매내역 - 판매중 제품 리스트 
	 */
	public ArrayList<productVO> getProductSellList(){
		List <productVO> list = sqlSession.selectList(namespace+".ProductSellList");
		return (ArrayList<productVO>) list;
		/*
		ArrayList<productVO> list = new ArrayList<productVO>();
		try {
			String sql = "select pid, mid, ptitle, pcategory, pprice, pcontent, plike, pchat, to_char(pdate,'yyyy.mm.dd'), pchk, pfile, psfile, buy_mid "
						+ " from banana_product where pchk='x' ";
			getPreparedStatement(sql);
			
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
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		*/
	}
	
	
	/**
	 *  중고제품 상세 보기
	 */
	public productVO getProductContent(String pid) {
		return sqlSession.selectOne(namespace+".ProductContent", pid);
		/*productVO vo = new productVO();
		try {
			String sql ="select p.pid, p.mid, p.ptitle, p.pcategory, p.pprice, p.pcontent, "
					+ "      p.plike, p.pchat, p.pdate, p.pfile, p.psfile, m.MADDR, m.NICKNAME, m.SCORE "
					+ " from banana_product p, banana_member m "
					+ " where p.pid = ?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, pid);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setPid(rs.getString(1));
				vo.setMid(rs.getString(2));
				vo.setPtitle(rs.getString(3));
				vo.setPcategory(rs.getString(4));
				vo.setPprice(rs.getString(5));
				vo.setPcontent(rs.getString(6));
				vo.setPlike(rs.getString(7));
				vo.setPchat(rs.getString(8));
				vo.setPdate(rs.getString(9));
				vo.setPfile(rs.getString(10));
				vo.setPsfile(rs.getString(11));
				vo.setMaddr(rs.getString(12));
				vo.setNickname(rs.getString(13));
				vo.setScore(rs.getString(14));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
		*/
	}
	
	/**
	 *  중고제품 수정
	 */
	public int getProductUpdate(productVO vo) {
		return sqlSession.update(namespace+".ProductUpdate", vo);
		/*
		boolean result = false;
		
		try {
			String sql ="update banana_product set ptitle=?,pcategory=?,pprice=?, pcontent=?, pfile=? , psfile=? where pid=? ";
			getPreparedStatement(sql);
			
			pstmt.setString(1,vo.getPtitle());
			pstmt.setString(2,vo.getPcategory());
			pstmt.setString(3,vo.getPprice());
			pstmt.setString(4,vo.getPcontent());
			pstmt.setString(5,vo.getPfile());
			pstmt.setString(6,vo.getPsfile());
			pstmt.setString(7,vo.getPid());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		*/
	}
	/**
	 * 좋아요
	 */
	public boolean getPickContent(String mid,String pid) {
		boolean result = false;
		Map<String,String> param = new HashMap<String, String>();
		param.put("mid", mid);
		param.put("pid", pid);
		int val = sqlSession.insert(namespace+".getPickContent",param);
		if(val != 0) result = true;
		return result;
		
		/*try {
			String sql = "insert into BANANA_INTEREST values(?,?,'','')";
			getPreparedStatement(sql);
			pstmt.setString(1,mid);
			pstmt.setString(2,pid);
			
			int val = pstmt.executeUpdate();
			
			if(val != 0) {
				result = true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;*/
	}
	
	/**
	 * 좋아요 취소 
	 */
	public boolean getDeleteContent(String mid, String pid) {
		boolean result = false;
		Map<String,String> param = new HashMap<String, String>();
		param.put("mid", mid);
		param.put("pid", pid);
		int val = sqlSession.delete(namespace+".getDeleteContent",param);
		if(val != 0) result = true;
		return result;
	}
		
//		try {
//			String sql = "delete from BANANA_INTEREST where mid=? and pid=?";
//			
//			getPreparedStatement(sql);
//			pstmt.setString(1, mid);
//			pstmt.setString(2, pid);
//			
//			int val = pstmt.executeUpdate();
//			if(val != 0) result = true;
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return result;
//	}
	
	/**
	 * 좋아요 목록
	 */
	public ArrayList<LikeVO> getLikelist(String mid){
		List <LikeVO> list = sqlSession.selectList(namespace+".getLikelist",mid);
		return (ArrayList<LikeVO>) list;
	}
	
		/*try {
			String sql = "select p.ptitle, m.maddr, p.pprice, p.pfile, p.psfile, p.pid"
					+ " from banana_product p, banana_interest i, banana_member m "
					+ " where i.mid=m.mid and i.pid=p.pid and i.mid=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				LikeVO vo = new LikeVO();
				
				vo.setPtitle(rs.getString(1));
				vo.setMaddr(rs.getString(2));
				vo.setPprice(rs.getString(3));
				vo.setPfile(rs.getString(4));
				vo.setPsfile(rs.getString(5));
				vo.setPid(rs.getString(6));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}*/
	
	/**
	 * 좋아요 중복 체크
	 */
	public int likeResult(String mid, String pid) {
		int result = 0;
		/*
		 * Map<String,String> param = new HashMap<String, String>(); param.put("mid",
		 * mid); param.put("pid", pid); result=
		 * sqlSession.selec(namespace+".likeResult", param); return result;
		 */
	
		
		try {
			String sql ="select count(*) from BANANA_INTEREST where mid=? and pid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
			
			pstmt.setString(2, pid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	

	
	public boolean getUpdateNofile(productVO vo) {
		boolean result = false;
		try {
		
			String sql ="update banana_product set ptitle=?, pcategory=?, pprice=?, pcontent=?,  where pid=?";
			getPreparedStatement(sql);
			pstmt.setString(1,vo.getPtitle());
			pstmt.setString(2,vo.getPcategory());
			pstmt.setString(3,vo.getPprice());
			pstmt.setString(4,vo.getPcontent());
			pstmt.setString(5,vo.getPid());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	/**
	 *  중고 물품 삭제
	 */
	public int getProductDelete(String pid) {
		return sqlSession.delete(namespace+".ProductDelete", pid);
		/*
		boolean result = false;
		try {
			String sql="delete from banana_product where pid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, pid);
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		*/
	}
	
	
	/**
	 *  중고 물품 (판매 중 => 판매 완료) 상태 변경 
	 */
	public int getSellUpdate(String pid) {
		return sqlSession.update(namespace+".ProductSellUpdate", pid);
		/*
		boolean result = false;
		
		try {
			String sql="update banana_product set pchk=?  where pid=?";
			getPreparedStatement(sql);
			
			pstmt.setString(1, "o");
			pstmt.setString(2, pid);
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		*/
	}
	/**
	 * 키워드등록
	 * @param mid
	 * @param keyword
	 * @return
	 */
	public boolean getKeyword(String mid,String keyword) {
		boolean result = false;
		Map<String,String> param = new HashMap<String, String>();
		param.put("mid", mid);
		param.put("keyword", keyword);
		int val = sqlSession.insert(namespace+".getKeyword",param);
		if(val != 0) result = true;
		return result;
	}
		/*try {
			String sql = "insert into BANANA_KEYWORD values(?,?)";
			getPreparedStatement(sql);
			pstmt.setString(1,mid);
			pstmt.setString(2,keyword);
			
			int val = pstmt.executeUpdate();
			
			if(val != 0) {
				result = true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}*/
	
	/**
	 * 키워드검색 목록
	 * @param mid
	 * @return
	 */
	public ArrayList<productVO> getkeywordlist(String mid){
		ArrayList<productVO> list = new ArrayList<productVO>();
		
		try {
			String sql = "select ptitle, maddr, pprice, pfile, psfile, pid "
					+ " from(select m.maddr, p.* , k.keyword "
					      + "from banana_product p, banana_member m, (select * from banana_keyword where mid = ?) k "
					      + "where m.mid=p.mid) "
					 + "where ptitle LIKE '%'||keyword||'%' or pcategory like '%'||keyword||'%' or pcontent like '%'||keyword||'%'";
			
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				productVO vo = new productVO();
				
				vo.setPtitle(rs.getString(1));
				vo.setMaddr(rs.getString(2));
				vo.setPprice(rs.getString(3));
				vo.setPfile(rs.getString(4));
				vo.setPsfile(rs.getString(5));
				vo.setPid(rs.getString(6));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<KeywordVO> getkeyword(String mid){
		ArrayList<KeywordVO> list = new ArrayList<KeywordVO>();
		
		try {
			String sql = "select keyword from banana_keyword where mid=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				KeywordVO vo = new KeywordVO();
				
				vo.setKeyword(rs.getString(1));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean delkeyword(String mid, String keyword) {
		boolean result = false;
		Map<String,String> param = new HashMap<String, String>();
		param.put("mid", mid);
		param.put("keyword", keyword);
		int val = sqlSession.delete(namespace+".delkeyword",param);
		if(val != 0) result = true;
		return result;
	}
		/*
		try {
			String sql = "delete from BANANA_keyword where mid=? and keyword=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, keyword);
			
			int val = pstmt.executeUpdate();
			if(val != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}*/
	
	public ArrayList<productVO> getkeywordclick(String keyword){
		ArrayList<productVO> list = new ArrayList<productVO>();
		String str="%"+keyword+"%";
		try {
			String sql = "select ptitle, maddr, pprice, pfile, psfile, pid "
					+ " from(select m.maddr, p.* from banana_product p, banana_member m where m.mid=p.mid) "
					+ " where ptitle LIKE ? or pcategory like ? or pcontent like ?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, str);
			pstmt.setString(2, str);
			pstmt.setString(3, str);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				productVO vo = new productVO();
				
				vo.setPtitle(rs.getString(1));
				vo.setMaddr(rs.getString(2));
				vo.setPprice(rs.getString(3));
				vo.setPfile(rs.getString(4));
				vo.setPsfile(rs.getString(5));
				vo.setPid(rs.getString(6));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
		
	/**
	 * 검색 목록
	 * @param search
	 * @return
	 */
	public ArrayList<productVO> getsearchlist(String search){
		ArrayList<productVO> list = new ArrayList<productVO>();
		String set_search = "%" + search + "%";
		
		try {
			String sql = "select *\r\n" + 
					"from (select *\r\n" + 
					"from (select rownum rno, p.pid, p.mid, p.ptitle, p.pcategory, p.pcontent, p.plike, p.pchat, p.pdate, p.pchk, p.psfile, m.nickname, m.maddr, p.pprice\r\n" + 
					"      from banana_product p, banana_member m\r\n" + 
					"      where p.mid = m.mid)\r\n" + 
					"where (ptitle like ? or pprice like ? or maddr like ?)\r\n" + 
					")";
			
			getPreparedStatement(sql);
			
			pstmt.setString(1, set_search);
			pstmt.setString(2, set_search);
			pstmt.setString(3, set_search);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				productVO vo = new productVO();
				
				vo.setRno(rs.getString(1));
				vo.setPid(rs.getString(2));
				vo.setMid(rs.getString(3));
				vo.setPtitle(rs.getString(4));
				vo.setPcategory(rs.getString(5));
				vo.setPcontent(rs.getString(6));
				vo.setPlike(rs.getString(7));
				vo.setPchat(rs.getString(8));
				vo.setPdate(rs.getString(9));
				vo.setPchk(rs.getString(10));
				vo.setPsfile(rs.getString(11));
				vo.setNickname(rs.getString(12));
				vo.setMaddr(rs.getString(13));
				vo.setPprice(rs.getString(14));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * 검색 카운트
	 * @param search
	 * @return
	 */
	public int getsearchCount(String search){
		int result = 0;
		String set_search = "%" + search + "%";
		
		try {
			String sql = "select count(*)\r\n" + 
					"from (select *\r\n" + 
					"from (select rownum rno, p.pid, p.mid, p.ptitle, p.pcategory, p.pcontent, p.plike, p.pchat, p.pdate, p.pchk, p.psfile, m.nickname, m.maddr, p.pprice\r\n" + 
					"      from banana_product p, banana_member m\r\n" + 
					"      where p.mid = m.mid)\r\n" + 
					"where (ptitle like ? or pprice like ? or maddr like ?)\r\n" + 
					")";
			
			getPreparedStatement(sql);
			
			pstmt.setString(1, set_search);
			pstmt.setString(2, set_search);
			pstmt.setString(3, set_search);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
