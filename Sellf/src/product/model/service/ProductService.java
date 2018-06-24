package product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import common.JDBCTemplate;
import product.model.dao.ProductDao;
import product.model.vo.ImageFile;
import product.model.vo.Product;
import product.model.vo.SellerRate;

public class ProductService {

	public ArrayList<Product> ProductSearchKeyword(String keyword) {
		Connection conn = JDBCTemplate.getConnection();
		return null;
	}
	public int uploadFile(ImageFile imgFile) {
		Connection conn= JDBCTemplate.getConnection();
		int result = new ProductDao().uploadFile(conn,imgFile);
		if(result>0)
		{
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;	
	}
	public ArrayList<Product> productSortCategory(String searchKey, String subCategory,int onePageShowProduct, int currentPage, String orderType) {
		Connection conn= JDBCTemplate.getConnection();
		ArrayList<Product> resultList = new ProductDao().productSortCategory(conn,searchKey,subCategory,onePageShowProduct,currentPage, orderType);
		JDBCTemplate.close(conn);
		return resultList;	
	}
	public Product selectOneProduct(int productPk) {
		Connection conn = JDBCTemplate.getConnection();
		Product p = new ProductDao().selectOneProduct(conn, productPk);	
		JDBCTemplate.close(conn);
		return p;
	}
	public SellerRate raputationAvr(String sellerId) {
		Connection conn = JDBCTemplate.getConnection();
		SellerRate sellerRate = new ProductDao().raputationAvr(conn, sellerId);
		JDBCTemplate.close(conn);
		return sellerRate;
	}

}
