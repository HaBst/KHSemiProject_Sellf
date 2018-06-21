package manager.model.service;
import java.sql.*;

import common.JDBCTemplate;
import manager.model.dao.ManagerProductDao;
import manager.model.vo.ManagerSellSearch;
//상품검색 서비스
public class ManagerProductService {

	public void getSellSearch(ManagerSellSearch mss) { //front단에서 설정받은 조건을 매개변수로 넘겨서 조건에해당하는 상품들을 DB로가지러 감.
	Connection conn = JDBCTemplate.getConnection();
	new ManagerProductDao().getSellSearch(conn,mss);
	
		
	}
	
}
