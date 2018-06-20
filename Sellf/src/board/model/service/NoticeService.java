package board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.NoticeDao;
import board.model.vo.Notice;
import board.model.vo.NoticeComment;
import board.model.vo.NoticePageData;
import common.JDBCTemplate;

public class NoticeService {

public NoticeService() {}
	public NoticePageData noticeAll(int currentPage) //공지사항 게시물 전체보기 페이징처리 메소드 
	{
		Connection conn = JDBCTemplate.getConnection();
		
		int recordCountPerPage = 5; //한페이지당 보이는 게시물의 수 
		int naviCountPerPage = 5; //현재 위치 중심으로 시작 navi부터 끝 navi까지의 개수 
		
		ArrayList<Notice> list = new NoticeDao().getCurrentPage(conn,currentPage,recordCountPerPage);
		System.out.println(list);
								//DB 가서 현재 페이지, 몇개의 게시물 보여줄것인지 
		String NoticePageNavi = new NoticeDao().getPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage);
		NoticePageData npd= null; 
		if(!list.isEmpty() && !NoticePageNavi.isEmpty())
		{
			npd = new NoticePageData();
			npd.setNoticeList(list);
			npd.setNoticePageNavi(NoticePageNavi);
		}
		JDBCTemplate.close(conn);
		return npd;
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
