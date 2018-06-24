package manager.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import manager.model.dao.ManagerMemberDao;
import manager.model.vo.ManagerMemberData;
import manager.model.vo.ManagerMemberSearch;
import manager.model.vo.ManagerSelMember;

public class ManagerMemberService {

	public ManagerMemberData getMemberSearch(int currentPage,ManagerMemberSearch mmbs) { //회원 정보 검색 조건을 넘겨 읽으러 감
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 10; //1. 1페이지에 10개씩
		int naviCountPerPage = 5; //2. 네비는 5개씩

		ArrayList<ManagerSelMember> list = new ManagerMemberDao().getMemberSearch(conn,currentPage,recordCountPerPage,mmbs);
		String pageNavi = new ManagerMemberDao().getMemberSearchNavi(conn,currentPage,recordCountPerPage,naviCountPerPage);

		ManagerMemberData mmd = new ManagerMemberData();

		if(!list.isEmpty() && !pageNavi.isEmpty())
		{
			mmd.setList(list);
			mmd.setPageNavi(pageNavi);
		}
		JDBCTemplate.close(conn);
		return mmd;
	}



}


