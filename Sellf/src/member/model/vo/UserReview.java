package member.model.vo;

import java.sql.Date;

public class UserReview {

	
	private int userReviewPk;
	private String userReviewUserEntireIdFk;
	private String userReviewUserEntireReviewedIdFk;
	private int userReviewProductEntireFk;
	private String userReviewComment;
	private int userReviewRating;
	private Date userReviewDate;
	
	public UserReview() {
		// TODO Auto-generated constructor stub
	}
	public UserReview(int userReviewPk, String userReviewUserEntireIdFk, String userReviewUserEntireReviewedIdFk,
			int userReviewProductEntireFk, String userReviewComment, int userReviewRating, Date userReviewDate) {
		super();
		this.userReviewPk = userReviewPk;
		this.userReviewUserEntireIdFk = userReviewUserEntireIdFk;
		this.userReviewUserEntireReviewedIdFk = userReviewUserEntireReviewedIdFk;
		this.userReviewProductEntireFk = userReviewProductEntireFk;
		this.userReviewComment = userReviewComment;
		this.userReviewRating = userReviewRating;
		this.userReviewDate = userReviewDate;
	}
	public int getUserReviewPk() {
		return userReviewPk;
	}
	public void setUserReviewPk(int userReviewPk) {
		this.userReviewPk = userReviewPk;
	}
	public String getUserReviewUserEntireIdFk() {
		return userReviewUserEntireIdFk;
	}
	public void setUserReviewUserEntireIdFk(String userReviewUserEntireIdFk) {
		this.userReviewUserEntireIdFk = userReviewUserEntireIdFk;
	}
	public String getUserReviewUserEntireReviewedIdFk() {
		return userReviewUserEntireReviewedIdFk;
	}
	public void setUserReviewUserEntireReviewedIdFk(String userReviewUserEntireReviewedIdFk) {
		this.userReviewUserEntireReviewedIdFk = userReviewUserEntireReviewedIdFk;
	}
	public int getUserReviewProductEntireFk() {
		return userReviewProductEntireFk;
	}
	public void setUserReviewProductEntireFk(int userReviewProductEntireFk) {
		this.userReviewProductEntireFk = userReviewProductEntireFk;
	}
	public String getUserReviewComment() {
		return userReviewComment;
	}
	public void setUserReviewComment(String userReviewComment) {
		this.userReviewComment = userReviewComment;
	}
	public int getUserReviewRating() {
		return userReviewRating;
	}
	public void setUserReviewRating(int userReviewRating) {
		this.userReviewRating = userReviewRating;
	}
	public Date getUserReviewDate() {
		return userReviewDate;
	}
	public void setUserReviewDate(Date userReviewDate) {
		this.userReviewDate = userReviewDate;
	}
	
	
	
}

/*
USER_REVIEW_PK	INT	Primary key	not null	AI	�쉶�썝�룊媛��씤�뜳�뒪
USER_REVIEW_USER_ENTIRE_ID_FK	varchar2(20)	Foreign key	not null		�뙋留ㅼ옄ID
USER_REVIEW_USER_ENTIRE_REVIEWED_ID_FK	varchar2(20)	Foreign key	not null		援щℓ�옄ID
USER_REVIEW_PRODUCT_ENTIRE_FK	INT	Foreign key	not null		�긽�뭹�씤�뜳�뒪(FK)
user_review_comment	varchar2(100)				由щ럭�궡�슜
user_review_rating	NUMBER		not null		�벑湲�(0~5)
user_review_date	DATE		not null		由щ럭�씪�옄*/