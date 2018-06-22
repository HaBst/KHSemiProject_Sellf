package member.model.vo;

import java.util.ArrayList;

public class ReviewPageData {
	private ArrayList<UserReview> reviewList = new ArrayList<UserReview>();
	private String pageNavi;
	public ReviewPageData() {}
	
	
	public ReviewPageData(ArrayList<UserReview> reviewList, String pageNavi) {
		super();
		this.reviewList = reviewList;
		this.pageNavi = pageNavi;
	}


	public ArrayList<UserReview> getReviewList() {
		return reviewList;
	}
	public void setReviewList(ArrayList<UserReview> reviewList) {
		this.reviewList = reviewList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
