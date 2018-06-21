package manager.model.service;

import java.sql.*;

import common.JDBCTemplate;
import manager.model.dao.ManagerMemberDao;
import manager.model.vo.ManagerMemberSearch;

public class ManagerMemberService {

	public void getMemberSearch(ManagerMemberSearch mmbs) {
		Connection conn = JDBCTemplate.getConnection();
		new ManagerMemberDao().getMemberSearch(conn,mmbs);
	}
	
}
