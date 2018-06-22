package product.model.vo;

import org.json.simple.JSONObject;

public class ProductDetail {
	private JSONObject jsonObject = new JSONObject();
	private String productGrade;
	private String productScratch;
	private String productRefund;
	private String productExtra;
	private String productDetail;
	
	public ProductDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductDetail(JSONObject jsonObject, String productGrade, String productScratch, String productRefund,
			String productExtra, String productDetail) {
		super();
		this.jsonObject = jsonObject;
		this.productGrade = productGrade;
		this.productScratch = productScratch;
		this.productRefund = productRefund;
		this.productExtra = productExtra;
		this.productDetail = productDetail;
	}
	public String getProductGrade() {
		return productGrade;
		
	}
	public void setProductGrade(String productNewOrOld) {
		this.productGrade = productGrade;
		jsonObject.put("Use",productNewOrOld);
	}
	public String getProductScratch() {
		return productScratch;
	}
	public void setProductScratch(String productScratch) {
		this.productScratch = productScratch;
		jsonObject.put("Scratch",productScratch);
	}
	public String getProductRefund() {
		return productRefund;
	}
	public void setProductRefund(String productRefund) {
		this.productRefund = productRefund;
		jsonObject.put("Refund",productRefund);
	}
	public String getProductExtra() {
		return productExtra;
	}
	public void setProductExtra(String productExtra) {
		this.productExtra = productExtra;
		jsonObject.put("Extra",productExtra);
	}
	public String getProductDetail() {
		return productDetail;
	}
	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
		jsonObject.put("Detail",productDetail);
	}
	public JSONObject getDetailArr() {
		return jsonObject;
	}
	
	
	
	
}
