package member.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import common.JDBCTemplate;
import member.model.vo.Member;
import member.model.vo.wishList;
import product.model.vo.Product;


public class MemberDao {

	public int checkId(Connection conn, String id, String fullPath) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result=0;
		Properties prop = new Properties();

		try {
			prop.load(new FileInputStream(fullPath));
			String query = prop.getProperty("checkId");
			//			System.out.println(id);
			//			System.out.println(query);
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);
				rset = pstmt.executeQuery();
				if(rset.next())
				{
					result=1;
				}
				else
				{
					result=0;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

<<<<<<< HEAD
    public int updateMember(Connection conn, Member m) {
        PreparedStatement pstmt = null;
        int result = 0;
        String query = "update USER_ENTIRE_TB set "
                    + "user_email=?,user_phone=?,user_addr=?,user_interest=?"
                    + " where User_id=?";
        System.out.println(query);
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, m.getUser_email());
            pstmt.setString(2, m.getUser_phone());
            pstmt.setString(3, m.getUser_addr());
            pstmt.setString(4, m.getUser_interest());
            pstmt.setString(5, m.getUser_id());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);        
        }
        return result;
    }
    
    public int deleteMember(String userId, String userPwd, Connection conn) {
        PreparedStatement pstmt = null;
        int result = 0;
        String query = "delete from USER_ENTIRE_TB where User_id=? AND user_pwd=?";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userId);
            pstmt.setString(2, userPwd);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }
    public Member myInfo(Connection conn, String userPwd) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        Member m = null;
        String query  = "select * from USER_ENTIRE_TB where USER_PWD=?";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1,userPwd);
            rset = pstmt.executeQuery();
            if(rset.next()) {
                m = new Member();
                m.setUser_entire_pk(rset.getInt("USER_ENTIRE_PK"));
                m.setUser_id(rset.getString("USER_ID"));
                m.setUser_name(rset.getString("USER_NAME"));
                m.setUser_pwd(rset.getString("USER_PWD"));
                m.setUser_phone(rset.getString("USER_PHONE"));
                m.setUser_birth(rset.getString("USER_BIRTH"));
                m.setUser_gender(rset.getString("USER_GENDER"));
                m.setUser_addr(rset.getString("USER_ADDR"));
                m.setUser_user_entire_user_grade_id_fk(rset.getString("USER_ENTIRE_USER_GRADE_ID_FK"));
                m.setUser_email(rset.getString("USER_EMAIL"));
                m.setUser_interest(rset.getString("USER_INTEREST"));
                m.setUser_enrolldate(rset.getDate("USER_ENROLLDATE"));
                m.setUser_ePoint(rset.getInt("USER_EPOINT"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        return m;
    }
=======
	public int updateMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update USER_ENTIRE_TB set "
				+ "user_email=?,user_phone=?,user_addr=?,user_interest=?"
				+ " where User_id=?";
		System.out.println(query);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getUser_email());
			pstmt.setString(2, m.getUser_phone());
			pstmt.setString(3, m.getUser_addr());
			pstmt.setString(4, m.getUser_interest());
			pstmt.setString(5, m.getUser_id());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);        
		}
		return result;
	}

	public int deleteMember(String userId, String userPwd, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from USER_ENTIRE_TB where User_id=? AND user_pwd=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}
	public Member myInfo(Connection conn, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query  = "select * from USER_ENTIRE_TB where USER_PWD=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,userPwd);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setUser_entire_pk(rset.getInt("USER_ENTIRE_PK"));
				m.setUser_id(rset.getString("USER_ID"));
				m.setUser_name(rset.getString("USER_NAME"));
				m.setUser_pwd(rset.getString("USER_PWD"));
				m.setUser_phone(rset.getString("USER_PHONE"));
				m.setUser_birth(rset.getString("USER_BIRTH"));
				m.setUser_gender(rset.getString("USER_GENDER"));
				m.setUser_addr(rset.getString("USER_ADDR"));
				m.setUser_user_entire_user_grade_id_fk(rset.getString("USER_ENTIRE_USER_GRADE_ID_FK"));
				m.setUser_email(rset.getString("USER_EMAIL"));
				m.setUser_interest(rset.getString("USER_INTEREST"));
				m.setUser_enrolldate(rset.getDate("USER_ENROLLDATE"));
				// m.setUser_epoint(rset.getInt("USER_EPOINT"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}
>>>>>>> e69c08929f9ae0d756bc3d0299d773d88e6148bc

	public int deleteSave(String userId, Connection conn) {
		PreparedStatement pstmt = null;
		int result=0;
		String query  = "INSERT INTO user_del_tb VALUES (USER_DEL_TB_SEQ.nextval,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}



	public wishList jjimDelete(Connection conn, String id) {
		wishList w = new wishList();
		Statement stmt = null;
		ResultSet rset = null;
		String query = "SELECT USER_WL_PRODUCT_ENTIRE_FK FROM USER_WISHLIST_TB WHERE USER_WL_USER_ENTIRE_ID_FK='"+id+"'";  
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
<<<<<<< HEAD
			w.setUSER_WL_PRODUCT_ENTIRE_FK(rset.getInt("USER_WL_PRODUCT_ENTIRE_FK"));
		}} catch (SQLException e) {
=======
				w.setUSER_WL_PRODUCT_ENTIRE_FK(rset.getInt("USER_WL_PRODUCT_ENTIRE_FK"));
			}
		} catch (SQLException e) {
>>>>>>> e69c08929f9ae0d756bc3d0299d773d88e6148bc
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return w;
	}

	public int memberJoin(Connection conn, Member m, String fullPath) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result=0;
		Properties prop = new Properties();

		try {
			prop.load(new FileInputStream(fullPath));
			String query = prop.getProperty("memberJoin");
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, m.getUser_id());
				pstmt.setString(2, m.getUser_name());
				pstmt.setString(3, m.getUser_pwd());
				pstmt.setString(4, m.getUser_phone());
				pstmt.setString(5, m.getUser_birth());
				pstmt.setString(6, m.getUser_gender());
				pstmt.setString(7, m.getUser_addr());
				pstmt.setString(8, m.getUser_email());
				pstmt.setString(9, m.getUser_interest());

				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(result>0)
			{
				result=1;
				JDBCTemplate.commit(conn);//.commit();
			}
			else
			{
				result=0;
				JDBCTemplate.rollback(conn);
//				conn.rollback();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally		{

			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	//	public ArrayList<Product> self(Connection conn, String id) {
	//		ArrayList<Product> list = new ArrayList<Product>();
	//		Statement stmt = null;
	//		ResultSet rset = null;
	//		String query ="select product_name,PRUDUCT_IMAGE,product_price,product_state,product_amount from product_entire_tb where product_entire_user_id_fk='"+id+"'"; 
	//		try {
	//			stmt = conn.createStatement();
	//			rset = stmt.executeQuery(query);
	//			while(rset.next()){
	//			Product p = new Product();
	//			p.setProduct_name(rset.getString("PRODUCT_NAME"));  //이름
	//			p.setProduct_image(rset.getString("PRUDUCT_IMAGE")); //이미지
	//			p.setProduct_price(rset.getInt("PRODUCT_PRICE"));  //가격
	//			p.setProduct_state(rset.getString("PRODUCT_STATE"));  //상태
	//			p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));  //갯수
	//			list.add(p);
	//			}
	//		} catch (Exception e) {
	//			e.printStackTrace();
	//		} 
	//		finally		
	//		{
	//			JDBCTemplate.close(rset);
	//			JDBCTemplate.close(stmt);
	//		}
	//		return list;
	//	}
	//
	//	public ArrayList<Product> jjimlist(Connection conn, String id) {
	//		ArrayList<Product> list = new ArrayList<Product>();
	//		Statement stmt = null;
	//		ResultSet rset = null;
	//		String query ="select product_entire_pk, product_name,PRUDUCT_IMAGE,product_price,product_state,product_amount from (select * from user_wishlist_tb, product_entire_Tb where user_wl_product_entire_fk = product_entire_pk) where user_wl_user_entire_id_fk='"+id+"'";

	public ArrayList<Product> self(Connection conn, String id) {
		ArrayList<Product> list = new ArrayList<Product>();
		Statement stmt = null;
		ResultSet rset = null;
		String query ="select product_name,PRUDUCT_IMAGE,product_price,product_state,product_amount from product_entire_tb where product_entire_user_id_fk='"+id+"'"; 

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
				Product p = new Product();
				p.setProduct_entire_pk(rset.getInt("PRODUCT_ENTIRE_PK")); //상품인덱스
				p.setProduct_name(rset.getString("PRODUCT_NAME"));  //이름
				p.setProduct_image(rset.getString("PRUDUCT_IMAGE")); //이미지
				p.setProduct_price(rset.getInt("PRODUCT_PRICE"));  //가격
				p.setProduct_state(rset.getString("PRODUCT_STATE"));  //상태
				p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));  //갯수
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		finally		
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		} 
		return list;
	}

//	public String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {
//
//		int recordTotalCount = 0;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		String query="SELECT count(*)AS totalCount FROM NOTICE";
//
//		try {
//			pstmt = conn.prepareStatement(query);
//			rset = pstmt.executeQuery();
//			if(rset.next())
//			{
//				recordTotalCount = rset.getInt("totalCount");
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			JDBCTemplate.close(rset);
//			JDBCTemplate.close(pstmt);
//		}
//
//		//124 -> navi 13
//
//		int pageTotalCount  = 0; // navi 토탈 카운트
//
//		if(recordTotalCount%recordCountPerPage!=0) {
//			pageTotalCount = recordTotalCount / recordCountPerPage +1;
//		}else
//		{
//			pageTotalCount = recordTotalCount / recordCountPerPage;
//		}
//
//		if(currentPage<1) {
//			currentPage=1;
//		}else if(currentPage>pageTotalCount) {
//			currentPage = pageTotalCount;
//		}
//
//		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
//
//		int endNavi = startNavi + naviCountPerPage -1;
//
//
//		if(endNavi>pageTotalCount) {
//			endNavi = pageTotalCount;
//		}
//
//		boolean needPrev = true;
//		boolean needNext = true;
//		if(startNavi==1) {
//			needPrev = false;
//		}
//		if(endNavi==pageTotalCount) {
//			needNext=false;
//		}
//
//		// 여기까지 기본적인 구조는 끝남
//		StringBuilder sb = new StringBuilder(); //오랜만이야..
//
//		if(needPrev) { //시작이 1페이지가 아니라면!
//			sb.append("<a href='/notice?currentPage="+(startNavi-1)+"'> < </a>");
//		}
//		for(int i=startNavi;i<=endNavi;i++) {
//			if(i==currentPage) {
//				sb.append("<a href='/notice?currentPage="+i+"'><B> "+i+" </B></a>");
//			}else {
//				sb.append("<a href='/notice?currentPage="+i+"'> "+i+" </a>");
//			}
//		}
//		if(needNext) { // 끝페이지가 아니라면!
//			sb.append("<a href='/notice?currentPage="+(endNavi+1)+"'> > </a>");
//		}
//
//		return sb.toString();
//	}

//	public ArrayList<Product> getCurrentPage(Connection conn, int currentPage, int recordCountPerPage) {
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;		
//		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
//
//
//
//		//끝 게시물 계산
//		int end = currentPage*recordCountPerPage;
//
//
//		String query = "SELECT * FROM" 
//				+ "(select product_entire_Tb.*,row_number() "
//				+ "over(order by product_entire_pk desc)as num "
//				+ "from product_entire_Tb)" 
//				+ "WHERE num between ? and ?";	
//		ArrayList<Product> list = new ArrayList<Product>();
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1,start);
//			pstmt.setInt(2,end);
//			rset= pstmt.executeQuery();
//			while(rset.next()) {
//				Product p = new Product();
//				p.setProduct_entire_pk(rset.getInt("PRODUCT_ENTIRE_PK")); //상품인덱스
//				p.setProduct_name(rset.getString("PRODUCT_NAME"));  //이름
//				p.setProduct_image(rset.getString("PRUDUCT_IMAGE")); //이미지
//				p.setProduct_price(rset.getInt("PRODUCT_PRICE"));  //가격
//				p.setProduct_state(rset.getString("PRODUCT_STATE"));  //상태
//				p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));  //갯수
//				list.add(p);
//			}
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			JDBCTemplate.close(rset);
//			JDBCTemplate.close(pstmt);
//		}
//		return list;
//
//
//
//	}

	public ArrayList<Product> Buy(Connection conn, String id) {
		ArrayList<Product> list = new ArrayList<Product>();
		Statement stmt = null;
		ResultSet rset = null;
		String query ="select product_entire_pk, product_name,PRUDUCT_IMAGE,product_price,product_state,product_amount from (select * from user_purchase_his_tb, product_entire_Tb where user_pur_his_product_fk = product_entire_pk) where user_pur_his_user_entire_id_fk='"+id+"'";

		return null;
	}
	public ArrayList<Product> jjimlist(Connection conn, String id) {
		ArrayList<Product> list = new ArrayList<Product>();
		Statement stmt = null;
		ResultSet rset = null;
		String query ="select product_entire_pk, product_name,PRUDUCT_IMAGE,product_price,product_state,product_amount from (select * from user_wishlist_tb, product_entire_Tb where user_wl_product_entire_fk = product_entire_pk) where user_wl_user_entire_id_fk='"+id+"'";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
				Product p = new Product();
				p.setProduct_entire_pk(rset.getInt("PRODUCT_ENTIRE_PK")); //상품인덱스
				p.setProduct_name(rset.getString("PRODUCT_NAME"));  //이름
				p.setProduct_image(rset.getString("PRUDUCT_IMAGE")); //이미지
				p.setProduct_price(rset.getInt("PRODUCT_PRICE"));  //가격
				p.setProduct_state(rset.getString("PRODUCT_STATE"));  //상태
				p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));  //갯수
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		finally		
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return list;
	}

	public String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {

		int recordTotalCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query="SELECT count(*)AS totalCount FROM NOTICE";

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				recordTotalCount = rset.getInt("totalCount");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		//124 -> navi 13

		int pageTotalCount  = 0; // navi 토탈 카운트

		if(recordTotalCount%recordCountPerPage!=0) {
			pageTotalCount = recordTotalCount / recordCountPerPage +1;
		}else
		{
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(currentPage<1) {
			currentPage=1;
		}else if(currentPage>pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;

		int endNavi = startNavi + naviCountPerPage -1;


		if(endNavi>pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi==1) {
			needPrev = false;
		}
		if(endNavi==pageTotalCount) {
			needNext=false;
		}

		// 여기까지 기본적인 구조는 끝남
		StringBuilder sb = new StringBuilder(); //오랜만이야..

		if(needPrev) { //시작이 1페이지가 아니라면!
			sb.append("<a href='/notice?currentPage="+(startNavi-1)+"'> < </a>");
		}
		for(int i=startNavi;i<=endNavi;i++) {
			if(i==currentPage) {
				sb.append("<a href='/notice?currentPage="+i+"'><B> "+i+" </B></a>");
			}else {
				sb.append("<a href='/notice?currentPage="+i+"'> "+i+" </a>");
			}
		}
		if(needNext) { // 끝페이지가 아니라면!
			sb.append("<a href='/notice?currentPage="+(endNavi+1)+"'> > </a>");
		}

		return sb.toString();
	}

	public ArrayList<Product> getCurrentPage(Connection conn, int currentPage, int recordCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);



		//끝 게시물 계산
		int end = currentPage*recordCountPerPage;


		String query = "SELECT * FROM" 
				+ "(select product_entire_Tb.*,row_number() "
				+ "over(order by product_entire_pk desc)as num "
				+ "from product_entire_Tb)" 
				+ "WHERE num between ? and ?";	
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,start);
			pstmt.setInt(2,end);
			rset= pstmt.executeQuery();
			while(rset.next()) {
				Product p = new Product();
				p.setProduct_entire_pk(rset.getInt("PRODUCT_ENTIRE_PK")); //상품인덱스
				p.setProduct_name(rset.getString("PRODUCT_NAME"));  //이름
				p.setProduct_image(rset.getString("PRUDUCT_IMAGE")); //이미지
				p.setProduct_price(rset.getInt("PRODUCT_PRICE"));  //가격
				p.setProduct_state(rset.getString("PRODUCT_STATE"));  //상태
				p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));  //갯수
				list.add(p);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;

	}


	public int memberNaverJoin(Connection conn, Member m, String fullPath) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rset = null;
		int result=0;
		Member m2 = null;
		Properties prop = new Properties();

		try {
			prop.load(new FileInputStream(fullPath));

			String query = prop.getProperty("memberNaverJoin");

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, m.getUser_id());
			pstmt.setString(2, m.getUser_name());
			pstmt.setString(3, "0000-"+m.getUser_birth());
			pstmt.setString(4, m.getUser_gender());
			pstmt.setString(5, m.getUser_email());
			result = pstmt.executeUpdate();

			if(result>0)
			{
				result=1;
				conn.commit();
			}
			else
			{
				result=0;
				conn.rollback();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Member memberLogin(Connection conn, String id, String pw, String fullPath) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		Properties prop = new Properties();

		try {
			prop.load(new FileInputStream(fullPath));

			String query = prop.getProperty("memberLogin");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				m = new Member();
				m.setUser_id(rset.getString("user_id"));
				m.setUser_name(rset.getString("USER_NAME"));
				m.setUser_pwd(rset.getString("USER_PWD"));
				m.setUser_phone(rset.getString("USER_PHONE"));
				m.setUser_birth(rset.getString("USER_BIRTH"));
				m.setUser_gender(rset.getString("USER_GENDER"));
				m.setUser_addr(rset.getString("USER_ADDR"));
				m.setUser_user_entire_user_grade_id_fk(rset.getString("USER_ENTIRE_USER_GRADE_ID_FK"));
				m.setUser_email(rset.getString("USER_EMAIL"));
				m.setUser_interest(rset.getString("USER_INTEREST"));
				m.setUser_enrolldate(rset.getDate("USER_ENROLLDATE"));
				m.setUser_ePoint(rset.getInt("USER_EPOINT"));
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return m;
	}
}
