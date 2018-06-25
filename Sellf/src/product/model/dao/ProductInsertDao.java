package product.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import common.JDBCTemplate;
import product.model.vo.CateBig;
import product.model.vo.CateSmall;
import product.model.vo.ProductInsert;

public class ProductInsertDao {
	
	public int productInsert(Connection conn, ProductInsert pi) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into product_entire_tb values(product_entire_tb_SEQ.NEXTVAL,?,?,?,?,?,?,?,'S',?,?,sysdate)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pi.getProductEntireUserIdFK());
			pstmt.setString(2, pi.getProductEntireCateMainIdFK());
			pstmt.setString(3, pi.getProductEntireCateSubIdFK());
			pstmt.setString(4, pi.getProductName());
			pstmt.setInt(5, pi.getProductPrice());
			pstmt.setString(6, pi.getProductImage().getImgArr().toString());
			pstmt.setInt(7, pi.getProductAmount());
			
			pstmt.setString(8, pi.getProductOldNew());
			pstmt.setString(9,pi.getProductDetail().getDetailArr().toString());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
		
	}

	public ArrayList<CateBig> productBigCate(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<CateBig>list = null;
		
		String query = "select product_category_name,product_category_id from product_category_main_tb";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<CateBig>();
			while(rset.next()) {
				CateBig cb = new CateBig();
				cb.setProductCategoryId(rset.getString("PRODUCT_CATEGORY_ID"));
				cb.setProductCateGoryName(rset.getString("PRODUCT_CATEGORY_NAME"));
				list.add(cb);
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

	public ArrayList<CateSmall> productSmallCate(Connection conn, String cateBig) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CateSmall>list = new ArrayList<CateSmall>();
		
		String query = "select product_category_sub_name,product_category_sub_id from product_category_sub_tb where product_cate_sub_main_id_fk = ?";
		try {
			pstmt =conn.prepareStatement(query);
			pstmt.setString(1, cateBig);
			rset = pstmt.executeQuery();
			
		
			while(rset.next()) {
				CateSmall cs = new CateSmall();
				cs.setProductCategorySubId(rset.getString("PRODUCT_CATEGORY_SUB_ID"));
				cs.setProductCategorySubName(rset.getString("PRODUCT_CATEGORY_SUB_NAME"));
				list.add(cs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
		
	}


	

}
