package member.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.vo.UserReview;
import product.model.vo.Product;

public class MainUserReviewDao1 {

	public ArrayList<UserReview> MainUserReviewList(Connection conn) {
	
		Statement stmt = null;
		ResultSet rset = null;
		UserReview ur = null;
		ArrayList<UserReview> list = new ArrayList<UserReview>();
		String query ="SELECT  * FROM USER_REVIEW_TB WHERE LENGTH(USER_REVIEW_COMMENT)>40"
					+ " AND USER_REVIEW_COMMENT LIKE '%감사%'"
					+ " OR USER_REVIEW_COMMENT LIKE '%좋아%' AND USER_REVIEW_RATING>4.0 AND ROWNUM<=3";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			while (rset.next()) {

				ur = new UserReview();
				ur.setUserReviewComment(rset.getString("USER_REVIEW_COMMENT"));
				ur.setUserReviewDate(rset.getDate("USER_REVIEW_DATE"));
				ur.setUserReviewPk(rset.getInt("USER_RV_PK"));
				ur.setUserReviewProductEntireFk(rset.getInt("USER_RV_PRODUCT_ENTIRE_FK"));
				ur.setUserReviewRating(rset.getInt("USER_REVIEW_RATING"));
				ur.setUserReviewUserEntireIdFk(rset.getString("USER_RV_USER_ENTIRE_ID_FK"));
				ur.setUserReviewUserEntireReviewedIdFk(rset.getString("USER_RV_USER_ENTIRE_RVED_ID_FK"));
				list.add(ur);
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
