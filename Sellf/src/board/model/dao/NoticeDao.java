package board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.model.vo.Notice;
import board.model.vo.NoticeComment;
import common.JDBCTemplate;

public class NoticeDao {

	public ArrayList<Notice> getCurrentPage(Connection conn, int currentPage, int recordCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		//시작 게시물 계산  
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		
		//끝 게시물 계산
		int end = currentPage*recordCountPerPage; 
		String query = "SELECT * FROM (select board_notice_tb.*, row_number() over(order by notice_pk desc) as num from board_notice_tb)" 
					+"where num between ? and ?"; 
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rset= pstmt.executeQuery();
			while(rset.next())
			{
				Notice n = new Notice();
				n.setNotice_pk(rset.getInt("notice_pk"));
				n.setNotice_main_admin_id_fk(rset.getString("notice_main_admin_id_fk"));
				n.setNotice_subject(rset.getString("notice_subject"));
				n.setNotice_image(rset.getString("notice_image"));
				n.setNotice_content(rset.getString("notice_content"));
				n.setNotice_registration_date(rset.getDate("notice_registration_date"));
				list.add(n);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		PreparedStatement pstmt = null; 
		ResultSet rset = null;
		
		int recordTotalCount = 0; //총게시물 개수 저장 변수(정보가 없으므로 초기값은 0)
		String query = "select count(*) as totalCount from board_notice_tb";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery(); 
			if(rset.next())
			{
				recordTotalCount = rset.getInt("totalCount");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		int pageTotalCount = 0; //navi의 토탈카운트
		if(recordTotalCount%recordCountPerPage!=0) //나머지가 0이아니면 페이지 하나더 추가 
		{
			pageTotalCount = recordTotalCount/recordCountPerPage+1;
		}
		else
		{
			pageTotalCount = recordTotalCount/recordCountPerPage; //나머지가 0이면 추가 노노 
		}
		if(currentPage<1)//첫시작페이지는 무조건 1 
		{
			currentPage=1;
		}
		else if(currentPage>pageTotalCount) //마지막 페이지보다 다음 페이지 요청하면 마지막 페이지값으로 
		{
			currentPage = pageTotalCount; 
		}
		//시작 navi
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		
		//끝navi
		int endNavi = startNavi + naviCountPerPage-1;
		
		//맨끝  
		if(endNavi>pageTotalCount)
		{
			endNavi = pageTotalCount;
		}
		
		//페이지 navi에서 사용할 '<' 모양과 '>'모양을 사용하기 위해 
				//필요한 변수 2개 생성(시작과 끝은 필요없으므로!) 
				
				boolean needPrev = true; 
				boolean needNext = true;
				if(startNavi==1) {
					needPrev = false; 
				}
				if(endNavi==pageTotalCount)
				{
					needNext=false; 
				}
				//둘 다 속할 때가 있으므로 if if로! 
				//여기까지 기본적인 구조는 끝남 
				//기존 문자열에 추가!(동적으로 크기가 변하면서) 
				StringBuilder sb = new StringBuilder(); 
				
				if(needPrev) { //시작이 1페이지가 아니라면! 
					sb.append("<a href='/notice?currentPage="+(startNavi-1)+"')> < </a>");// 이전으로 
					sb.append("<a href='/notice?currentPage="+1+"')> << </a>"); //맨앞으로 
				}
				for(int i=startNavi;i<=endNavi;i++) {
					if(i==currentPage)
					{
						sb.append("<a href='/notice?currentPage="+i+"'><B> "+i+" </B></a>");
						//현재페이지 굵게 표시 
					}
					else
					{
						sb.append("<a href='/notice?currentPage="+i+"'> "+i+" </a>");
					}
				}
				if(needNext)
				{
					sb.append("<a href='/notice?currentPage="+(endNavi+1)+"'> > </a>"); // 다음으로
					sb.append("<a href='/notice?currentPage="+(pageTotalCount)+"'> >> </a>");//맨뒤로 
				}
				return sb.toString();
		
	}

	public Notice noticeSelect(Connection conn, int notice_pk) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		String query = "select * from board_notice_tb where notice_pk=?";
		Notice notice = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, notice_pk);
			rset = pstmt.executeQuery(); 
			
			if(rset.next())
			{
				notice = new Notice();
				notice.setNotice_pk(rset.getInt("notice_pk"));
				notice.setNotice_main_admin_id_fk(rset.getString("notice_main_admin_id_fk"));
				notice.setNotice_subject(rset.getString("notice_subject"));
				notice.setNotice_image(rset.getString("notice_image"));
				notice.setNotice_content(rset.getString("notice_content"));
				notice.setNotice_registration_date(rset.getDate("notice_registration_date"));	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return notice;
	}

	public ArrayList<NoticeComment> noticeComment(Connection conn, int notice_pk) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<NoticeComment> list = new ArrayList<NoticeComment>();
		int notice_comment_notice_fk = 0;
		notice_comment_notice_fk=notice_pk;
		String query = "select * from board_notice_comment_tb where notice_comment_notice_fk=?";
//		System.out.println("크크크: "+notice_comment_notice_fk);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, notice_comment_notice_fk);
			rset = pstmt.executeQuery(); 
			while(rset.next())
			{
			 NoticeComment nc = new NoticeComment();
			 nc.setNotice_comment_pk(rset.getInt("notice_comment_pk"));
			 nc.setNotice_comment_notice_fk(rset.getInt("notice_comment_notice_fk"));
			 nc.setNotice_comment_user_id_fk(rset.getString("notice_comment_user_id_fk"));
			 nc.setNotice_comment_id(rset.getInt("notice_comment_id"));
			 nc.setNotice_comment_seq(rset.getInt("notice_comment_seq"));
			 nc.setNotice_comment_depth(rset.getInt("notice_comment_depth"));
			 nc.setNotice_comment_content(rset.getString("notice_comment_content"));
			 nc.setNotice_comment_date(rset.getDate("notice_comment_date"));
			 list.add(nc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

}
