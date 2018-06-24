package manager.model.service;

import java.sql.*;

import common.JDBCTemplate;
import manager.model.dao.ManagerMemberDao;
import manager.model.vo.ManagerMemberSearch;

public class ManagerMemberService {

    public void getMemberSearch(ManagerMemberSearch mmbs) { //회원 정보 검색 조건을 넘겨 읽으러 감
        Connection conn = JDBCTemplate.getConnection();
        new ManagerMemberDao().getMemberSearch(conn,mmbs);
    }


		
	}
    

