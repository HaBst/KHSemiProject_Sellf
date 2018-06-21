package member.model.vo;

public class wishList {
	private int USER_WL_PK; //관심상품 인덱스
	private int USER_WL_PRODUCT_ENTIRE_FK;//상품 인덱스(FK)
	private String USER_WL_USER_ENTIRE_ID_FK; //회원 ID
	public wishList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public wishList(int uSER_WL_PK, int uSER_WL_PRODUCT_ENTIRE_FK, String uSER_WL_USER_ENTIRE_ID_FK) {
		super();
		USER_WL_PK = uSER_WL_PK;
		USER_WL_PRODUCT_ENTIRE_FK = uSER_WL_PRODUCT_ENTIRE_FK;
		USER_WL_USER_ENTIRE_ID_FK = uSER_WL_USER_ENTIRE_ID_FK;
	}
	public int getUSER_WL_PK() {
		return USER_WL_PK;
	}
	public void setUSER_WL_PK(int uSER_WL_PK) {
		USER_WL_PK = uSER_WL_PK;
	}
	public int getUSER_WL_PRODUCT_ENTIRE_FK() {
		return USER_WL_PRODUCT_ENTIRE_FK;
	}
	public void setUSER_WL_PRODUCT_ENTIRE_FK(int uSER_WL_PRODUCT_ENTIRE_FK) {
		USER_WL_PRODUCT_ENTIRE_FK = uSER_WL_PRODUCT_ENTIRE_FK;
	}
	public String getUSER_WL_USER_ENTIRE_ID_FK() {
		return USER_WL_USER_ENTIRE_ID_FK;
	}
	public void setUSER_WL_USER_ENTIRE_ID_FK(String uSER_WL_USER_ENTIRE_ID_FK) {
		USER_WL_USER_ENTIRE_ID_FK = uSER_WL_USER_ENTIRE_ID_FK;
	}
	
	
}


