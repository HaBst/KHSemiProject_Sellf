package manager.model.dao;
import java.sql.*;
import java.util.ArrayList;

import common.JDBCTemplate;
import manager.model.vo.ManagerSellSearch;

public class ManagerProductDao {

	public void getSellSearch(Connection conn, ManagerSellSearch mss) {
		// service로부터 conn객체와 front단으로부터 조건이 들어있는 mss객체를 가져와 dynamic query를 작성하여 paging한 뒤 다시 검색 조건을 입력 받은 페이지로 결과를 리턴할 예정...
		 PreparedStatement pstmt = null;
		 ResultSet rset = null;
		 System.out.println(mss);
		 String query=""; 
		 
		 StringBuilder sb = new StringBuilder();
		 ArrayList<Object> params = new ArrayList<Object>();

	}

	
}
