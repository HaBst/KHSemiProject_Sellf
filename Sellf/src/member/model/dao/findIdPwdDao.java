package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import member.model.vo.FindId;
import member.model.vo.Member;

public class findIdPwdDao {

	public String findId(Connection conn, String userName, String userEmail, int idCertificationNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String findId = null;

		String query = "select * from USER_ENTIRE_TB where USER_entire_name = ? and USER_Email = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userName);
			pstmt.setString(2, userEmail);
			rset = pstmt.executeQuery();
			System.out.println("여기들옴");
			if (rset.next()) {
				findId = rset.getString("user_entire_id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return findId;

	}

}
