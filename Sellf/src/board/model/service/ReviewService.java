package board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.FaqDao;
import board.model.dao.NoticeDao;
import board.model.dao.ProductReviewDao;
import board.model.vo.Faq;
import board.model.vo.FaqPageData;
import board.model.vo.Notice;
import board.model.vo.NoticeComment;
import board.model.vo.NoticePageData;
import board.model.vo.ProductReview;
import board.model.vo.ProductReviewPageData;
import common.JDBCTemplate;

public class ReviewService {

public ReviewService() {}
	public ProductReviewPageData reviewAll(int currentPage) //공지사항 게시물 전체보기 페이징처리 메소드 
	{
		Connection conn = JDBCTemplate.getConnection();
		
		int recordCountPerPage = 5; //한페이지당 보이는 게시물의 수 
		int naviCountPerPage = 5; //현재 위치 중심으로 시작 navi부터 끝 navi까지의 개수 
		
		ArrayList<ProductReview> list = new ProductReviewDao().getCurrentPage(conn,currentPage,recordCountPerPage);
								//DB 가서 현재 페이지, 몇개의 게시물 보여줄것인지 
		String ReviewPageNavi = new ProductReviewDao().getPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage);
		ProductReviewPageData rpd= null; 
		if(!list.isEmpty() && !ReviewPageNavi.isEmpty())
		{
			rpd = new ProductReviewPageData();
			rpd.setProductReviewList(list);
			rpd.setProductReviewPageNavi(ReviewPageNavi);
		}
		JDBCTemplate.close(conn);
		return rpd;
	}
	public Notice noticeSelect(int notice_pk) {
		Connection conn = JDBCTemplate.getConnection();
		Notice notice = new NoticeDao().noticeSelect(conn,notice_pk);
		JDBCTemplate.close(conn);
		return notice;		
		
	}
	public ArrayList<NoticeComment> noticeComment(int notice_pk) 
	{
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<NoticeComment> list = new NoticeDao().noticeComment(conn, notice_pk);
		JDBCTemplate.close(conn);
		return list; 
	}
	
	
}
