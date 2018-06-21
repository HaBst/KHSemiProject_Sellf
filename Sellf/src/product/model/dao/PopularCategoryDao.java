package product.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import product.model.vo.ProductCategorySubTb;


public class PopularCategoryDao {


	public ArrayList<ProductCategorySubTb> popularCategoryList(Connection conn) {
		Statement stmt = null;
		ResultSet rset= null;
		ArrayList<ProductCategorySubTb> list = new ArrayList<>();
		ProductCategorySubTb pcst = null;
		String query = "SELECT * FROM PRODUCT_CATEGORY_SUB_TB RIGHT JOIN (SELECT pro_row.* FROM (SELECT * FROM PRODUCT_SELL_TB ORDER BY PRODUCT_SELL_COUNT DESC) pro_row where rownum<=6) ON (PRODUCT_CATEGORY_SUB_ID = PRODUCT_ENTIRE_CATE_SUB_ID_FK) ORDER BY PRODUCT_SELL_COUNT DESC";
		try {
			
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
		
			while(rset.next()) {
				pcst = new ProductCategorySubTb();
				pcst.setProductCategorySubName(rset.getString("PRODUCT_CATEGORY_SUB_NAME"));
				pcst.setProductCategorySubId(rset.getString("PRODUCT_CATEGORY_SUB_ID"));
				list.add(pcst);	
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
