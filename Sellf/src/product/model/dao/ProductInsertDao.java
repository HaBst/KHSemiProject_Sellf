package product.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import product.model.vo.ProductInsert;

public class ProductInsertDao {
	private Properties prop = new Properties();
	public ProductInsertDao() {
		try {
			prop.load(new FileReader("resource/query.properties")); //properties 파일 경로
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int productInsert(Connection conn, ProductInsert pi) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertProduct");
		System.out.println(query);
//		(?,?,?,?,?,?,sysdate,?,?,?,?,?)
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "1");
			pstmt.setString(2, pi.getProductName());
			pstmt.setString(3, pi.getProductCategory());
			pstmt.setString(4, pi.getProductItem());
			pstmt.setString(5, pi.getProductInfo());
			pstmt.setInt(6, pi.getProductCount());
			pstmt.setString(7, "as");
			pstmt.setString(8, pi.getProductBuyInfo());
			pstmt.setInt(9, pi.getProductPrice());
			pstmt.setDate(10, pi.getProductBuyDate());
			pstmt.setString(11, pi.getContent());
			
			result = pstmt.executeUpdate();
			System.out.println("result"+result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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

	

}
