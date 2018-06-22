package product.model.vo;

import java.util.ArrayList;

public class PageData {
	private ArrayList<ProductInsert> productList;
	private String pageNavi;
	public PageData() {}
	public PageData(ArrayList<ProductInsert> productList, String pageNavi) {
		super();
		this.productList = productList;
		this.pageNavi = pageNavi;
	}
	public ArrayList<ProductInsert> getProductList() {
		return productList;
	}
	public void setProductList(ArrayList<ProductInsert> productList) {
		this.productList = productList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
