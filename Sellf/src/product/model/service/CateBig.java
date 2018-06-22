package product.model.vo;

public class CateBig {
	private String productCategoryId;
	private String productCateGoryName;
	
	public CateBig() {
	}
	public CateBig(String productCategoryId, String productCateGoryName) {
		super();
		this.productCategoryId = productCategoryId;
		this.productCateGoryName = productCateGoryName;
	}
	public String getProductCategoryId() {
		return productCategoryId;
	}
	public void setProductCategoryId(String productCategoryId) {
		this.productCategoryId = productCategoryId;
	}
	public String getProductCateGoryName() {
		return productCateGoryName;
	}
	public void setProductCateGoryName(String productCateGoryName) {
		this.productCateGoryName = productCateGoryName;
	}
	
	
}
