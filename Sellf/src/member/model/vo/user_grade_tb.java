package member.model.vo;

public class user_grade_tb {
private String USER_GRADE_PK;
private String USER_GRADE_ID;
private String USER_GRADE_NAME;
private String USER_GRADE_FEES;


public user_grade_tb(String uSER_GRADE_PK, String uSER_GRADE_ID, String uSER_GRADE_NAME, String uSER_GRADE_FEES) {
	super();
	USER_GRADE_PK = uSER_GRADE_PK;
	USER_GRADE_ID = uSER_GRADE_ID;
	USER_GRADE_NAME = uSER_GRADE_NAME;
	USER_GRADE_FEES = uSER_GRADE_FEES;
}
public String getUSER_GRADE_PK() {
	return USER_GRADE_PK;
}
public void setUSER_GRADE_PK(String uSER_GRADE_PK) {
	USER_GRADE_PK = uSER_GRADE_PK;
}
public String getUSER_GRADE_ID() {
	return USER_GRADE_ID;
}
public void setUSER_GRADE_ID(String uSER_GRADE_ID) {
	USER_GRADE_ID = uSER_GRADE_ID;
}
public String getUSER_GRADE_NAME() {
	return USER_GRADE_NAME;
}
public void setUSER_GRADE_NAME(String uSER_GRADE_NAME) {
	USER_GRADE_NAME = uSER_GRADE_NAME;
}
public String getUSER_GRADE_FEES() {
	return USER_GRADE_FEES;
}
public void setUSER_GRADE_FEES(String uSER_GRADE_FEES) {
	USER_GRADE_FEES = uSER_GRADE_FEES;
}

}
