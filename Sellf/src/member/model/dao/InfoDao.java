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

public class InfoDao {

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
		System.out.println(userId);
		System.out.println(userPwd);
        String query = "update USER_ENTIRE_TB set USER_NAME=?,USER_PWD=?,USER_PHONE=?,USER_BIRTH=?,USER_GENDER=?,USER_ADDR=?,USER_ENTIRE_USER_GRADE_ID_FK=?,USER_EMAIL=?,USER_INTEREST=?, USER_EPOINT=? where User_id=? AND user_pwd=?";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, "null");
            pstmt.setString(2, "null");
            pstmt.setString(3, "000-0000-0000");
            pstmt.setString(4, "00/00");
            pstmt.setString(5, "Z");
            pstmt.setString(6, "null");
            pstmt.setString(7, "G00");
            pstmt.setString(8,"null");
            pstmt.setString(9,"null");
            pstmt.setInt(10, 0);
            pstmt.setString(11, userId);
            pstmt.setString(12, userPwd);
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
			p.setProduct_name(rset.getString("PRODUCT_NAME"));  //?대쫫
		    p.setProduct_image(rset.getString("PRUDUCT_IMAGE")); //?대?吏
			p.setProduct_price(rset.getInt("PRODUCT_PRICE"));  //媛寃?
			p.setProduct_state(rset.getString("PRODUCT_STATE"));  //?곹깭
			p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));  //媛?닔
			list.add(p);
			System.out.println(list);
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
			p.setProduct_entire_pk(rset.getInt("PRODUCT_ENTIRE_PK")); //?곹뭹?몃뜳??
			p.setProduct_name(rset.getString("PRODUCT_NAME"));  //?대쫫
			p.setProduct_image(rset.getString("PRUDUCT_IMAGE")); //?대?吏
			p.setProduct_price(rset.getInt("PRODUCT_PRICE"));  //媛寃?
			p.setProduct_state(rset.getString("PRODUCT_STATE"));  //?곹깭
			p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));  //媛?닔
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
	public ArrayList<Product> Buy(Connection conn, String id) {
		ArrayList<Product> list = new ArrayList<Product>();
		Statement stmt = null;
		ResultSet rset = null;
		String query ="select product_entire_pk, product_name,PRUDUCT_IMAGE,product_price,ORDER_STATE,product_amount from (select * from order_tb, product_entire_Tb where order_product_entire_fk = product_entire_pk) where order_user_entire_id_fk='"+id+"'";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
			Product p = new Product();
			p.setProduct_entire_pk(rset.getInt("PRODUCT_ENTIRE_PK")); //?곹뭹?몃뜳??
			p.setProduct_name(rset.getString("PRODUCT_NAME"));  //?대쫫
			p.setProduct_image(rset.getString("PRUDUCT_IMAGE")); //?대?吏
			p.setProduct_price(rset.getInt("PRODUCT_PRICE"));  //媛寃?
			p.setProduct_state(rset.getString("ORDER_STATE"));  //?곹깭
			p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));  //媛?닔
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

	public int delete(Connection conn, int deleteNo, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from user_wishlist_tb where user_wl_product_entire_fk=? and user_wl_user_entire_id_fk=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, deleteNo);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
JDBCTemplate.close(pstmt);
		}
	return result;
	}
	
	public ArrayList<Product> myCartList(Connection conn, String id, int cartNo) {
			Statement stmt = null;
			ResultSet rset =  null;
			ArrayList<Product> list = new ArrayList<Product>();
			Product cartListProduct = null;
			String query = "SELECT * FROM PRODUCT_ENTIRE_TB JOIN USER_WISHLIST_TB ON (USER_WL_PRODUCT_ENTIRE_FK = PRODUCT_ENTIRE_PK) WHERE USER_WISHLIST_TB.USER_WL_USER_ENTIRE_ID_FK = '"+id+"' and PRODUCT_ENTIRE_PK="+cartNo;
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

	public int cash(Connection conn, String id, int cash3) {
		  PreparedStatement pstmt = null;
	        int result = 0;
	        String query = "update USER_ENTIRE_TB set user_ePoint=? where User_id=?";
	        System.out.println(query);
	        try {
	            pstmt = conn.prepareStatement(query);
	            pstmt.setInt(1, cash3);
	            pstmt.setString(2, id);
	            result = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }finally {
	            JDBCTemplate.close(pstmt);        
	        }
	        return result;
	    }
}
