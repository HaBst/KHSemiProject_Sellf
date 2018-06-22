package product.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import product.model.vo.Product;
import product.model.vo.ProductSellTb;

public class PopularProductDao {

	public ArrayList<Product> popularProductList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		Product p = null;
		ArrayList<Product> list = new ArrayList<Product>();
		String query = "SELECT *FROM PRODUCT_ENTIRE_TB WHERE  PRODUCT_ENTIRE_CATE_SUB_ID_FK = (SELECT pro_row.PRODUCT_ENTIRE_CATE_SUB_ID_FK FROM "
				+ "(SELECT * FROM PRODUCT_SELL_TB ORDER BY PRODUCT_SELL_COUNT DESC) pro_row where rownum=1) ORDER BY PRODUCT_ENTIRE_PK DESC";
																													
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			while (rset.next()) {
				p = new Product();
				p.setProduct_entire_pk(rset.getInt("PRODUCT_ENTIRE_PK"));
				p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));
				p.setProduct_entire_category_main_id_fk(rset.getString("PRODUCT_ENTIRE_CATE_MAIN_ID_FK"));
				p.setProduct_entire_category_sub_id_fk(rset.getString("PRODUCT_ENTIRE_CATE_SUB_ID_FK"));
				p.setProduct_entire_user_entire_id_fk(rset.getString("PRODUCT_ENTIRE_USER_ID_FK"));
				p.setProduct_name(rset.getString("PRODUCT_NAME"));
				p.setProduct_price(rset.getInt("PRODUCT_PRICE"));
				p.setProduct_state(rset.getString("PRODUCT_STATE"));
				list.add(p);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return list;
	}

	public ArrayList<Product> popularProductList2(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		Product p = null;

		ArrayList<Product> list = new ArrayList<Product>();
		String query = "SELECT * FROM PRODUCT_ENTIRE_TB  WHERE PRODUCT_STATE = 'S' AND PRODUCT_ENTIRE_CATE_SUB_ID_FK = (SELECT PRODUCT_ENTIRE_CATE_SUB_ID_FK "
				+ " FROM (select * from PRODUCT_SELL_TB order by product_sell_count) "
				+ " where rownum = 2) AND ROWNUM <= 4 ORDER BY PRODUCT_ENTIRE_PK DESC";
		// String query = "select * from product_entire_tb left join product_sell_tb
		// using(PRODUCT_ENTIRE_CATE_MAIN_ID_FK) order by product_sell_count desc";

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			while (rset.next()) {
				p = new Product();
				p.setProduct_entire_pk(rset.getInt("PRODUCT_ENTIRE_PK"));
				p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));
				p.setProduct_entire_category_main_id_fk(rset.getString("PRODUCT_ENTIRE_CATE_MAIN_ID_FK"));
				p.setProduct_entire_category_sub_id_fk(rset.getString("PRODUCT_ENTIRE_CATE_SUB_ID_FK"));
				p.setProduct_entire_user_entire_id_fk(rset.getString("PRODUCT_ENTIRE_USER_ID_FK"));
				p.setProduct_name(rset.getString("PRODUCT_NAME"));
				p.setProduct_price(rset.getInt("PRODUCT_PRICE"));
				p.setProduct_state(rset.getString("PRODUCT_STATE"));
				list.add(p);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return list;
	}

	public ArrayList<Product> popularProductList3(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		Product p = null;

		ArrayList<Product> list = new ArrayList<Product>();
		String query = "SELECT * FROM PRODUCT_ENTIRE_TB  WHERE PRODUCT_STATE = 'S' AND PRODUCT_ENTIRE_CATE_SUB_ID_FK = (SELECT PRODUCT_ENTIRE_CATE_SUB_ID_FK "
				+ " FROM (select * from PRODUCT_SELL_TB order by product_sell_count) "
				+ " where rownum = 3) AND ROWNUM <= 4 ORDER BY PRODUCT_ENTIRE_PK DESC";
		// String query = "select * from product_entire_tb left join product_sell_tb
		// using(PRODUCT_ENTIRE_CATE_MAIN_ID_FK) order by product_sell_count desc";

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			while (rset.next()) {
				p = new Product();
				p.setProduct_entire_pk(rset.getInt("PRODUCT_ENTIRE_PK"));
				p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));
				p.setProduct_entire_category_main_id_fk(rset.getString("PRODUCT_ENTIRE_CATE_MAIN_ID_FK"));
				p.setProduct_entire_category_sub_id_fk(rset.getString("PRODUCT_ENTIRE_CATE_SUB_ID_FK"));
				p.setProduct_entire_user_entire_id_fk(rset.getString("PRODUCT_ENTIRE_USER_ID_FK"));
				p.setProduct_name(rset.getString("PRODUCT_NAME"));
				p.setProduct_price(rset.getInt("PRODUCT_PRICE"));
				p.setProduct_state(rset.getString("PRODUCT_STATE"));
				list.add(p);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return list;
	}
}
