package member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.dao.MyCartDao;
import member.model.vo.UserCartList;
import product.model.vo.Product;

public class MyCartService {

	public ArrayList<Product> myCartList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Product> list =  new MyCartDao().myCartList(conn);
		JDBCTemplate.close(conn);
		return list;
		
		
	}

}
