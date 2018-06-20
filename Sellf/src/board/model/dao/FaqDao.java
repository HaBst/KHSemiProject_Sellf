package board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.model.vo.Faq;

import common.JDBCTemplate;

public class FaqDao {

	public ArrayList<Faq> getCurrentPage(Connection conn, int currentPage, int recordCountPerPage) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		//시작 게시물 계산  
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		
		//끝 게시물 계산
		int end = currentPage*recordCountPerPage; 
		String query = "SELECT * FROM (select board_faq_tb.*, row_number() over(order by faq_pk desc) as num from board_faq_tb)" 
					+"where num between ? and ?"; 
		ArrayList<Faq> f_list = new ArrayList<Faq>();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rset= pstmt.executeQuery();
			while(rset.next())
			{
				Faq f = new Faq();
				f.setFaq_pk(rset.getInt("faq_pk"));
				f.setFaq_subject(rset.getString("faq_subject"));
				f.setFaq_image(rset.getString("faq_image"));
				f.setFaq_content(rset.getString("faq_content"));
				f_list.add(f);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		System.out.println("여기서야???"+f_list.get(0).getFaq_subject());
		return f_list;
	}

	public String getFaqPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		PreparedStatement pstmt = null; 
		ResultSet rset = null;
		
		int recordTotalCount = 0; //총게시물 개수 저장 변수(정보가 없으므로 초기값은 0)
		String query = "select count(*) as totalCount from board_faq_tb";
		
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
					sb.append("<a href='/faq?currentPage="+(startNavi-1)+"')> < </a>");// 이전으로 
					sb.append("<a href='/faq?currentPage="+1+"')> << </a>"); //맨앞으로 
				}
				for(int i=startNavi;i<=endNavi;i++) {
					if(i==currentPage)
					{
						sb.append("<a href='/faq?currentPage="+i+"'><B> "+i+" </B></a>");
						//현재페이지 굵게 표시 
					}
					else
					{
						sb.append("<a href='/faq?currentPage="+i+"'> "+i+" </a>");
					}
				}
				if(needNext)
				{
					sb.append("<a href='/faq?currentPage="+(endNavi+1)+"'> > </a>"); // 다음으로
					sb.append("<a href='/faq?currentPage="+(pageTotalCount)+"'> >> </a>");//맨뒤로 
				}
				return sb.toString();
		
	}

	public Faq faqSelect(Connection conn, int faq_pk) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		String query = "select * from board_faq_tb where faq_pk=?";
		Faq faq = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, faq_pk);
			rset = pstmt.executeQuery(); 
			
			if(rset.next())
			{
				faq = new Faq();
				faq.setFaq_pk(rset.getInt("faq_pk"));
				faq.setFaq_subject(rset.getString("faq_subject"));
				faq.setFaq_image(rset.getString("faq_image"));
				faq.setFaq_content(rset.getString("faq_content"));			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return faq;
	}

}
