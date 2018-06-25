package manager.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import common.JDBCTemplate;
import manager.model.vo.ManagerMemberSearch;
import manager.model.vo.ManagerSelMember;
import manager.model.vo.ManagerSellSearch;
import manager.model.vo.ManagerTotalMember;

public class ManagerMemberDao {
	
	private static String whereQueryStatic;

	public ArrayList<ManagerSelMember> getMemberSearch(Connection conn,int currentPage, int recordCountPerPage, ManagerMemberSearch mms) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      System.out.println("검색조건 " +mms.getSelInfo());//검색 조건   
	      System.out.println("검색내용 " + mms.getMemberInfo());//검색조건에 해당하는 내용 입력
	      System.out.println("등급" +mms.getSelGrade()); //등급
	      System.out.println("성별 " +mms.getGender()); //성별 선택 값 출력.
	      
	   // 일단 where를 여기서 뺏음.
	      String query = "select *from uesr_entire_tb ";
	      int whereQueryUpdate = 0; //and추가를 위한 확인 변수


	      //여기입니다.
	      if(mms.getSelInfo().equals("userName"))
	      {
	         query+="where user_name like '%"+mms.getMemberInfo()+"%'";
	         whereQueryUpdate+=1;
	      }else if(mms.getSelInfo().equals("userId"))
	      {
	         query+="where user_id like '%"+mms.getMemberInfo()+"%'";
	         whereQueryUpdate+=1;
	      }   
	      
	      // 판매 등급
	      if(mms.getSelGrade().length()>0)
	      {
	         // 위에서 조건을 추가했을때.
	         if(whereQueryUpdate==1) query+= " and ";
	         if(whereQueryUpdate==0) query+= " where ";
	         query+=" USER_ENTIRE_USER_GRADE_ID_FK='"+mms.getSelGrade()+"'";
	         whereQueryUpdate+=1;
	      }
	      
	      // 성별
	      if(mms.getGender().length()>0)
	      {
	         // 위에서 조건을 추가했을때.
	         if(whereQueryUpdate==2) query+= " and ";
	         if(whereQueryUpdate==0) query+= " where ";
	         query+=" USER_GENDER='"+mms.getGender()+"'";
	      }
	      whereQueryStatic = query;
	      
	      
	      int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
			//1페이지 요청 : 1*10-(10-1)=10-9=1;
			//3페이지 요청: 3*10-(10-1)=30-9=21;
			//끝페이지 계산
			int end = currentPage*recordCountPerPage;
			//1페이지 요청: 1*10=10
			//3페이지 요청: 3*10=30
	      
		String wherequery="select *from"+ 
		"(select user_entire_tb.*,row_number() over(order by user_ENTIRE_PK desc) as num from user_entire_tb "+whereQueryStatic+" ) " 
				+ " where num between ? and ?";
	     ArrayList<ManagerSelMember>list = new ArrayList<ManagerSelMember>();
	     System.out.println(wherequery);
	     System.out.println(query);
	     try {
			pstmt = conn.prepareStatement(wherequery);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				ManagerSelMember msm = new ManagerSelMember();
				msm.setUserEntireId(rset.getString("user_entire_pk"));
				msm.setUserEntireName(rset.getString("user_name"));
				msm.setUserPhone(rset.getString("user_phone"));
				msm.setUserGender(rset.getString("user_gender").charAt(0));
				msm.setUserGrade(rset.getString("user_entire_user_greade"));
				list.add(msm);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
	     {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
	     }return list;
	   }

	   


	



	public String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage,
			ManagerMemberSearch mms) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int recordTotalCount = 0;
		//게시물의 토탈 개수 구하기
		String query = "select count(*)as totalCount from user_entire_tb " + whereQueryStatic;

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			rset.next();
			recordTotalCount = rset.getInt("totalCount");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		int pageTotalCount = 0;

		if(recordTotalCount%recordCountPerPage!=0)
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
		//페이지navi에서 사용할 '<'모양과'>'모양을 사용하기 위해 필요한 변수 2개 생성
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
		//여기까지 기본적은 구조는 끝.

		StringBuilder sb = new StringBuilder();
		String navi = 
				"<nav aria-label='Page navigation example'>";				
		navi+= "<ul class='pagination'>";

		
		if(needPrev) {// 시작이 1페이지가 아니라면!					
			navi +=	"<li class='page-item'>"+
				"<a class='page-link' aria-label='Previous' onclick='pageChange("+(startNavi-1)+ ");'> <span aria-hidden='true' >«</span>"+
				"<span class='sr-only'>Previous</span>"+
				"</a> </li>";
			
//			"<span onclick='pageChange("+(startNavi-1)+ ");'> < </span>";
		}
		
		for(int i = startNavi;i<=endNavi;i++)
		{
			if(i==currentPage) {
				navi += "<li>"+
				"<a class='page-link' onclick='pageChange("+ i +");'> <span aria-hidden='true'><B>"+i+"</B></span>"+
				"<span class='sr-only'>"+ i +"</span>"+
				"</a></li>";
//				navi += "<span onclick='pageChange("+ i + ");'></span>";
			}
			else {
				navi += "<li>"+
					"<a class='page-link'  onclick='pageChange("+ i +");'> <span aria-hidden='true'>"+i+"</span>"+
					"<span class='sr-only'>"+i+"</span>"+
					"</a></li>";
//				navi += "<span onclick='pageChange("+ i + ");'>"+ i +"</span>";
//				sb.append("<a href='/notice?currentPage="+i+"'> "+i+" </a>");
			}
		}
		
		if(needNext) {// 끝페이지가 아니라면
			navi += "<li class='page-item'>"+
				"<a class='page-link' aria-label='Next' onclick='pageChange("+(endNavi+1)+ ");'>"+
				"<span aria-hidden='true' >»</span>"+ 
				"<span class='sr-only'>Next</span>"+
				"</a>"+
			"</li>";
//			navi+= "<span onclick='pageChange("+(endNavi+1)+ ");'> > </span>";
//			sb.append("<a href='/notice?currentPage="+(endNavi+1)+ "'> > </a>");
		
		}
//		System.out.println("검색어 " + search);
		return navi;
	}



}
