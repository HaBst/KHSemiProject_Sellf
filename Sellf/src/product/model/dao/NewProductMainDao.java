package product.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import product.model.vo.Product;

public class NewProductMainDao {

	public ArrayList<Product> updateNewProductImg(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		Product p = null;
		ArrayList<Product> list = new  ArrayList<Product>();
		//String query = "select *from PRODUCT_ENTIRE_TB where product_name = '아이폰x256'";
		String query = "select * from PRODUCT_ENTIRE_TB where rownum <=12 order by PRODUCT_ENTIRE_PK desc";
		System.out.println("try밖");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
	
			while(rset.next()) {
			p = new Product();
			p.setProduct_entire_pk(rset.getInt("PRODUCT_ENTIRE_PK"));
			p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));
			p.setProduct_entire_category_main_id_fk(rset.getString("PRODUCT_ENTIRE_CATE_MAIN_ID_FK"));
			p.setProduct_entire_category_sub_id_fk(rset.getString("PRODUCT_ENTIRE_CATE_SUB_ID_FK"));
			p.setProduct_entire_user_entire_id_fk(rset.getString("PRODUCT_ENTIRE_USER_ID_FK"));
			p.setProduct_name(rset.getString("PRODUCT_NAME"));
			p.setProduct_price(rset.getInt("PRODUCT_PRICE"));
			p.setProduct_state(rset.getString("PRODUCT_STATE"));
			p.setProduct_image(rset.getString("PRUDUCT_IMAGE"));

			list.add(p);
			}
		} catch (SQLException e) {
	
			e.printStackTrace();
		}finally {
	
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return list;	
	}

}
