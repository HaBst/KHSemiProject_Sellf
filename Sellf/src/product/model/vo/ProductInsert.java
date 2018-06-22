package product.model.vo;

public class ProductInsert {
	
//	private int productEntirePK;
	private String productEntireUserIdFK;
	private String productEntireCateMainIdFK;
	private String productEntireCateSubIdFK;
	private String productName;
	private String productOldNew;
	private int productAmount;
	private int productPrice;
	private ImageUpload productImage;
	// imgOne imgTwo imgThree imgFour imgFive
	private ProductDetail productDetail;
	// grade scratch refund extra detail
	
	public ProductInsert() {}
	public ProductInsert(String productEntireUserIdFK, String productEntireCateMainIdFK,
			String productEntireCateSubIdFK, String productName, String productOldNew, int productAmount,
			int productPrice, ImageUpload productImage,ProductDetail productDetail) {
		super();
		this.productEntireUserIdFK = productEntireUserIdFK;
		this.productEntireCateMainIdFK = productEntireCateMainIdFK;
		this.productEntireCateSubIdFK = productEntireCateSubIdFK;
		this.productName = productName;
		this.productOldNew = productOldNew;
		this.productAmount = productAmount;
		this.productPrice = productPrice;
		this.productImage = productImage;
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
	public String getProductOldNew() {
		return productOldNew;
	}
	public void setProductOldNew(String productOldNew) {
		this.productOldNew = productOldNew;
	}
	public int getProductAmount() {
		return productAmount;
	}
	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public ImageUpload getProductImage() {
		return productImage;
	}
	public void setProductImage(ImageUpload productImage) {
		this.productImage = productImage;
	}
	public ProductDetail getProductDetail() {
		return productDetail;
	}
	public void setProductDetail(ProductDetail productDetail) {
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