package product.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import product.model.vo.ProductCategorySubTb;
import product.model.vo.ProductSellTb;

public class PopularCategoryDao {


	public ArrayList<ProductCategorySubTb> popularCategoryList(Connection conn) {
		Statement stmt = null;
		ResultSet rset= null;
		ArrayList<ProductCategorySubTb> list = new ArrayList<>();
		ProductCategorySubTb pcst = null;
	String query = "SELECT pro_row.PRODUCT_ENTIRE_CATE_SUB_ID_FK FROM (SELECT * FROM PRODUCT_SELL_TB ORDER BY PRODUCT_SELL_COUNT DESC) pro_row where rownum<=6";
		/*String query ="select * from (select * from product_sell_tb order by product_sell_count desc) "
				+ " JOIN product_category_sub_tb ON(PRODUCT_ENTIRE_CATE_MAIN_ID_FK = PRODUCT_CATE_SUB_MAIN_ID_FK) where rownum<=6";
		*/
		// String query = "select PRODUCT_ENTIRE_CATE_MAIN_ID_FK from  (select * from product_sell_tb order by product_sell_count desc) where rownum<=6";
		/*select * from product_sell_tb where rownum <4 order by product_sell_count;	--> 영훈 오빠가 준 코드 참고! */
		try {
			
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				pcst = new ProductCategorySubTb();
				pcst.setProductCategorySubName(rset.getString("PRODUCT_CATEGORY_SUB_NAME"));
				pcst.setProductCategorySubId(rset.getString("PRODUCT_CATEGORY_SUB_ID"));
				list.add(pcst);
				System.out.println("pcst"+pcst.getProductCategorySubId());
				
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
