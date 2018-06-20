package board.model.vo;

import java.sql.Date;

public class Notice 
{
 private int notice_pk; 
 private String notice_main_admin_id_fk; 
 private String notice_subject; 
 private String notice_image; 
 private String notice_content;
 private Date notice_registration_date;

public Notice() {}

public Notice(int notice_pk, String notice_main_admin_id_fk, String notice_subject, String notice_image,
		String notice_content, Date notice_registration_date) {
	super();
	this.notice_pk = notice_pk;
	this.notice_main_admin_id_fk = notice_main_admin_id_fk;
	this.notice_subject = notice_subject;
	this.notice_image = notice_image;
	this.notice_content = notice_content;
	this.notice_registration_date = notice_registration_date;
}

public int getNotice_pk() {
	return notice_pk;
}

public void setNotice_pk(int notice_pk) {
	this.notice_pk = notice_pk;
}

public String getNotice_main_admin_id_fk() {
	return notice_main_admin_id_fk;
}

public void setNotice_main_admin_id_fk(String notice_main_admin_id_fk) {
	this.notice_main_admin_id_fk = notice_main_admin_id_fk;
}

public String getNotice_subject() {
	return notice_subject;
}

public void setNotice_subject(String notice_subject) {
	this.notice_subject = notice_subject;
}

public String getNotice_image() {
	return notice_image;
}

public void setNotice_image(String notice_image) {
	this.notice_image = notice_image;
}

public String getNotice_content() {
	return notice_content;
}

public void setNotice_content(String notice_content) {
	this.notice_content = notice_content;
}

public Date getNotice_registration_date() {
	return notice_registration_date;
}

public void setNotice_registration_date(Date notice_registration_date) {
	this.notice_registration_date = notice_registration_date;
}


}
