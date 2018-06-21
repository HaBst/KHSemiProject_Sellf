package product.model.vo;

public class CateSmall {
	private String productCategorySubId;
	private String ProductCategorySubName;
	
	public CateSmall() {
	}
	public CateSmall(String productCategorySubId, String productCategorySubName) {
		super();
		this.productCategorySubId = productCategorySubId;
		ProductCategorySubName = productCategorySubName;
	}
	public String getProductCategorySubId() {
		return productCategorySubId;
	}
	public void setProductCategorySubId(String productCategorySubId) {
		this.productCategorySubId = productCategorySubId;
	}
	public String getProductCategorySubName() {
		return ProductCategorySubName;
	}
	public void setProductCategorySubName(String productCategorySubName) {
		ProductCategorySubName = productCategorySubName;
	}
	
	
}
