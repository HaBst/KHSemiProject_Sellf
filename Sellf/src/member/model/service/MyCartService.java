package member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.dao.MyCartDao;
import member.model.vo.UserCartList;

public class MyCartService {

	public ArrayList<UserCartList> myCartList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<UserCartList> list =  new MyCartDao().myCartList(conn);
		JDBCTemplate.close(conn);
		return list;
		
		
	}

}
