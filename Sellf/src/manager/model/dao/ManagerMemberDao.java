package manager.model.dao;

import java.sql.*;
import manager.model.vo.ManagerMemberSearch;

public class ManagerMemberDao {

	public void getMemberSearch(Connection conn, ManagerMemberSearch mmbs) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println(mmbs);
		
		System.out.println(mmbs.getGender()); //성별 선택.
		System.out.println(mmbs.getMemberInfo());//검색조건에 해당하는 내용 입력
		System.out.println(mmbs.getSelGrade()); //등급
		System.out.println(mmbs.getSelInfo());//검색 조건
		
		String query = "select *from uesr_entire_tb where ";
		int whereQueryUpdate = 0; //and추가를 위한 확인 변수
		
		if(mmbs.getMemberInfo()!=null && mmbs.getSelInfo()!=null)
		{
			if(mmbs.getMemberInfo().equals("userId"))
			{
				query+="user_id='"+mmbs.getMemberInfo()+"'";
				whereQueryUpdate=1;
			}else if(mmbs.getMemberInfo().equals("userName"))
			{
				query += "user_name'"+mmbs.getMemberInfo()+"'";
				whereQueryUpdate=1;
			}else {
				query+="";
			}
			if(whereQueryUpdate==1) { //and추가
				query += " and ";
				whereQueryUpdate=0;
			}
		
		}
		if(!mmbs.getSelGrade().equals(null))
			{
				query+="user_entire_user_grade_id_fk='"+mmbs.getSelGrade()+"'";
				whereQueryUpdate=1;
			}else {
				query+="";
			}
			if(whereQueryUpdate==1)
			{
				query += " and ";
				whereQueryUpdate=0;
			}
	
		if(!mmbs.getGender().equals(" "))
			{
				query+="user_gender='"+mmbs.getGender()+"'";
				
			}else {
				query+="";
			}
		System.out.println(query);
	}

}
