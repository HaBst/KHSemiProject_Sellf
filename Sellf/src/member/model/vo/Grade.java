package member.model.vo;

public class Grade {
private int user_grade_pk;		//회원등급 인덱스
private String user_grade_id;	//회원등급 아이디
private String user_grade_name;	//회원등급명
private int user_grade_fees;	//회원등급별 수수료

public Grade() {}

public Grade(int user_grade_pk, String user_grade_id, String user_grade_name, int user_grade_fees) {
	super();
	this.user_grade_pk = user_grade_pk;
	this.user_grade_id = user_grade_id;
	this.user_grade_name = user_grade_name;
	this.user_grade_fees = user_grade_fees;
}

public int getUser_grade_pk() {
	return user_grade_pk;
}

public void setUser_grade_pk(int user_grade_pk) {
	this.user_grade_pk = user_grade_pk;
}

public String getUser_grade_id() {
	return user_grade_id;
}

public void setUser_grade_id(String user_grade_id) {
	this.user_grade_id = user_grade_id;
}

public String getUser_grade_name() {
	return user_grade_name;
}

public void setUser_grade_name(String user_grade_name) {
	this.user_grade_name = user_grade_name;
}

public int getUser_grade_fees() {
	return user_grade_fees;
}

public void setUser_grade_fees(int user_grade_fees) {
	this.user_grade_fees = user_grade_fees;
}




}
