package product.model.vo;

public class ProductInsert {
	
//	private int productEntirePK;
	private String productEntireUserIdFK;
	private String productEntireCateMainIdFK;
	private String productEntireCateSubIdFK;
	private String productName;
	private int productPrice;
//	private String productImage;
	private int productAmount;
//	private String productState;
	private String productGrade;
	private String productDetail;
	
	public ProductInsert() {}

	public ProductInsert(String productEntireUserIdFK, String productEntireCateMainIdFK,
			String productEntireCateSubIdFK, String productName, int productPrice,
			int productAmount, String productGrade, String productDetail) {

		this.productEntireUserIdFK = productEntireUserIdFK;
		this.productEntireCateMainIdFK = productEntireCateMainIdFK;
		this.productEntireCateSubIdFK = productEntireCateSubIdFK;
		this.productName = productName;
		this.productPrice = productPrice;
//		this.productImage = productImage;
		this.productAmount = productAmount;
//		this.productState = productState;
		this.productGrade = productGrade;
		this.productDetail = productDetail;
	}

	public String getProductEntireUserIdFK() {
		return productEntireUserIdFK;
	}

	public void setProductEntireUserIdFK(String productEntireUserIdFK) {
		this.productEntireUserIdFK = productEntireUserIdFK;
	}

	public String getProductEntireCateMainIdFK() {
		return productEntireCateMainIdFK;
	}

	public void setProductEntireCateMainIdFK(String productEntireCateMainIdFK) {
		this.productEntireCateMainIdFK = productEntireCateMainIdFK;
	}

	public String getProductEntireCateSubIdFK() {
		return productEntireCateSubIdFK;
	}

	public void setProductEntireCateSubIdFK(String productEntireCateSubIdFK) {
		this.productEntireCateSubIdFK = productEntireCateSubIdFK;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

//	public String getProductImage() {
//		return productImage;
//	}
//
//	public void setProductImage(String productImage) {
//		this.productImage = productImage;
//	}

	public int getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}

	public String getProductGrade() {
		return productGrade;
	}

	public void setProductGrade(String productGrade) {
		this.productGrade = productGrade;
	}

	public String getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}
	
	
	
	

	





	
	
}



//PRODUCT_NO	NUMBER
//PRODUCT_NAME	VARCHAR2(200 BYTE)
//PRODUCT_CATEGORY	VARCHAR2(50 BYTE)
//PRODUCT_ITEM	VARCHAR2(50 BYTE)
//PRODUCT_INFO	NVARCHAR2(2000 CHAR)
//PRODUCT_COUNT	NUMBER
//PRODUCT_ENROLLDATE	DATE
//PRODUCT_SELLER_ID	VARCHAR2(20 BYTE)
//PRODUCT_BUY_INFO	NVARCHAR2(30 CHAR)
//PRODUCT_PRICE	NUMBER
//PRODUCT_BUY_DATE	DATE