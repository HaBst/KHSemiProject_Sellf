package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import member.model.vo.FindId;
import member.model.vo.Member;

public class findIdPwdDao {


	public int existUser(Connection conn, String userName, String userEmail) 
	{
		PreparedStatement pstmt = null; 
		int result = 0; 
		String query = "select * from USER_ENTIRE_TB where USER_name = ? and USER_Email = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userName);
			pstmt.setString(2, userEmail);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int existUserFindingPwd(Connection conn, String userId, String userName, String userEmail) 
	{
		PreparedStatement pstmt = null; 
		int result = 0; 
		String query = "select * from USER_ENTIRE_TB where USER_id=? and USER_name = ? and USER_Email = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userName);
			pstmt.setString(3, userEmail);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	
	}

	public int changePwd(Connection conn, String memberId, String pwd1) 
	{
		PreparedStatement pstmt = null; 
		int result = 0; 
		String query = "update USER_ENTIRE_TB set USER_pwd=? where USER_id=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pwd1);
			pstmt.setString(2, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Member showId(Connection conn, String memberEmail) 
	{
		PreparedStatement pstmt =null;
		ResultSet rset = null; 
		String query = "select * from USER_ENTIRE_TB where USER_Email = ?";
		Member m = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberEmail);
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				m = new Member();
				m.setUser_entire_pk(rset.getInt("user_entire_pk"));
				m.setUser_id(rset.getString("user_id"));
				m.setUser_name(rset.getString("user_name"));
				m.setUser_pwd(rset.getString("user_pwd"));
				m.setUser_phone(rset.getString("user_phone"));
				m.setUser_birth(rset.getString("user_birth"));
				m.setUser_gender(rset.getString("user_gender"));
				m.setUser_addr(rset.getString("user_addr"));
				m.setUser_user_entire_user_grade_id_fk(rset.getString("user_user_entire_user_grade_id_fk"));
				m.setUser_email(rset.getString("user_email"));
				m.setUser_interest(rset.getString("user_interest"));
				m.setUser_enrolldate(rset.getDate("user_enrolldate"));
				m.setUser_ePoint(rset.getInt("user_epoint"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

}
