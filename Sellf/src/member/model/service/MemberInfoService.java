package member.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import member.model.dao.MyCartDao;
import member.model.vo.Member;

public class MemberInfoService {

	public Member memberInfo(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		Member m =new MyCartDao().memberInfo(conn,userId);
		JDBCTemplate.close(conn);
		return m;
		
		
	}

}
