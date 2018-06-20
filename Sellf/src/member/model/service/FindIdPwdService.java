package member.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import member.model.dao.findIdPwdDao;
import member.model.vo.Member;

public class FindIdPwdService {

	public String findId(String userName, String userEmail, int idCertificationNum) {
		Connection conn = JDBCTemplate.getConnection();
		String findId = new findIdPwdDao().findId(conn, userName, userEmail, idCertificationNum);
		JDBCTemplate.close(conn);
		return findId;

	}

}
