package manager.model.dao;

import java.sql.*;
import java.util.*;
import manager.model.vo.ManagerSelMember;
import common.JDBCTemplate;
public class ManagerDao {

	public ArrayList<ManagerSelMember> selMember(Connection conn, String selInfo, String memberInfo, String selGrade,char gender) {
		//조건에 따라 회원 정보를 DB에서검색하여 jsp로 보냄. 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<ManagerSelMember> list = new ArrayList<ManagerSelMember>();
		String query = "";
		try {
			if(selInfo.equals("userName")) {
				query = "select user_id, user_name, user_entire_user_grade_id_fk,"+ 
						"user_phone, user_gender, user_enrollDate from user_entire_tb where user_name like'%?%' and user_entire_user_grade_id_fk =? and user_gender = ?";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, memberInfo);
			pstmt.setString(2, selGrade);
			pstmt.setLong(3, gender);
			rset = pstmt.executeQuery();
			}else if(selInfo.equals("userId")) {
				query = "select user_id, user_name, user_entire_user_grade_id_fk,"+ 
						"user_phone, user_gender, user_enrollDate from user_entire_tb where user_id like'%?%' and user_entire_user_grade_id_fk like ? and user_gender = ?";
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, memberInfo);
				pstmt.setString(2, selGrade);
				pstmt.setLong(3, gender);
				rset = pstmt.executeQuery();
			}
			
			while(rset.next())
			{
				ManagerSelMember msm  = new ManagerSelMember();
				msm.setUserEntireId(rset.getString("user_id"));
				msm.setUserEntireName(rset.getString("user_name"));
				msm.setUserGrade("user_entire_user_grade_id_fk");
				msm.setUserPhone(rset.getString("user_phone"));
				msm.setUserGender(rset.getString("user_gender").charAt(0));
				msm.setUserEnrollDate(rset.getDate("user_enrollDate"));
				list.add(msm);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<ManagerSelMember> readBlackList(Connection conn) {
		//회원 등급id가 G00인 회원만 검색하여 블랙리스트를 보여주는 jsp로 보냄.
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ManagerSelMember msm = null;
		ArrayList<ManagerSelMember> list = new ArrayList<ManagerSelMember>();
		

		try {
			pstmt = conn.prepareStatement("select user_id, user_name, user_entire_user_grade_id_fk," + 
					" user_phone, user_gender, user_enrollDate from user_entire_tb where user_entire_user_grade_id_fk='G00'");
			rset = pstmt.executeQuery();
		
			while(rset.next())
			{
				msm = new ManagerSelMember();
				msm.setUserEntireId(rset.getString("user_id"));
				msm.setUserEntireName(rset.getString("user_name"));
				msm.setUserGrade(rset.getString("user_entire_user_grade_id_fk")); //불량등급
				msm.setUserPhone(rset.getString("user_phone"));
				msm.setUserGender(rset.getString("user_gender").charAt(0));
				msm.setUserEnrollDate(rset.getDate("user_enrollDate"));
				list.add(msm);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<ManagerSelMember> getBlackList(Connection conn, int currentPage, int recordCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ManagerSelMember>list = new ArrayList<ManagerSelMember>();
		ManagerSelMember msm = null;
		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1); //시작페이지 계산
		int end = currentPage*recordCountPerPage;	//끝페이지 계산
		
		String query = "select user_id, user_name, user_entire_user_grade_id_fk , user_phone, user_gender, user_enrollDate,user_epoint from "+ 
				" (select user_entire_tb.*,row_number() over(order by user_entire_pk desc) as num from user_entire_tb) "+ 
				" where num between  ? and ? and user_entire_user_grade_id_fk='G00'";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
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
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public String getBlackListPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {
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
		 sb.append("<a href='/managerBlackList?currentPage="+(startNavi-1)+"'> < </a>");	
		}
		for(int i=startNavi;i<=endNavi;i++)
		{
			if(i==currentPage)
			{
				sb.append("<a href='/managerBlackList?currentPage="+i+"'> <B>"+i+"</B> </a>");
			}else
			{
				sb.append("<a href='/managerBlackList?currentPage="+i+"'>" + i +"</a>");
			}
		}
		if(needNext)           //끝페이지 아니면?
		{
			sb.append("<a href='/managerBlackList?currentPage="+(endNavi+1)+"'> > </a>");
		}
		return sb.toString();
	}

	public int bannedUnlock(Connection conn, String[] userId) { //불량등급 해제할 ID가져와서 등급 변경.
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			for(int i=0;i<userId.length;i++)
			{
				pstmt = conn.prepareStatement("update user_entire_tb set user_entire_user_grade_id_fk ='G01' where user_id=?");
				pstmt.setString(1, userId[i]);
				result = pstmt.executeUpdate();
			}
		}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public HashMap<String, String> getSubCtg(Connection conn, String mainCtg) {
		//대분류에 따른 소분류를 DB에서 가져옴.
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String , String >subCtg = new HashMap<String,String>();
		String query ="select product_category_sub_id, product_category_sub_name from product_category_sub_tb where product_cate_sub_main_id_fk=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mainCtg);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				subCtg.put(rset.getString("product_category_sub_id"), rset.getString("product_category_sub_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return subCtg;
	}
}
