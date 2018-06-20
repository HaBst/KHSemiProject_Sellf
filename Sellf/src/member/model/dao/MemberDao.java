package member.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;



public class MemberDao {

	public int checkId(Connection conn, String id, String fullPath) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Properties prop = new Properties();
		
		try {
			prop.load(new FileInputStream(fullPath));
			String query = prop.getProperty("checkId");
			System.out.println(id);
			System.out.println(query);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
