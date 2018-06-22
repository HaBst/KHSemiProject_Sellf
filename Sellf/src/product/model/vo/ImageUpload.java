package product.model.vo;

import org.json.simple.JSONObject;

public class ImageUpload {
	private JSONObject jsonObject = new JSONObject();
	private String imgOne;
	private String imgTwo;
	private String imgThree;
	private String imgFour;
	private String imgFive;
	public ImageUpload() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ImageUpload(String imgOne, String imgTwo, String imgThree, String imgFour, String imgFive) {
		super();
		this.imgOne = imgOne;
		this.imgTwo = imgTwo;
		this.imgThree = imgThree;
		this.imgFour = imgFour;
		this.imgFive = imgFive;
		
	}
	public String getImgOne() {
		return imgOne;
	}
	public void setImgOne(String imgOne) {
		this.imgOne = imgOne;
		jsonObject.put("1",imgOne);
	}
	public String getImgTwo() {
		return imgTwo;
		
	}
	public void setImgTwo(String imgTwo) {
		this.imgTwo = imgTwo;
		jsonObject.put("2",imgTwo);
	}
	public String getImgThree() {
		return imgThree;
	}
	public void setImgThree(String imgThree) {
		this.imgThree = imgThree;
		jsonObject.put("3",imgThree);
	}
	public String getImgFour() {
		return imgFour;
	}
	public void setImgFour(String imgFour) {
		this.imgFour = imgFour;
		jsonObject.put("4",imgFour);
	}
	public String getImgFive() {
		return imgFive;
	}
	public void setImgFive(String imgFive) {
		this.imgFive = imgFive;
		jsonObject.put("5",imgFive);
	}
	public JSONObject getImgArr() {
//	         JSONObject result = new JSONObject();
//	         result.put("ScateId", cs.getProductCategorySubId()); // 상품 대분류 가져옴
//	         result.put("ScateName", cs.getProductCategorySubName());
		return jsonObject;
	}


	
}
