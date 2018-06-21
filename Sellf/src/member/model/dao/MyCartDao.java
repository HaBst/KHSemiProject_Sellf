package member.model.dao;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.vo.UserCartList;

public class MyCartDao {

	public ArrayList<UserCartList> myCartList(Connection conn) {
		Statement stmt = null;
		ResultSet rset =  null;
		ArrayList<UserCartList> list = new ArrayList<UserCartList>();
		UserCartList userCart = null;
		String query = "SELECT * FROM USER_CART_LIST";
		// String query = "SELECT * FROM USER_CART_LIST WHERE USER_ENTIRE_PK  = ?";
		
		try {
			stmt = conn.createStatement();
			rset= stmt.executeQuery(query);
			
			while(rset.next()) {
				userCart = new UserCartList();
				userCart.setImage(rset.getString("PRUDUCT_IMAGE"));
				userCart.setPrice(rset.getString("PRODUCT_PRICE"));
				userCart.setUserEntirePk(rset.getString("USER_ENTIRE_PK"));
				userCart.setProductAmount(rset.getInt("PRODUCT_AMOUNT"));
				userCart.setProductDetail(rset.getString("PRODUCT_DETAIL"));
				userCart.setProductEntireFk(rset.getInt("PRODUCT_ENTIRE_FK"));
				userCart.setProductName(rset.getString("PRODUCT_NAME"));
				list.add(userCart);
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

}
