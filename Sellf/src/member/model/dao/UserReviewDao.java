package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.vo.UserReview;

public class UserReviewDao {

	public ArrayList<UserReview> getCurrnetPage(Connection conn, int currentPage, int recordCountPerPage, String id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int start = currentPage * recordCountPerPage - (recordCountPerPage-1);

		int end = currentPage * recordCountPerPage;
		String 	query = "select * from ("+
					"select user_review_tb.* , row_number() over(order by user_rv_pk desc) as num from user_review_tb) "+
							"where num between ? and ? and USER_RV_USER_ENTIRE_ID_FK=?";
//			System.out.println(query);
//			System.out.println(start);
//			System.out.println(end);
//			System.out.println(id);
		ArrayList<UserReview> list = new ArrayList<UserReview>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, id);
			rset = pstmt.executeQuery();
			
			while(rset.next()) 
			{
				UserReview ur = new UserReview();
				ur.setUserReviewPk(rset.getInt("user_rv_pk"));
				ur.setUserReviewUserEntireIdFk(rset.getString("USER_RV_USER_ENTIRE_ID_FK"));
				ur.setUserReviewUserEntireReviewedIdFk(rset.getString("USER_RV_USER_ENTIRE_RVED_ID_FK"));
				ur.setUserReviewProductEntireFk(rset.getInt("USER_RV_PRODUCT_ENTIRE_FK"));
				ur.setUserReviewComment(rset.getString("USER_REVIEW_COMMENT"));
				ur.setUserReviewRating(rset.getInt("USER_REVIEW_RATING"));
				ur.setUserReviewDate(rset.getDate("USER_REVIEW_DATE"));
				
				list.add(ur);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
//		System.out.println("UserReviewDAO " + list.size());
		return list;
	}

	public String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage, String id) {
				int recordTotalCount = 0;
			
				String query = "select count(*) as total from user_review_tb where USER_RV_USER_ENTIRE_ID_FK=?";

				PreparedStatement pstmt = null;
				ResultSet rset = null;
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, id);
					rset = pstmt.executeQuery();
					
					if(rset.next())
					{
						recordTotalCount = rset.getInt("total");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				finally {
					JDBCTemplate.close(rset);
					JDBCTemplate.close(pstmt);
				}
				
				
				int pageTotalCount = 0;// navi 토탈 카운트
				// 페이지당 10 개씩 보이게 만들어서 navi list 를 만들려면?
				// 토탈 게시물이 124개라고 했을때 124%10을 한후 +1만큼
				// 만들어야함
				// 만약 나머지가 0으로 떨어진다면 +1을 하지 않음
				if(recordTotalCount%recordCountPerPage!=0) {
					pageTotalCount = recordTotalCount/recordCountPerPage +1;
				}
				else
				{
					pageTotalCount = recordTotalCount/recordCountPerPage;
				}		
//				System.out.println("전체 페이지 " + pageTotalCount);
				// 사용자가 현재 페이지가 1 페이지 인데 더 아래 페이지를 요청할 경우
				// 혹은 마지막 페이지가 120 페이지 인데 다음 페이지를
				// 요청할 경우에 대한 에러 방지 설정
				// 1보다 아래를 요청하면 1로 셋팅
				// 마지막보다 다음 페이지를 요청하면 마지막 페이지 값으로 셋팅
				if(currentPage<1) {
					currentPage = 1;
				}else if(currentPage>pageTotalCount) {
					currentPage =pageTotalCount;
				}
				// 현재 페이지를 기점으로 시작 navi와 끝 navi를 만들어야함.
				// 현재 페이지가 1이라면? 1~5
				// 현재 페이지가 3이라면? 1~5
				// 현재 페이지가 7이라면? 6~10
				// 시작 페이지 구하는 공식
				// -> ((현재페이지-1)/리스트개수) * 리스트개수 + 1
				// 1페이지 > ((1-1)/5) * 5 +1 = 1;
				// 7 페이지 > ((7-1)/5) * 5 + 1 = 6;
				// 12 페이지 > ((12-1/5) * 5 + 1 = 11;
				
				int startNavi = ((currentPage-1)/naviCountPerPage) * naviCountPerPage + 1;
				
				// 끝 NAVI 구하는 공식(쉬움)
				// 시작 navi + 보여줄 navi 개수 - 1;
				// 만약 시작 페이지가 1이라면 끝은
				// 1+ 5 -1 = 5;  1~5
				int endNavi = startNavi + naviCountPerPage -1;
				
				// 끝 navi를 구할때 주의 해야 할점
				// 토탈 navi가 122라고 할떄!(현재 페이지는 121이라고 할떄)
				// 시작 navi =>  (121-1)/ 5 * 5+1 = 121
				// 끝 navi = > 121 + 5 -1 = 125;
				// 이렇기 때문에 마지막 navi 부분은 아래 코드를 추가 해야함
				
				if(endNavi>pageTotalCount) {
					endNavi = pageTotalCount;
				}
				
				// 페이지 네비에서 사용할 '<' 모양과 '> 모양을 사용하기 위해
				// 필요한 변수 2개 생성(시작과 끝은 필요 없으므로)
				
				boolean needPrev = true;
				boolean needNext = true;
				
				if(startNavi==1) {
					needPrev = false;
				}
				if(endNavi==pageTotalCount) {
					needNext = false;
				}
				
				// 여기까지 기본적이 구조는 끝남
				
				StringBuilder sb = new StringBuilder();
				String navi = 
						"<nav aria-label='Page navigation example'>";				
				navi+= "<ul class='pagination'>";
		
				
				if(needPrev) {// 시작이 1페이지가 아니라면!					
					navi +=	"<li class='page-item'>"+
						"<a class='page-link' aria-label='Previous' onclick='pageChange("+(startNavi-1)+ ");'> <span aria-hidden='true' >«</span>"+
						"<span class='sr-only'>Previous</span>"+
						"</a> </li>";
					
//					"<span onclick='pageChange("+(startNavi-1)+ ");'> < </span>";
				}
				
				for(int i = startNavi;i<=endNavi;i++)
				{
					if(i==currentPage) {
						navi += "<li>"+
						"<a class='page-link' onclick='pageChange("+ i +");'> <span aria-hidden='true'><B>"+i+"</B></span>"+
						"<span class='sr-only'>"+ i +"</span>"+
						"</a></li>";
//						navi += "<span onclick='pageChange("+ i + ");'></span>";
					}
					else {
						navi += "<li>"+
							"<a class='page-link'  onclick='pageChange("+ i +");'> <span aria-hidden='true'>"+i+"</span>"+
							"<span class='sr-only'>"+i+"</span>"+
							"</a></li>";
//						navi += "<span onclick='pageChange("+ i + ");'>"+ i +"</span>";
//						sb.append("<a href='/notice?currentPage="+i+"'> "+i+" </a>");
					}
				}
				
				if(needNext) {// 끝페이지가 아니라면
					navi += "<li class='page-item'>"+
						"<a class='page-link' aria-label='Next' onclick='pageChange("+(endNavi+1)+ ");'>"+
						"<span aria-hidden='true' >»</span>"+ 
						"<span class='sr-only'>Next</span>"+
						"</a>"+
					"</li>";
//					navi+= "<span onclick='pageChange("+(endNavi+1)+ ");'> > </span>";
//					sb.append("<a href='/notice?currentPage="+(endNavi+1)+ "'> > </a>");
				
				}
//				System.out.println("검색어 " + search);
				return navi;
	}

}
