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

	public int myOrderInfo(MyCartTmp mt) {
		Connection conn = JDBCTemplate.getConnection();
		int result =  new MyCartDao().myOrderInfo(conn,mt);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
		
	}

	public int updateEpoint(String userId, String epoint) {
		Connection conn = JDBCTemplate.getConnection();
		int result =  new MyCartDao().updateEpoint(conn,userId,epoint);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteOneMycartList(String userId, int productEntire) {
		Connection conn = JDBCTemplate.getConnection();
		int result =  new MyCartDao().deleteOneMycartList(conn,userId,productEntire);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertCartList(String userId, String productEntire) {
		Connection conn = JDBCTemplate.getConnection();
		int result =  new MyCartDao().insertCartList(conn,userId,productEntire);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
		
	}
/*
	public int deleteOneMycartList(String userId, String productEntire) {
		Connection conn = JDBCTemplate.getConnection();
		int result =  new MyCartDao().deleteOneMycartList(conn,userId,productEntire);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}*/

}
