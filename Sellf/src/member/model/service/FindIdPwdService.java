package member.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import member.model.dao.findIdPwdDao;
import member.model.vo.Member;


public class FindIdPwdService {

	public int existUser(String userName, String userEmail) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new findIdPwdDao().existUser(conn, userName, userEmail);
		if(result>0)
		{
			JDBCTemplate.commit(conn);
		}
		else
		{
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
		
	}

	public int existUserFindingPwd(String userId, String userName, String userEmail) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new findIdPwdDao().existUserFindingPwd(conn, userId, userName, userEmail);
		if(result>0)
		{
			JDBCTemplate.commit(conn);
		}
		else
		{
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
		
	}
	public int changePwd(String memberId, String pwd1) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new findIdPwdDao().changePwd(conn, memberId, pwd1);
		if(result>0)
		{
			JDBCTemplate.commit(conn);
		}
		else
		{
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Member showId(String memberEmail) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = new findIdPwdDao().showId(conn, memberEmail);
		JDBCTemplate.close(conn);
		return m;
	}
}
