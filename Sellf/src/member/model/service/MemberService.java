package member.model.service;


import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.dao.MemberDao;
import member.model.vo.Grade;
import member.model.vo.Member;
import member.model.vo.purchaseHis;
import member.model.vo.wishList;
import product.model.vo.PageData;
import product.model.vo.Product;

public class MemberService {

	public int checkId(String id, String fullPath) {
		// TODO Auto-generated method stub
		Connection conn = null;
		conn = JDBCTemplate.getConnection();
		int result = new MemberDao().checkId(conn, id,fullPath);
		JDBCTemplate.close(conn);
		return result;
	}

    public int updateMember(Member m) {
        Connection conn = JDBCTemplate.getConnection();
        int result = new MemberDao().updateMember(conn,m);
        if(result>0)
        {
            JDBCTemplate.commit(conn);
        }else
        {
            JDBCTemplate.rollback(conn);
        }
        JDBCTemplate.close(conn);
        
        return result;
    }

    public Member myInfo(String userPwd) {
        Connection conn = JDBCTemplate.getConnection();
        Member m = new MemberDao().myInfo(conn,userPwd);
        JDBCTemplate.close(conn);
        return m;
    }

	public int deleteMember(String userId, String userPwd) {
		 Connection conn =  JDBCTemplate.getConnection();
		 int result = new MemberDao().deleteMember(userId,userPwd,conn);
		 if(result>0)
		 {
			 JDBCTemplate.commit(conn);
		 }else {
			 JDBCTemplate.rollback(conn);
		 }
		 JDBCTemplate.close(conn);
		return result;
	}

	public int deleteSave(String userId) {
		 Connection conn =  JDBCTemplate.getConnection();
		 int result = new MemberDao().deleteSave(userId,conn);
		 if(result>0)
		 {
			 JDBCTemplate.commit(conn);
		 }else {
			 JDBCTemplate.rollback(conn);
		 }
		 JDBCTemplate.close(conn);
		return result;
	}


	public wishList jjimDelete(String id) {
		Connection conn = JDBCTemplate.getConnection();
		wishList w = new MemberDao().jjimDelete(conn,id);
		JDBCTemplate.close(conn);
		return w;
	}

	public int jjimDelete2(wishList w) {
		 Connection conn =  JDBCTemplate.getConnection();
		 int result = new MemberDao().jjimDelete2(w,conn);
		 if(result>0)
		 {
			 JDBCTemplate.commit(conn);
		 }
		 else 
		 {
			 JDBCTemplate.rollback(conn);
		 }
		 JDBCTemplate.close(conn);
		return result;
	}

	public Grade gradeInfo(String id) {
		Connection conn = JDBCTemplate.getConnection();
		Grade g = new MemberDao().gradeInfo(conn,id);
		JDBCTemplate.close(conn);
		return g;
	}


	public ArrayList<Product> self(String id) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Product> list = new MemberDao().self(conn,id);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Product> jjimlist(String id) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Product> list = new MemberDao().jjimlist(conn,id);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Product> Buy(String id) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Product> list = new MemberDao().Buy(conn,id);
		JDBCTemplate.close(conn);
		return list;
	}



}


