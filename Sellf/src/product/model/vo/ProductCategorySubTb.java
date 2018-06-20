package product.model.vo;

public class ProductCategorySubTb {

	private int productCategorySubPk;
	private String productCategorySubMainIdFk;
	private String productCategorySubId;
	private String productCategorySubName;
	public ProductCategorySubTb() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductCategorySubTb(int productCategorySubPk, String productCategorySubMainIdFk,
			String productCategorySubId, String productCategorySubName) {
		super();
		this.productCategorySubPk = productCategorySubPk;
		this.productCategorySubMainIdFk = productCategorySubMainIdFk;
		this.productCategorySubId = productCategorySubId;
		this.productCategorySubName = productCategorySubName;
	}
	public int getProductCategorySubPk() {
		return productCategorySubPk;
	}
	public void setProductCategorySubPk(int productCategorySubPk) {
		this.productCategorySubPk = productCategorySubPk;
	}
	public String getProductCategorySubMainIdFk() {
		return productCategorySubMainIdFk;
	}
	public void setProductCategorySubMainIdFk(String productCategorySubMainIdFk) {
		this.productCategorySubMainIdFk = productCategorySubMainIdFk;
	}
	public String getProductCategorySubId() {
		return productCategorySubId;
	}
	public void setProductCategorySubId(String productCategorySubId) {
		this.productCategorySubId = productCategorySubId;
	}
	public String getProductCategorySubName() {
		return productCategorySubName;
	}
	public void setProductCategorySubName(String productCategorySubName) {
		this.productCategorySubName = productCategorySubName;
	}
	
	
}
/*상품카테고리(소)TB	product_category_sub_tb		
Column	Data_Type	PK/FK	Nullable
PRODUCT_CATEGORY_SUB_PK	INT	Primary key	not null
PRODUCT_CATEGORY_SUB_MAIN_ID_FK	varchar2(20)	Foreign key	not null
product_category_sub_id	varchar2(20)		not null
product_category_sub_name	varchar2(20)		not null*/