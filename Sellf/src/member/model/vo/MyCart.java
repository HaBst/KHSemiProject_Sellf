package member.model.vo;

import java.sql.Date;

public class MyCart {

	private int orderPk;
	private String orderId;
	private String orderUserEntireIdFk;
	private String orderProductEntireFk;
	private int orderState;
	private Date orderDate;
	public MyCart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyCart(int orderPk, String orderId, String orderUserEntireIdFk, String orderProductEntireFk, int orderState,
			Date orderDate) {
		super();
		this.orderPk = orderPk;
		this.orderId = orderId;
		this.orderUserEntireIdFk = orderUserEntireIdFk;
		this.orderProductEntireFk = orderProductEntireFk;
		this.orderState = orderState;
		this.orderDate = orderDate;
	}
	public int getOrderPk() {
		return orderPk;
	}
	public void setOrderPk(int orderPk) {
		this.orderPk = orderPk;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderUserEntireIdFk() {
		return orderUserEntireIdFk;
	}
	public void setOrderUserEntireIdFk(String orderUserEntireIdFk) {
		this.orderUserEntireIdFk = orderUserEntireIdFk;
	}
	public String getOrderProductEntireFk() {
		return orderProductEntireFk;
	}
	public void setOrderProductEntireFk(String orderProductEntireFk) {
		this.orderProductEntireFk = orderProductEntireFk;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	

}

/*ORDER_PK
order_id
ORDER_USER_ENTIRE_ID_FK
ORDER_PRODUCT_ENTIRE_FK
order_state
order_date*/