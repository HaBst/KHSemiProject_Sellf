package manager.model.service;

import manager.model.dao.ManagerDao;
import manager.model.vo.ManagerSelMember;

import java.sql.*;
import java.util.*;

import common.JDBCTemplate;

public class ManagerService {

	public ArrayList<ManagerSelMember> selMember(String selInfo, String memberInfo, String selGrade,char gender) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ManagerSelMember>list = new ManagerDao().selMember(conn,selInfo,memberInfo,selGrade,gender);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<ManagerSelMember> readBlackList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ManagerSelMember>list = new ManagerDao().readBlackList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

}
