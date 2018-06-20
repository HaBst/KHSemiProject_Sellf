package product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import product.model.dao.CategoryDao;
import product.model.vo.Category;

public class CategoryService {

	public ArrayList<Category> getCateList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Category> list = new CategoryDao().getCateList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

}
