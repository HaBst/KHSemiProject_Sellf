package product.model.vo;

public class ProductCategoryMainTb {
	
	private int productCategoryPkInt;
	private String productCategoryId;
	private String productCategoryName;
	
	public ProductCategoryMainTb() {
		super();
	
	}

	public ProductCategoryMainTb(int productCategoryPkInt, String productCategoryId, String productCategoryName) {
		super();
		this.productCategoryPkInt = productCategoryPkInt;
		this.productCategoryId = productCategoryId;
		this.productCategoryName = productCategoryName;
	}


	public int getProductCategoryPkInt() {
		return productCategoryPkInt;
	}


	public void setProductCategoryPkInt(int productCategoryPkInt) {
		this.productCategoryPkInt = productCategoryPkInt;
	}


	public String getProductCategoryId() {
		return productCategoryId;
	}


	public void setProductCategoryId(String productCategoryId) {
		this.productCategoryId = productCategoryId;
	}


	public String getProductCategoryName() {
		return productCategoryName;
	}


	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
	}
	
	
}

/*
PRODUCT_CATEGORY_PK	INT
product_category_id	varchar2(20)
product_category_name	varchar2(20)*/