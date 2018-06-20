package board.model.vo;

import java.sql.Date;

public class ProductReview {

private int user_rv_pk;
private String user_rv_user_entire_id_fk;
private String user_rv_user_entire_rved_id_fk;
private int user_rv_product_entire_fk; 
private String user_review_comment;
private int user_review_rating;
private Date user_review_date;

public ProductReview() {}

public ProductReview(int user_rv_pk, String user_rv_user_entire_id_fk, String user_rv_user_entire_rved_id_fk,
		int user_rv_product_entire_fk, String user_review_comment, int user_review_rating, Date user_review_date) {
	super();
	this.user_rv_pk = user_rv_pk;
	this.user_rv_user_entire_id_fk = user_rv_user_entire_id_fk;
	this.user_rv_user_entire_rved_id_fk = user_rv_user_entire_rved_id_fk;
	this.user_rv_product_entire_fk = user_rv_product_entire_fk;
	this.user_review_comment = user_review_comment;
	this.user_review_rating = user_review_rating;
	this.user_review_date = user_review_date;
}

public int getUser_rv_pk() {
	return user_rv_pk;
}

public void setUser_rv_pk(int user_rv_pk) {
	this.user_rv_pk = user_rv_pk;
}

public String getUser_rv_user_entire_id_fk() {
	return user_rv_user_entire_id_fk;
}

public void setUser_rv_user_entire_id_fk(String user_rv_user_entire_id_fk) {
	this.user_rv_user_entire_id_fk = user_rv_user_entire_id_fk;
}

public String getUser_rv_user_entire_rved_id_fk() {
	return user_rv_user_entire_rved_id_fk;
}

public void setUser_rv_user_entire_rved_id_fk(String user_rv_user_entire_rved_id_fk) {
	this.user_rv_user_entire_rved_id_fk = user_rv_user_entire_rved_id_fk;
}

public int getUser_rv_product_entire_fk() {
	return user_rv_product_entire_fk;
}

public void setUser_rv_product_entire_fk(int user_rv_product_entire_fk) {
	this.user_rv_product_entire_fk = user_rv_product_entire_fk;
}

public String getUser_review_comment() {
	return user_review_comment;
}

public void setUser_review_comment(String user_review_comment) {
	this.user_review_comment = user_review_comment;
}

public int getUser_review_rating() {
	return user_review_rating;
}

public void setUser_review_rating(int user_review_rating) {
	this.user_review_rating = user_review_rating;
}

public Date getUser_review_date() {
	return user_review_date;
}

public void setUser_review_date(Date user_review_date) {
	this.user_review_date = user_review_date;
} 



}