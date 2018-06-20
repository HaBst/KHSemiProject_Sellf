package product.model.vo;

import java.sql.Date;

public class ProductSellTb {
	
	private int productSellPk;
	private String productSellId;
	private String productEntireCategoryMainIdFk;
	private String productEntireCategorySubIdFk;
	private int productSellCount;
	private int productSellReturnCount;
	private int productSellTotalIncome;
	private Date productSellInfoDate;
	public ProductSellTb() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductSellTb(int productSellPk, String productSellId, String productEntireCategoryMainIdFk,
			String productEntireCategorySubIdFk, int productSellCount, int productSellReturnCount,
			int productSellTotalIncome, Date productSellInfoDate) {
		super();
		this.productSellPk = productSellPk;
		this.productSellId = productSellId;
		this.productEntireCategoryMainIdFk = productEntireCategoryMainIdFk;
		this.productEntireCategorySubIdFk = productEntireCategorySubIdFk;
		this.productSellCount = productSellCount;
		this.productSellReturnCount = productSellReturnCount;
		this.productSellTotalIncome = productSellTotalIncome;
		this.productSellInfoDate = productSellInfoDate;
	}
	public int getProductSellPk() {
		return productSellPk;
	}
	public void setProductSellPk(int productSellPk) {
		this.productSellPk = productSellPk;
	}
	public String getProductSellId() {
		return productSellId;
	}
	public void setProductSellId(String productSellId) {
		this.productSellId = productSellId;
	}
	public String getProductEntireCategoryMainIdFk() {
		return productEntireCategoryMainIdFk;
	}
	public void setProductEntireCategoryMainIdFk(String productEntireCategoryMainIdFk) {
		this.productEntireCategoryMainIdFk = productEntireCategoryMainIdFk;
	}
	public String getProductEntireCategorySubIdFk() {
		return productEntireCategorySubIdFk;
	}
	public void setProductEntireCategorySubIdFk(String productEntireCategorySubIdFk) {
		this.productEntireCategorySubIdFk = productEntireCategorySubIdFk;
	}
	public int getProductSellCount() {
		return productSellCount;
	}
	public void setProductSellCount(int productSellCount) {
		this.productSellCount = productSellCount;
	}
	public int getProductSellReturnCount() {
		return productSellReturnCount;
	}
	public void setProductSellReturnCount(int productSellReturnCount) {
		this.productSellReturnCount = productSellReturnCount;
	}
	public int getProductSellTotalIncome() {
		return productSellTotalIncome;
	}
	public void setProductSellTotalIncome(int productSellTotalIncome) {
		this.productSellTotalIncome = productSellTotalIncome;
	}
	public Date getProductSellInfoDate() {
		return productSellInfoDate;
	}
	public void setProductSellInfoDate(Date productSellInfoDate) {
		this.productSellInfoDate = productSellInfoDate;
	}
	
	
	
	

}

/*PRODUCT_SELL_PK	INT	판매통계인덱스
product_sell_id	varchar2(20)	판매통계아이디
PRODUCT_ENTIRE_CATEGORY_MAIN_ID_FK	varchar2(20)	상품대분류
PRODUCT_ENTIRE_CATEGORY_SUB_ID_FK	varchar2(20)	상품소분류
product_sell_count	INT	판매횟수
product_sell_return_count	INT	환불횟수
product_sell_total_income	NUMBER	총수익
product_sell_info_date	DATE	정보수집일*/