 package manager.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import common.JDBCTemplate;
import manager.model.dao.ManagerDao;
import manager.model.dao.ManagerMemberDao;
import manager.model.vo.ManagerMemberData;
import manager.model.vo.ManagerSelMember;
import manager.model.vo.ManagerTotalMember;
import member.model.vo.Member;

public class ManagerService {
	
	public Member managerLogin(String managerId, String managerPwd) {
	//관리자가 맞는 지 판별.
		Connection conn = JDBCTemplate.getConnection();
		Member m = new ManagerDao().managerLogin(conn,managerId,managerPwd);
		JDBCTemplate.close(conn);
		return m;
	}

	public ArrayList<ManagerSelMember> selMember(String selInfo, String memberInfo, String selGrade,char gender) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ManagerSelMember>list = new ManagerDao().selMember(conn,selInfo,memberInfo,selGrade,gender);
		JDBCTemplate.close(conn);
		return list;
	}

	public ManagerMemberData readBlackList(int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		
		int recordCountPerPage = 10; //1. 1페이지에 10개씩
		int naviCountPerPage = 5; //2. 네비는 5개씩
		
		ArrayList<ManagerSelMember>list = new ManagerDao().getBlackList(conn,currentPage,recordCountPerPage);
		String pageNavi = new ManagerDao().getBlackListPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage);
		ManagerMemberData mmd = new ManagerMemberData();
		
		if(!list.isEmpty() && !pageNavi.isEmpty())
		{
			mmd.setList(list);
			mmd.setPageNavi(pageNavi);
		}
		JDBCTemplate.close(conn);
		return mmd;
	}

	public int bannedUnlock(String[] userId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ManagerDao().bannedUnlock(conn,userId);
		if(result>0)
		{
			JDBCTemplate.commit(conn);
			
		}else {
			JDBCTemplate.rollback(conn);
	
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public HashMap<String, String> getSubCtg(String mainCtg) {
		Connection conn = JDBCTemplate.getConnection();
		HashMap<String, String>subCtg = new ManagerDao().getSubCtg(conn,mainCtg);
		JDBCTemplate.close(conn);
		return subCtg;
	}
}
