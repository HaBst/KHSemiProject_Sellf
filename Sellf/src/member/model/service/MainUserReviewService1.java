package member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.dao.MainUserReviewDao1;
import member.model.vo.UserReview;

public class MainUserReviewService1 {

	public ArrayList<UserReview> MainUserReviewList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<UserReview> list = new MainUserReviewDao1().MainUserReviewList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

}
