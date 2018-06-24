package member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.dao.UserReviewDao;
import member.model.vo.ReviewPageData;
import member.model.vo.UserReview;

public class UserReviewService {

	public ReviewPageData sellerReviewAll(int currentPage, String id) {
		Connection conn = JDBCTemplate.getConnection();

		int recordCountPerPage = 5;
		
		int naviCountPerPage = 5;
		
		ArrayList<UserReview> reviewList = new UserReviewDao().getCurrnetPage(conn, currentPage, recordCountPerPage,id);
		
		String pageNavi = new UserReviewDao().getPageNavi(conn, currentPage, recordCountPerPage,naviCountPerPage,id);

		ReviewPageData rpd = null;
		if(!reviewList.isEmpty() && !pageNavi.isEmpty())
		{
			rpd = new ReviewPageData();
			rpd.setReviewList(reviewList);
			rpd.setPageNavi(pageNavi);
		}
		
		JDBCTemplate.close(conn);
		
		return rpd;
	}

	public int reviewComment(int point, String reviewComment) {
		// TODO Auto-generated method stub
		return 0;
	}

}
