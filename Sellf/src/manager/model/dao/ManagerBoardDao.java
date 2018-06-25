package manager.model.dao;

import java.sql.*;

import java.util.ArrayList;

import common.JDBCTemplate;
import manager.model.vo.ManagerBoard;

public class ManagerBoardDao {

	public ArrayList<ManagerBoard> getCurrentPage(Connection conn, int currentPage, int recordCountPerPage) {
		PreparedStatement pstmt = null; //
		ResultSet rset = null;
		ArrayList <ManagerBoard> boardList = new ArrayList<ManagerBoard>();
		ManagerBoard mb = null;
		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1); //처음 시작 페이지
		int end = currentPage*recordCountPerPage;	//마지막 페이지 
		String query = "select notice_pk, notice_main_admin_id_fk,notice_subject,notice_content,notice_registration_date, notice_views_count from " + 
				"(select board_notice_tb.*,row_number() over(order by notice_pk  desc) as num from board_notice_tb) " + 
				"where num between  ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,start);
			pstmt.setInt(2,end);
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				mb = new ManagerBoard();
				mb.setBoardNo(rset.getInt("notice_pk"));
				mb.setWriteId("관리자");
				mb.setSubject(rset.getString("notice_subject"));
				mb.setContent(rset.getString("notice_content"));
				mb.setWriteDate(rset.getDate("notice_registration_date"));
				mb.setViewsCount(rset.getInt("notice_views_count"));
				boardList.add(mb);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return boardList;
	}

	public String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int recordTotalCount = 0;
		String query = "select count(*)as totalCount from board_notice_tb";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			rset.next();
			recordTotalCount = rset.getInt("totalCount");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
	
		int pageTotalCount = 0; //navi ��Ż ī��Ʈ
		if(recordTotalCount % recordCountPerPage!=0)
		{
			pageTotalCount = recordTotalCount / recordCountPerPage+1;
		}else
		{
			pageTotalCount = recordTotalCount / recordCountPerPage;	
		}
		
		if(currentPage<1)
		{
			currentPage = 1;
		}else if(currentPage>pageTotalCount)
		{
			currentPage = pageTotalCount;
		}
		
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount)
		{
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		
		if(startNavi==1)
		{
			needPrev = false;
		}
		
		if(endNavi==pageTotalCount)
		{
			needNext = false;
		}
		
		StringBuilder sb = new StringBuilder();
		if(needPrev) //������ 1�������� �ƴϸ�?
		{
		 sb.append("<a href='/managerNoticeBoard?currentPage="+(startNavi-1)+"'> < </a>");	
		}
		for(int i=startNavi;i<=endNavi;i++)
		{
			if(i==currentPage)
			{
				sb.append("<a href='/managerNoticeBoard?currentPage="+i+"'> <B>"+i+"</B> </a>");
			}else
			{
				sb.append("<a href='/managerNoticeBoard?currentPage="+i+"'>" + i +"</a>");
			}
		}
		if(needNext)           //�������� �ƴϸ�?
		{
			sb.append("<a href='/managerNoticeBoard?currentPage="+(endNavi+1)+"'> > </a>");
		}
		return sb.toString();
	}

	public ManagerBoard noticeSelect(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ManagerBoard mb =null;
		String query = "select notice_pk,notice_subject,notice_content,notice_registration_date,notice_views_count from board_notice_tb where notice_pk=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				mb = new ManagerBoard();
				mb.setBoardNo(rset.getInt("notice_pk"));
				mb.setWriteId("관리자"); //공지사항은 관리자만 작성 가능!
				mb.setSubject(rset.getString("notice_subject"));
				mb.setContent(rset.getString("notice_content"));
				mb.setWriteDate(rset.getDate("notice_registration_date"));
				mb.setViewsCount(rset.getInt("notice_views_count"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return mb;
	}

	public int writeNotice(Connection conn, String writeTitle, String writeContent) { //공지사항 db에 삽입하는 메소드.
		PreparedStatement pstmt  = null;
		int result = 0;

		String query = "insert into board_notice_tb values(board_notice_tb_SEQ.nextval, 'admin',?,null,?,sysdate,1150)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, writeTitle); //글제목 삽입
			pstmt.setString(2, writeContent); //글내용 삽입
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}return result;
	}

	public int delNotice(Connection conn, String[] items) { //공지사항 삭제하려 db로 접근하는 메소드
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
		for(int i=0;i<items.length;i++)
		{
			String query = "delete from board_notice_tb where notice_pk=?";
			
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, items[i]);
				result = pstmt.executeUpdate();
		}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
				
		}
		return result;
	}

}
