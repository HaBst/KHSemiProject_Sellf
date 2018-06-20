package member.model.vo;

import oracle.sql.DATE;

public class Member {
	/*
	USER_ENTIRE_PK	NUMBER(38,0)
	USER_ID	VARCHAR2(20 BYTE)
	USER_NAME	VARCHAR2(20 BYTE)
	USER_PWD	VARCHAR2(20 BYTE)
	USER_PHONE	VARCHAR2(20 BYTE)
	USER_BIRTH	VARCHAR2(20 BYTE)
	USER_GENDER	CHAR(1 BYTE)
	USER_ADDR	NVARCHAR2(70 CHAR)
	USER_ENTIRE_USER_GRADE_ID_FK	VARCHAR2(20 BYTE)
	USER_EMAIL	VARCHAR2(30 BYTE)
	USER_INTEREST	NVARCHAR2(10 CHAR)
	USER_ENROLLDATE	DATE
	*/
	private int user_entire_pk;
	private String user_id;
	private String user_name;
	private String user_pwd;
	private String user_phone;
	private String user_birth;
	private String user_gender;
	private String user_addr;
	private String user_user_entire_user_grade_id_fk;
	private String user_email;
	private String user_interest;
	private DATE user_enrolldate;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(int user_entire_pk, String user_id, String user_name, String user_pwd, String user_phone,
			String user_birth, String user_gender, String user_addr, String user_user_entire_user_grade_id_fk,
			String user_email, String user_interest, DATE user_enrolldate) {
		super();
		this.user_entire_pk = user_entire_pk;
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_pwd = user_pwd;
		this.user_phone = user_phone;
		this.user_birth = user_birth;
		this.user_gender = user_gender;
		this.user_addr = user_addr;
		this.user_user_entire_user_grade_id_fk = user_user_entire_user_grade_id_fk;
		this.user_email = user_email;
		this.user_interest = user_interest;
		this.user_enrolldate = user_enrolldate;
	}
	public int getUser_entire_pk() {
		return user_entire_pk;
	}
	public void setUser_entire_pk(int user_entire_pk) {
		this.user_entire_pk = user_entire_pk;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public String getUser_user_entire_user_grade_id_fk() {
		return user_user_entire_user_grade_id_fk;
	}
	public void setUser_user_entire_user_grade_id_fk(String user_user_entire_user_grade_id_fk) {
		this.user_user_entire_user_grade_id_fk = user_user_entire_user_grade_id_fk;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_interest() {
		return user_interest;
	}
	public void setUser_interest(String user_interest) {
		this.user_interest = user_interest;
	}
	public DATE getUser_enrolldate() {
		return user_enrolldate;
	}
	public void setUser_enrolldate(DATE user_enrolldate) {
		this.user_enrolldate = user_enrolldate;
	}
	
	
}