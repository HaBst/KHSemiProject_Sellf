package manager.model.service;

import java.sql.*;
import java.util.ArrayList;

import common.JDBCTemplate;
import manager.model.dao.ManagerMemberDao;
import manager.model.dao.ManagerProductDao;
import manager.model.vo.ManagerMemberSearch;
import manager.model.vo.ManagerSelMember;
import manager.model.vo.ProductPageData;
import manager.model.vo.SelMemberPageData;
import product.model.vo.Product;

public class ManagerMemberService {

    public SelMemberPageData getMemberSearch(int currentPage,ManagerMemberSearch mms) { //회원 정보 검색 조건을 넘겨 읽으러 감
        Connection conn = JDBCTemplate.getConnection();
        int recordCountPerPage = 5; //1. 1페이지에10개씩보이게
		int naviCountPerPage = 5; //2.

		//service에서는 DAO에 2가지 요청을 진행해야 함
		//1.현재 페이지 리스트
		//2.현재 중심으로 만들어지는 navi리스트 
	
		ArrayList<ManagerSelMember> list = new ManagerMemberDao().getMemberSearch(conn,currentPage,recordCountPerPage,mms);
		String pageNavi = new ManagerMemberDao().getPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage,mms);
		
		SelMemberPageData spd = null;
		if(!list.isEmpty() && !pageNavi.isEmpty())
		{
			spd = new SelMemberPageData();
			spd.setList(list);
			spd.setPageNavi(pageNavi);
		}
		JDBCTemplate.close(conn);
		return spd;
       
    }


		
	}
    

