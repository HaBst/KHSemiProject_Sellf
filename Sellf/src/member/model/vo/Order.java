package member.model.vo;

import java.sql.Date;

public class Order {
	private int order_pk; //주문인덱스
	private String order_id; //주문 ID
	private String order_user_entire_id_fk; //주문자 ID
	private int order_product_entire_fk; //상품 인덱스
	private int order_state; //주문 상태
	private Date order_date; //주문 일자
	public Order(int order_pk, String order_id, String order_user_entire_id_fk, int order_product_entire_fk,
			int order_state, Date order_date) {
		super();
		this.order_pk = order_pk;
		this.order_id = order_id;
		this.order_user_entire_id_fk = order_user_entire_id_fk;
		this.order_product_entire_fk = order_product_entire_fk;
		this.order_state = order_state;
		this.order_date = order_date;
	}
	public int getOrder_pk() {
		return order_pk;
	}
	public void setOrder_pk(int order_pk) {
		this.order_pk = order_pk;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getOrder_user_entire_id_fk() {
		return order_user_entire_id_fk;
	}
	public void setOrder_user_entire_id_fk(String order_user_entire_id_fk) {
		this.order_user_entire_id_fk = order_user_entire_id_fk;
	}
	public int getOrder_product_entire_fk() {
		return order_product_entire_fk;
	}
	public void setOrder_product_entire_fk(int order_product_entire_fk) {
		this.order_product_entire_fk = order_product_entire_fk;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
	
}
