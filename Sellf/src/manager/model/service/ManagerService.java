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
			System.out.println("커밋");
		}else {
			JDBCTemplate.rollback(conn);
			System.out.println("tlqckd");
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<String> getSubCtg(String mainCtg) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<String>subCtg = new ManagerDao().getSubCtg(conn,mainCtg);
		JDBCTemplate.close(conn);
		return subCtg;
	}
	

}
