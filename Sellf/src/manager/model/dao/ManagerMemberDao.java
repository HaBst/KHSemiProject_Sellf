package manager.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import manager.model.vo.ManagerMemberSearch;
import manager.model.vo.ManagerSelMember;
import manager.model.vo.ManagerTotalMember;

public class ManagerMemberDao {

	public ArrayList<ManagerSelMember> getMemberSearch(Connection conn,int currentPage,int recordCountPerPage, ManagerMemberSearch mmbs) {
		PreparedStatement pstmt = null; //회원정보를 검색하여 페이징 처리함.
		ResultSet rset = null;
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1); //시작페이지 계산
		int end = currentPage*recordCountPerPage;	//끝페이지 계산
		ManagerSelMember msm = null;
		ArrayList<ManagerSelMember>list = new ArrayList<ManagerSelMember>();
//	System.out.println(mmbs.getSelInfo());//검색 조건	
//	System.out.println(mmbs.getMemberInfo());//검색조건에 해당하는 내용 입력
//	System.out.println(mmbs.getSelGrade()); //등급
//	System.out.println(mmbs.getGender()); //성별 선택 값 출력.

		String query = "select *from uesr_entire_tb  ";
		int whereQueryUpdate = 0; //and추가를 위한 확인 변수


		//여기입니다.
		  if(mmbs.getSelInfo().equals("userName"))
	      {
	         query+="where user_name like'%"+mmbs.getMemberInfo()+"%'";
	         whereQueryUpdate+=1;
	      }else if(mmbs.getSelInfo().equals("userId"))
	      {
	         query+="where user_id like'%"+mmbs.getMemberInfo()+"%'";
	         whereQueryUpdate+=1;
	      }   
	      
	      // 판매 등급
	      if(mmbs.getSelGrade().length()>0)
	      {
	         // 위에서 조건을 추가했을때.
	         if(whereQueryUpdate==1) query+= " and ";
	         if(whereQueryUpdate==0) query+= "where  ";
	         query+=" USER_ENTIRE_USER_GRADE_ID_FK='"+mmbs.getSelGrade()+"'";
	         whereQueryUpdate+=1;
	      }
	   // 성별
	      if(mmbs.getGender().length()>0)
	      {
	         // 위에서 조건을 추가했을때.
	         if(whereQueryUpdate==2||whereQueryUpdate==1) query+= " and ";
	         if(whereQueryUpdate==0) query+= " where ";
	         query+=" USER_GENDER='"+mmbs.getGender()+"'";
	      }
	      
	     try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				msm = new ManagerSelMember();
				msm.setUserEntireId(rset.getString("user_id"));
				msm.setUserEntireName(rset.getString("user_name"));
				msm.setUserGrade(rset.getString("user_entire_user_grade_id_fk"));
				msm.setUserPhone(rset.getString("user_phone"));
				msm.setUserGender(rset.getString("user_gender").charAt(0));
				msm.setUserEnrollDate(rset.getDate("user_enrollDate"));
				msm.setUserPoint(rset.getInt("user_epoint"));
				list.add(msm);
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

	

	public ArrayList<ManagerTotalMember> getMemberStatus(Connection conn) { //회원 현황을 읽어올 method 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ManagerTotalMember>totalMember = new ArrayList<ManagerTotalMember>();
		
		
		ManagerTotalMember mtm = null;

		try {
				int i=5;
				String query = "select * from user_visit_tb where to_char(user_visit_info_date,'yy/mm/dd')=to_char(sysdate-?)";
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, i);
				rset = pstmt.executeQuery();
				while(rset.next())
				{
					mtm = new ManagerTotalMember();
					mtm.setUserVisitLoginCnt(rset.getInt("user_visit_login_count")); //로그인 횟수 저장
					mtm.setUserVisitEnrollCnt(rset.getInt("user_visit_enroll_count")); //회원가입 횟수 저장
					mtm.setUserVisitSignoutCnt(rset.getInt("user_visit_signout_count")); //탈퇴 횟수 저장
					mtm.setUserVisitInfoDate(rset.getDate("user_visit_info_date")); //날짜
					totalMember.add(mtm);
				}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}return totalMember;
	}



	public String getMemberSearchNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int recordTotalCount = 0;
		String query = "select count(*)as totalCount from user_entire_tb where user_entire_user_grade_id_fk='G00'";

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

		int pageTotalCount = 0; //navi 토탈 카운트
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
		if(needPrev) //시작이 1페이지가 아니면?
		{
			sb.append("<a href='/managerSelMember?currentPage="+(startNavi-1)+"'> < </a>");	
		}
		for(int i=startNavi;i<=endNavi;i++)
		{
			if(i==currentPage)
			{
				sb.append("<a href='/managerSelMember?currentPage="+i+"'> <B>"+i+"</B> </a>");
			}else
			{
				sb.append("<a href='/managerSelMember?currentPage="+i+"'>" + i +"</a>");
			}
		}
		if(needNext)           //끝페이지 아니면?
		{
			sb.append("<a href='/managerSelMember?currentPage="+(endNavi+1)+"'> > </a>");
		}
		return sb.toString();
	}
	



}
