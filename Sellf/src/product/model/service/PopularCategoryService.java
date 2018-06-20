package product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import product.model.dao.PopularCategoryDao;
import product.model.vo.ProductCategorySubTb;
import product.model.vo.ProductSellTb;

public class PopularCategoryService {

	public ArrayList<ProductCategorySubTb> popularCategoryList() {
	Connection conn = JDBCTemplate.getConnection();
	ArrayList<ProductCategorySubTb> list = new PopularCategoryDao().popularCategoryList(conn);
	JDBCTemplate.close(conn);
	return list;
		
	}


}
