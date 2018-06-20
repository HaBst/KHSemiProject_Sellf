package product.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import product.model.vo.Category;

public class CategoryDao {

	public ArrayList<Category> getCateList(Connection conn) {
		Statement stmt =null;
		ResultSet rset = null;
		String query = "select * from product_category_sub_tb";
		ArrayList<Category> list = new ArrayList<Category>();
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next())
			{
				Category c = new Category();
				c.setSub_menu(rset.getString("product_cate_sub_sub_id_fk"));
				c.setName(rset.getString("product_category_sub_name"));
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return list;
	}

}
