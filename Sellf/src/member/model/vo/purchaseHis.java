package member.model.vo;

public class purchaseHis {
private int USER_PUR_HIS_PK; //회원구매내역 인덱스
private String USER_PUR_HIS_USER_ENTIRE_ID_FK; //구매한 회원 ID
private String USER_PUR_HIS_PAYMENT_ID_FK;	//결제내역 ID

public purchaseHis() {}

public purchaseHis(int uSER_PUR_HIS_PK, String uSER_PUR_HIS_USER_ENTIRE_ID_FK, String uSER_PUR_HIS_PAYMENT_ID_FK) {
	super();
	USER_PUR_HIS_PK = uSER_PUR_HIS_PK;
	USER_PUR_HIS_USER_ENTIRE_ID_FK = uSER_PUR_HIS_USER_ENTIRE_ID_FK;
	USER_PUR_HIS_PAYMENT_ID_FK = uSER_PUR_HIS_PAYMENT_ID_FK;
}

public int getUSER_PUR_HIS_PK() {
	return USER_PUR_HIS_PK;
}

public void setUSER_PUR_HIS_PK(int uSER_PUR_HIS_PK) {
	USER_PUR_HIS_PK = uSER_PUR_HIS_PK;
}

public String getUSER_PUR_HIS_USER_ENTIRE_ID_FK() {
	return USER_PUR_HIS_USER_ENTIRE_ID_FK;
}

public void setUSER_PUR_HIS_USER_ENTIRE_ID_FK(String uSER_PUR_HIS_USER_ENTIRE_ID_FK) {
	USER_PUR_HIS_USER_ENTIRE_ID_FK = uSER_PUR_HIS_USER_ENTIRE_ID_FK;
}

public String getUSER_PUR_HIS_PAYMENT_ID_FK() {
	return USER_PUR_HIS_PAYMENT_ID_FK;
}

public void setUSER_PUR_HIS_PAYMENT_ID_FK(String uSER_PUR_HIS_PAYMENT_ID_FK) {
	USER_PUR_HIS_PAYMENT_ID_FK = uSER_PUR_HIS_PAYMENT_ID_FK;
}


}

