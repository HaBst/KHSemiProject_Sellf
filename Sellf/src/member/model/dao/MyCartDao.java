package member.model.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.vo.Member;
import member.model.vo.MyCartTmp;
import product.model.vo.Product;

public class MyCartDao {

//	public ArrayList<Product> myCartList(Connection conn,String userId) {
	public ArrayList<Product> myCartList(Connection conn, String userId) {
		Statement stmt = null;
		ResultSet rset =  null;
		ArrayList<Product> list = new ArrayList<Product>();
		Product cartListProduct = null;
		String query = "SELECT *FROM PRODUCT_ENTIRE_TB JOIN USER_WISHLIST_TB"
						+ " ON (USER_WL_PRODUCT_ENTIRE_FK = PRODUCT_ENTIRE_PK) WHERE USER_WISHLIST_TB.USER_WL_USER_ENTIRE_ID_FK ='"+userId+"'";
		try {
			stmt = conn.createStatement();
			rset= stmt.executeQuery(query);
			
			while(rset.next()) {
				cartListProduct = new Product();
				cartListProduct.setProduct_image(rset.getString("PRUDUCT_IMAGE"));
				cartListProduct.setProduct_price(rset.getInt("PRODUCT_PRICE"));
				cartListProduct.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));
				cartListProduct.setProduct_detail(rset.getString("PRODUCT_DETAIL"));
				cartListProduct.setProduct_entire_pk(rset.getInt("PRODUCT_ENTIRE_PK"));
				cartListProduct.setProduct_name(rset.getString("PRODUCT_NAME"));
				list.add(cartListProduct);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return list;

	}

	public MyCartTmp selectCartList(Connection conn, String productKey) {
		Statement stmt = null;
		ResultSet rset =  null;
		MyCartTmp  myCart = null;
		String query = "SELECT *FROM PRODUCT_ENTIRE_TB" + 
				" JOIN USER_WISHLIST_TB ON (USER_WL_PRODUCT_ENTIRE_FK = PRODUCT_ENTIRE_PK) " + 
				" JOIN USER_ENTIRE_TB ON (USER_ID =  USER_WL_USER_ENTIRE_ID_FK) WHERE PRODUCT_ENTIRE_PK ='"+productKey+"'";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				myCart = new MyCartTmp();
				myCart.setProductImage(rset.getString("PRUDUCT_IMAGE"));
				myCart.setProductPrice(rset.getInt("PRODUCT_PRICE"));
				myCart.setProductAmount(rset.getInt("PRODUCT_AMOUNT"));
				myCart.setProductDetail(rset.getString("PRODUCT_DETAIL"));
				myCart.setProductEntire(rset.getInt("PRODUCT_ENTIRE_PK"));
				myCart.setUser_entire_pk(rset.getInt("USER_ENTIRE_PK"));
				myCart.setProductName(rset.getString("PRODUCT_NAME"));
				myCart.setUser_entire_pk(rset.getInt("USER_ENTIRE_PK"));
				myCart.setUser_ePoint(rset.getInt("USER_EPOINT"));
				myCart.setUser_name(rset.getString("USER_NAME"));
				myCart.setUser_email(rset.getString("USER_EMAIL"));
				myCart.setUser_addr(rset.getString("USER_ADDR"));
				myCart.setUser_id(rset.getString("USER_ID"));
				myCart.setUser_phone(rset.getString("USER_PHONE"));
				myCart.setUser_user_entire_user_grade_id_fk(rset.getString("USER_ENTIRE_USER_GRADE_ID_FK"));
				myCart.setUser_interest(rset.getString("USER_INTEREST"));	
			}
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return myCart ;
		
	}

	public Member memberInfo(Connection conn, String userId) {
		Statement stmt = null;
		ResultSet rset =  null;
		Member m = null;
		String query = "SELECT * FROM USER_ENTIRE_TB";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
			m = new Member();
			m.setUser_addr(rset.getString("USER_ADDR"));
			m.setUser_birth(rset.getString("USER_BIRTH"));
			m.setUser_email(rset.getString("USER_EMAIL"));
			m.setUser_enrolldate(rset.getDate("USER_ENROLLDATE   "));
			m.setUser_entire_pk(rset.getInt("USER_ENTIRE_PK"));
			m.setUser_ePoint(rset.getInt("USER_EPOINT"));
			m.setUser_gender(rset.getString("USER_GENDER"));
			m.setUser_id(rset.getString("USER_ID"));
			m.setUser_interest(rset.getString("USER_INTEREST"));
			m.setUser_name(rset.getString("USER_NAME"));
			m.setUser_phone(rset.getString("USER_PHONE"));
			m.setUser_pwd(rset.getString("USER_PWD"));
			m.setUser_user_entire_user_grade_id_fk(rset.getString("USER_ENTIRE_USER_GRADE_ID_FK"));
			}
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return m ;
		
	}

	public int myOrderInfo(Connection conn, MyCartTmp mt) {
		PreparedStatement pstmt = null;
		int result =  0;
		String query = "INSERT INTO ORDER_TB (SELECT ORDER_TB_SEQ.NEXTVAL,?,?,PRODUCT_ENTIRE_TB.PRODUCT_STATE,SYSDATE "
				+ "	FROM PRODUCT_ENTIRE_TB WHERE PRODUCT_ENTIRE_PK=?";
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, mt.getProductEntire());
			pstmt.setString(2, mt.getUser_id());
			pstmt.setInt(3, mt.getProductEntire());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int updateEpoint(Connection conn, String userId, String epoint) {
		PreparedStatement pstmt = null;
		int result =  0;
		String query = "UPDATE USER_ENTIRE_TB SET USER_EPOINT = ? WHERE USER_ID = ?";
		try {
			pstmt  = conn.prepareStatement(query);
			pstmt.setString(1, epoint);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteOneMycartList(Connection conn, String userId, int productEntire) {
		PreparedStatement pstmt = null;
		int result =  0;
		String query = "DELETE FROM  USER_WISHLIST_TB  WHERE USER_WL_PRODUCT_ENTIRE_FK = ? AND USER_WL_USER_ENTIRE_ID_FK = ?";
		try {
			pstmt  = conn.prepareStatement(query);
			pstmt.setString(2, userId);
			pstmt.setInt(1, productEntire);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int insertCartList(Connection conn, String userId, String productEntire) {
		PreparedStatement pstmt = null;
		int result =  0;
		String query = "INSERT INTO USER_WISHLIST_TB VALUES(?,?,?)";
		try {
			pstmt  = conn.prepareStatement(query);
			pstmt.setString(1, "USER_WISHLIST_TB_SEQ.NEXTVAL");
			pstmt.setString(2, productEntire);
			pstmt.setString(3, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	
}
