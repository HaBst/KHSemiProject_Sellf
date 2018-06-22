package member.model.service;
import java.sql.Connection;
import java.util.ArrayList;
import common.JDBCTemplate;
import member.model.dao.InfoDao;
import member.model.dao.MemberDao;
import member.model.dao.MyCartDao;
import member.model.vo.Grade;
import member.model.vo.Member;
import member.model.vo.purchaseHis;
import member.model.vo.wishList;
import product.model.vo.PageData;
import product.model.vo.Product;

public class myInfoService {


    public int updateMember(Member m) {
        Connection conn = JDBCTemplate.getConnection();
        int result = new InfoDao().updateMember(conn,m);
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
        Member m = new InfoDao().myInfo(conn,userPwd);
        JDBCTemplate.close(conn);
        return m;
    }

	public int deleteMember(String userId, String userPwd) {
		 Connection conn =  JDBCTemplate.getConnection();
		 int result = new InfoDao().deleteMember(userId,userPwd,conn);
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
		 int result = new InfoDao().deleteSave(userId,conn);
		 if(result>0)
		 {
			 JDBCTemplate.commit(conn);
		 }else {
			 JDBCTemplate.rollback(conn);
		 }
		 JDBCTemplate.close(conn);
		return result;
	}

	public Grade gradeInfo(String id) {
		Connection conn = JDBCTemplate.getConnection();
		Grade g = new InfoDao().gradeInfo(conn,id);
		JDBCTemplate.close(conn);
		return g;
	}


	public ArrayList<Product> self(String id) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Product> list = new InfoDao().self(conn,id);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Product> jjimlist(String id) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Product> list = new InfoDao().jjimlist(conn,id);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Product> Buy(String id) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Product> list = new InfoDao().Buy(conn,id);
		JDBCTemplate.close(conn);
		return list;
	}

	public int deletejjim(String id, int deleteNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new InfoDao().delete(conn,deleteNo,id);
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
		public ArrayList<Product> myCartList(String id, int cartNo) {
			Connection conn = JDBCTemplate.getConnection();
			ArrayList<Product> list =  new InfoDao().myCartList(conn,id,cartNo);
			JDBCTemplate.close(conn);
			return list;
		}


		public int cash(String id, int cash3) {
				 Connection conn = JDBCTemplate.getConnection();
			        int result = new InfoDao().cash(conn,id,cash3);
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
}



