package member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.dao.MyCartDao;
import member.model.vo.MyCartTmp;
import member.model.vo.UserCartList;
import product.model.vo.Product;

public class MyCartService {

	public ArrayList<Product> myCartList(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		//ArrayList<Product> list =  new MyCartDao().myCartList(conn,userId);
		ArrayList<Product> list =  new MyCartDao().myCartList(conn,userId);
		JDBCTemplate.close(conn);
		return list;
		
		
	}

	public MyCartTmp selectCartList(String productKey) {
		Connection conn = JDBCTemplate.getConnection();
		MyCartTmp myCart =  new MyCartDao().selectCartList(conn,productKey);
		JDBCTemplate.close(conn);
		return myCart;
		
	}

}
