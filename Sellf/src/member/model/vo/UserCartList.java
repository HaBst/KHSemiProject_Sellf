package member.model.vo;

public class UserCartList {

	private String userEntirePk;
	private int productEntireFk;
	private String productName;
	private String price;
	private String image;
	private int productAmount;
	private String productDetail;
	
	public UserCartList() {
		// TODO Auto-generated constructor stub
	}
	public UserCartList(String userEntirePk, int productEntireFk, String productName, String price, String image,
			int productAmount, String productDetail) {
		super();
		this.userEntirePk = userEntirePk;
		this.productEntireFk = productEntireFk;
		this.productName = productName;
		this.price = price;
		this.image = image;
		this.productAmount = productAmount;
		this.productDetail = productDetail;
	}
	public String getUserEntirePk() {
		return userEntirePk;
	}
	public void setUserEntirePk(String userEntirePk) {
		this.userEntirePk = userEntirePk;
	}
	public int getProductEntireFk() {
		return productEntireFk;
	}
	public void setProductEntireFk(int productEntireFk) {
		this.productEntireFk = productEntireFk;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getProductAmount() {
		return productAmount;
	}
	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}
	public String getProductDetail() {
		return productDetail;
	}
	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}
	
	
	
}
