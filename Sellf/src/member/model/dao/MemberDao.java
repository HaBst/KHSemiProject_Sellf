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
import member.model.vo.Grade;
import member.model.vo.Member;
import member.model.vo.purchaseHis;
import member.model.vo.wishList;
import product.model.vo.Product;

public class MemberDao {

	public int checkId(Connection conn, String id, String fullPath) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Properties prop = new Properties();
		
		try {
			prop.load(new FileInputStream(fullPath));
			String query = prop.getProperty("checkId");
			System.out.println(id);
			System.out.println(query);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

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
                m.setUser_epoint(rset.getInt("USER_EPOINT"));
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

	public ArrayList<wishList> jjimList(Connection conn, String id) {
		ArrayList<wishList> list = new ArrayList<wishList>();
		Statement stmt = null;
		ResultSet rset = null;
		String query = "SELECT USER_WL_PRODUCT_ENTIRE_FK FROM USER_WISHLIST_TB WHERE USER_WL_USER_ENTIRE_ID_FK='"+id+"'";  
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
			wishList w = new wishList();
			w.setUSER_WL_PRODUCT_ENTIRE_FK(rset.getInt("USER_WL_PRODUCT_ENTIRE_FK"));
			list.add(w);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return list;
	}

	public ArrayList<Product> jjimList2(Connection conn, ArrayList<wishList> list) {
		ArrayList<Product> list2 = new ArrayList<Product>();
		Statement stmt = null;
		ResultSet rset = null;
		System.out.println("list2 사이즈:"+list.size());
		System.out.println("list2 :"+list);
		String query ="select product_name,PRUDUCT_IMAGE,product_price,product_state,product_amount from product_entire_tb where PRODUCT_ENTIRE_PK="+list.size();  
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
			Product p = new Product();
			p.setProduct_name(rset.getString("PRODUCT_NAME"));
			p.setProduct_image(rset.getString("PRUDUCT_IMAGE"));
			p.setProduct_price(rset.getInt("PRODUCT_PRICE"));
			p.setProduct_state(rset.getString("PRODUCT_STATE"));
			p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));
			list2.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		finally		
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return list2;
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
			w.setUSER_WL_PRODUCT_ENTIRE_FK(rset.getInt("USER_WL_PRODUCT_ENTIRE_FK"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return w;
	}

	public int jjimDelete2(wishList w, Connection conn) {
		 PreparedStatement pstmt = null;
	        int result = 0;
	        String query = "delete from USER_WISHLIST_TB where USER_WL_PRODUCT_ENTIRE_FK=?";
	        try {
	            pstmt = conn.prepareStatement(query);
	            pstmt.setInt(1, w.getUSER_WL_PRODUCT_ENTIRE_FK());
	            result = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }finally {
	            JDBCTemplate.close(pstmt);
	        }
	        
	        return result;
	    }

	public Grade gradeInfo(Connection conn, String id) {
		Grade g = new Grade();
		Statement stmt = null;
		ResultSet rset = null;
		String query ="select * from USER_GRADE_TB WHERE USER_GRADE_ID='"+id+"'";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
		while(rset.next()){
		g.setUser_grade_pk(rset.getInt("USER_GRADE_PK"));
		g.setUser_grade_id(rset.getString("USER_GRADE_ID"));
		g.setUser_grade_name(rset.getString("USER_GRADE_NAME"));
		g.setUser_grade_fees(rset.getInt("USER_GRADE_FEES"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return g;
	}

	public ArrayList<purchaseHis> buy(Connection conn, String id) {
		ArrayList<purchaseHis> list = new ArrayList<purchaseHis>();
		purchaseHis ph = new purchaseHis();
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select * from USER_PURCHASE_HIS_TB WHERE USER_PUR_HIS_USER_ENTIRE_ID_FK='"+id+"'";   
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
			ph.setUSER_PUR_HIS_ENTIRE_FK(rset.getInt("USER_PUR_HIS_ENTIRE_FK"));
			list.add(ph);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return list;
	}

	public ArrayList<Product> buy2(Connection conn, ArrayList<purchaseHis> list) {
		ArrayList<Product> list2 = new ArrayList<Product>();
		Statement stmt = null;
		ResultSet rset = null;
		String query ="select product_name,PRUDUCT_IMAGE,product_price,product_state,product_amount from product_entire_tb where PRODUCT_ENTIRE_PK="+list.size(); 
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
			Product p = new Product();
			p.setProduct_name(rset.getString("PRODUCT_NAME"));
			p.setProduct_image(rset.getString("PRUDUCT_IMAGE"));
			p.setProduct_price(rset.getInt("PRODUCT_PRICE"));
			p.setProduct_state(rset.getString("PRODUCT_STATE"));
			p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));
			list2.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		finally		
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return list2;
	}
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
}
