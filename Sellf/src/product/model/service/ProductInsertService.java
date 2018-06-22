package product.model.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import product.model.dao.ProductInsertDao;
import product.model.vo.CateBig;
import product.model.vo.CateSmall;
import product.model.vo.PageData;
import product.model.vo.ProductInsert;

public class ProductInsertService {

	public int productInsert(ProductInsert pi) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		System.out.println(conn);
		result = new ProductInsertDao().productInsert(conn, pi);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
		
	}

	public PageData searchSub(String searchSub, int currentPage) {
		Connection conn = null;

		int recordCountPerPage = 16;
		int naviCountPerPage = 5;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sellfadmin","sellfadmin");
			System.out.println(conn);
			
			ArrayList<ProductInsert>list = new ProductInsertDao().getsearchSub(conn,currentPage,recordCountPerPage,searchSub);
			
			String pageNavi = new ProductInsertDao().getSearchPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage, searchSub);
			
			PageData pd = null;
			if(!list.isEmpty() && !pageNavi.isEmpty()) {
				pd = new PageData();
				pd.setProductList(list);
				pd.setPageNavi(pageNavi);
			}
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return pd;
	}

	public ArrayList<CateBig> productBigCate() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<CateBig>list = new ProductInsertDao().productBigCate(conn);
		
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
		
	}

	public ArrayList<CateSmall> productSmallCate(String cateBig) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<CateSmall>list = new ProductInsertDao().productSmallCate(conn,cateBig);
		
		if(list.isEmpty()) {
			System.out.println("비었습니다.");
			return null;
		}else {
			return list;
		}
		
	}

	

}
