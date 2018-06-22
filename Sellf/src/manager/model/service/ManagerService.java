package manager.model.service;

import manager.model.dao.ManagerDao;
import manager.model.vo.ManagerMemberData;
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

	public void getMemberStatus() {
		// 회원 가입수, 탈퇴수 등 메인에 보여줄 데이터를 가져옴.
		 Connection conn = JDBCTemplate.getConnection();
		 new ManagerDao().getMemberStatus(conn);
	}
	

}
