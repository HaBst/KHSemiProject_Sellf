package manager.model.vo;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import manager.model.dao.ManagerProductDao;
import product.model.vo.Product;

public class ProductPageData {
	public ProductPageData() {}
	private ArrayList<Product> productList  = new ArrayList<Product>();
	private String pageNavi;
	
	public ProductPageData(ArrayList<Product> ProductList, String pageNavi) {
		super();
		this.productList = ProductList;
		this.pageNavi = pageNavi;
	}
	
	public ArrayList<Product> getNoticeList() {
		return productList;
	}
	public void setNoticeList(ArrayList<Product> noticeList) {
		this.productList = noticeList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

	public ProductPageData pagingList(int currentPage, ManagerSellSearch mss) {
		Connection conn = JDBCTemplate.getConnection(); //커넥션 객체 생성
		//Service에서는 2가지 값을 정해야 함
		//1.한 페이지당 보이는 리스트의 갯수(게시물의 개수) ->10
		//2.현재 위치를 중심으로 시작 navi에서부터 끝 navi개수-> 5
		int recordCountPerPage = 5; //1. 1페이지에10개씩보이게
		int naviCountPerPage = 5; //2.

		//service에서는 DAO에 2가지 요청을 진행해야 함
		//1.현재 페이지 리스트
		//2.현재 중심으로 만들어지는 navi리스트 
		
		ArrayList<Product> list = new ManagerProductDao().getCurrentPage(conn,currentPage,recordCountPerPage,mss);
		String pageNavi = new ManagerProductDao().getPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage,mss);
		
		ProductPageData pd = null;
		if(!list.isEmpty() && !pageNavi.isEmpty())
		{
			pd = new ProductPageData();
			pd.setNoticeList(list);
			pd.setPageNavi(pageNavi);
		}
		JDBCTemplate.close(conn);
		return pd;
	}
}
