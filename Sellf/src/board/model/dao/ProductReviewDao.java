package board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.model.service.ProductReviewService;
import board.model.vo.ProductReview;
import common.JDBCTemplate;

public class ProductReviewDao {

	public ArrayList<ProductReview> getCurrentPage(Connection conn, int currentPage, int recordCountPerPage) {
		// TODO Auto-generated method stub
		return null;
	}

	public String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ProductReview productReviewSelect(Connection conn, int user_rv_pk) {
		// TODO Auto-generated method stub
		return null;
	}



}
