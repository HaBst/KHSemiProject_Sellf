package product.model.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;


import product.model.dao.ProductInsertDao;
import product.model.vo.PageData;
import product.model.vo.ProductInsert;

public class ProductInsertService {

	public int productInsert(ProductInsert pi) {
		Connection conn = null;
		int result = 0;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sellfadmin","sellfadmin");
			System.out.println(conn);
			
			result = new ProductInsertDao().productInsert(conn,pi);
			
			if(result>0) {
				conn.commit();
			}else {
				conn.rollback();
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

	

}
