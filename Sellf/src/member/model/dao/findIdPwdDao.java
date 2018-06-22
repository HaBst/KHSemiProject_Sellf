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

}
