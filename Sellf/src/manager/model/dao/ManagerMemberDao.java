package manager.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import manager.model.vo.ManagerMemberSearch;
import manager.model.vo.ManagerTotalMember;

public class ManagerMemberDao {

	public void getMemberSearch(Connection conn, ManagerMemberSearch mmbs) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	System.out.println(mmbs.getSelInfo());//검색 조건	
	System.out.println(mmbs.getMemberInfo());//검색조건에 해당하는 내용 입력
	System.out.println(mmbs.getSelGrade()); //등급
	System.out.println(mmbs.getGender()); //성별 선택 값 출력.

		String query = "select *from uesr_entire_tb where ";
		int whereQueryUpdate = 0; //and추가를 위한 확인 변수


		//여기입니다.
			if(mmbs.getMemberInfo().equals("userName"))
			{
				query+="user_name='"+mmbs.getSelInfo()+"'";
				whereQueryUpdate=1;
			}else if(mmbs.getMemberInfo().equals("userId"))
			{
				query+="user_id='"+mmbs.getSelInfo()+"'";
				whereQueryUpdate=1;
			}else {
				query+="";
			}
			if(whereQueryUpdate==1)
			{
				query+= " and ";
				whereQueryUpdate=0;
			}
		
		System.out.println(query);
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



}
