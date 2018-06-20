package board.model.vo;

import java.util.ArrayList;

public class ProductReviewPageData {
	private ArrayList<ProductReview> productReviewList;
	private String ProductReviewPageNavi;
	public ProductReviewPageData() {}
	
	public ProductReviewPageData(ArrayList<ProductReview> productReviewList, String productReviewPageNavi) 
	{
		this.productReviewList = productReviewList;
		this.ProductReviewPageNavi = productReviewPageNavi;
	}

	public ArrayList<ProductReview> getProductReviewList() {
		return productReviewList;
	}

	public void setProductReviewList(ArrayList<ProductReview> productReviewList) {
		this.productReviewList = productReviewList;
	}

	public String getProductReviewPageNavi() {
		return ProductReviewPageNavi;
	}

	public void setProductReviewPageNavi(String productReviewPageNavi) {
		ProductReviewPageNavi = productReviewPageNavi;
	}
	
}
