package product.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import product.model.dao.FileDao;
import product.model.vo.DataFile;

public class FileService {
	public int uploadFile(DataFile df) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new FileDao().uploadFile(conn,df);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}
}
