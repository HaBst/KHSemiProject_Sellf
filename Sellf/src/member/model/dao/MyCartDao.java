package member.model.dao;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.vo.UserCartList;
import product.model.vo.Product;

public class MyCartDao {

	public ArrayList<Product> myCartList(Connection conn) {
		Statement stmt = null;
		ResultSet rset =  null;
		ArrayList<Product> list = new ArrayList<Product>();
		Product cartListProduct = null;
		String query = "SELECT *FROM PRODUCT_ENTIRE_TB JOIN USER_WISHLIST_TB ON (USER_WL_PRODUCT_ENTIRE_FK = PRODUCT_ENTIRE_PK) WHERE USER_WISHLIST_TB.USER_WL_USER_ENTIRE_ID_FK = 'mslove11'";
 		//String query = "SELECT USER_WISHLIST_TB.USER_WL_USER_ENTIRE_ID_FK, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_AMOUNT, PRODUCT_STATE, PRODUCT_ENTIRE_USER_ID_FK FROM PRODUCT_ENTIRE_TB  JOIN USER_WISHLIST_TB ON (USER_WL_PRODUCT_ENTIRE_FK = PRODUCT_ENTIRE_PK) WHERE USER_WISHLIST_TB.USER_WL_USER_ENTIRE_ID_FK = SELECT USER_WISHLIST_TB.USER_WL_USER_ENTIRE_ID_FK, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_AMOUNT, PRODUCT_STATE, PRODUCT_ENTIRE_USER_ID_FK FROM PRODUCT_ENTIRE_TB  JOIN USER_WISHLIST_TB ON (USER_WL_PRODUCT_ENTIRE_FK = PRODUCT_ENTIRE_PK) WHERE USER_WISHLIST_TB.USER_WL_USER_ENTIRE_ID_FK = 'mslove11'";
		
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

}
