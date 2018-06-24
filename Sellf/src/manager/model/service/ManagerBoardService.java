package manager.model.service;

import manager.model.dao.ManagerBoardDao;
import manager.model.vo.ManagerBoard;
import manager.model.vo.ManagerBoardPageData;

import java.sql.*;
import java.util.*;
import common.JDBCTemplate;
public class ManagerBoardService {

	public ManagerBoardPageData noticeBoardSelect(int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		
		int recordCountPerPage = 10; //1. 1�������� 10����
		int naviCountPerPage = 5; //2. �׺�� 5����
		
		ArrayList<ManagerBoard>list = new ManagerBoardDao().getCurrentPage(conn,currentPage,recordCountPerPage);
		String pageNavi = new ManagerBoardDao().getPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage);
		ManagerBoardPageData mbpd = null;
		if(!list.isEmpty() && !pageNavi.isEmpty())
		{
			mbpd = new ManagerBoardPageData();
			mbpd.setBoardList(list);
			mbpd.setPageNavi(pageNavi);
		}
		JDBCTemplate.close(conn);
		return mbpd;
	}

	public ManagerBoard noticeSelect(int noticeNo) { //공지사항 제목 클릭하여 글내용을 보고자 할때
		Connection conn = JDBCTemplate.getConnection();
		ManagerBoard mb = new ManagerBoardDao().noticeSelect(conn,noticeNo);
		JDBCTemplate.close(conn);
		return mb;
	}

	public int writeNotice(String writeTitle, String writeContent) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ManagerBoardDao().writeNotice(conn,writeTitle,writeContent);
		if(result>0)
		{
			JDBCTemplate.commit(conn); //insert가 정상적으로 되었다면 commit
		}else {
			JDBCTemplate.rollback(conn); //insert가 안되었다면 rollback
		} 	
		JDBCTemplate.close(conn);
		
		return result;
	}

}
