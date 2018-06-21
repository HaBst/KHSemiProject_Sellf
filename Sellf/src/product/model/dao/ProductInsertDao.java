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
//	private Properties prop = new Properties();
//	public ProductInsertDao() {
//		try {
//			prop.load(new FileReader("resource/query.properties")); //properties 파일 경로
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
	
	public int productInsert(Connection conn, ProductInsert pi) {
		PreparedStatement pstmt = null;
		int result = 0;
		
//		String query = prop.getProperty("insertProduct");
		String query = "insert into product_entire_tb values(product_entire_tb_SEQ.NEXTVAL,?,?,?,?,?,이미지,?,S,?,?)";
		
		System.out.println(query);
//		(?,?,?,?,?,?,sysdate,?,?,?,?,?)
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pi.getProductEntireUserIdFK());
			pstmt.setString(2, pi.getProductEntireCateMainIdFK());
			pstmt.setString(3, pi.getProductEntireCateSubIdFK());
			pstmt.setString(4, pi.getProductName());
			pstmt.setInt(5, pi.getProductPrice());
			
			pstmt.setInt(6, pi.getProductAmount());
			
			pstmt.setString(7, pi.getProductGrade());
			pstmt.setString(8,pi.getProductDetail());
			
			result = pstmt.executeUpdate();
			System.out.println("result"+result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
		
	}

	public ArrayList<ProductInsert> getsearchSub(Connection conn, int currentPage, int recordCountPerPage,
			String searchSub) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		
		int start = currentPage * recordCountPerPage - (recordCountPerPage -1);
		int end = currentPage * recordCountPerPage;
		
		String query = "select * from (select PRODUCT_ENTIRE_TB.*,row_number() "
					+ "over(order by PRODUCT_ENTIRE_PK desc) as num "
					+ "from PRODUCT_ENTIRE_TB where PRODUCT_NAME like ?) "
					+ "where num between ? and ?";
		ArrayList<ProductInsert>list = new ArrayList<ProductInsert>();
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, "%"+searchSub+"%");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProductInsert pi = new ProductInsert();
				pi.setProductNo(rset.getInt("PRODUCT_ENTIRE_PK"));
				pi.setProductName(rset.getString("PRODUCT_NAME"));
				pi.setContent(rset.getString("PRODUCT_DETAIL"));
				pi.setProductSellerId(rset.getString("PRODUCT_ENTIRE_USER_ID_FK"));
				pi.setProductPrice(rset.getInt("PRODUCT_PRICE"));
				pi.setProductCount(rset.getInt("PRODUCT_AMOUNT"));
				list.add(pi);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				rset.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
	}

	public String getSearchPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage,
			String searchSub) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int recordTotalCount = 0;
		
		String query = "select count(*)as totalcount from PRODUCT_ENTIRE_TB where PRODUCT_NAME like ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+searchSub+"%");
			rset = pstmt.executeQuery();
			if(rset.next()) {
				recordTotalCount = rset.getInt("totalCount");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				rset.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int pageTotalCount = 0;
		
		if(recordTotalCount % recordCountPerPage !=0) {
			pageTotalCount = recordTotalCount / recordCountPerPage +1;
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}
		
		
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage>pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		
		int endNavi = startNavi + naviCountPerPage -1;
		
		if(endNavi>pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1) {
			needPrev =false;
		}
		if(endNavi == pageTotalCount) {
			needNext=false;
		}
		
		
		StringBuilder sb = new StringBuilder();
		if(needPrev) {
			sb.append("<a href='/searchSub?searcSub="+searchSub+"&currentPage"+(startNavi-1)+"')> < </a>");
		}
		for(int i = startNavi; i<=endNavi; i++) {
			if(i ==currentPage) {
				sb.append("<a href='/searchSub?searchSub="+searchSub+"&currentPage="+i+"'><b>"+i+"</b></a>");
			}else {
				sb.append("<a href='/searchSub?searchSub="+searchSub+"&currentPage="+i+"'>"+i+"</a>");
			}
		}
		
		if(needNext) {
			sb.append("<a href='/searchSub?searcSub="+searchSub+"&currentPage"+(endNavi+1)+"')> < </a>");
		}
		return sb.toString();
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
