package board.model.vo;

import java.sql.Date;

public class NoticeComment 
{
	private int notice_comment_pk;
	private int notice_comment_notice_fk;
	private String notice_comment_user_id_fk;
	private int notice_comment_id;
	private int notice_comment_seq;
	private int notice_comment_depth;
	private String notice_comment_content; 
	private Date notice_comment_date;
	
	
public NoticeComment() {}


	public NoticeComment(int notice_comment_pk, int notice_comment_notice_fk, String notice_comment_user_id_fk,
		int notice_comment_id, int notice_comment_seq, int notice_comment_depth, String notice_comment_content,
		Date notice_comment_date) {
	
	this.notice_comment_pk = notice_comment_pk;
	this.notice_comment_notice_fk = notice_comment_notice_fk;
	this.notice_comment_user_id_fk = notice_comment_user_id_fk;
	this.notice_comment_id = notice_comment_id;
	this.notice_comment_seq = notice_comment_seq;
	this.notice_comment_depth = notice_comment_depth;
	this.notice_comment_content = notice_comment_content;
	this.notice_comment_date = notice_comment_date;
}
	
	public int getNotice_comment_pk() {
		return notice_comment_pk;
	}
	
	public void setNotice_comment_pk(int notice_comment_pk) {
		this.notice_comment_pk = notice_comment_pk;
	}
	public int getNotice_comment_notice_fk() {
		return notice_comment_notice_fk;
	}
	public void setNotice_comment_notice_fk(int notice_comment_notice_fk) {
		this.notice_comment_notice_fk = notice_comment_notice_fk;
	}
	public String getNotice_comment_user_id_fk() {
		return notice_comment_user_id_fk;
	}
	public void setNotice_comment_user_id_fk(String notice_comment_user_id_fk) {
		this.notice_comment_user_id_fk = notice_comment_user_id_fk;
	}
	public int getNotice_comment_id() {
		return notice_comment_id;
	}
	public void setNotice_comment_id(int notice_comment_id) {
		this.notice_comment_id = notice_comment_id;
	}
	public int getNotice_comment_seq() {
		return notice_comment_seq;
	}
	public void setNotice_comment_seq(int notice_comment_seq) {
		this.notice_comment_seq = notice_comment_seq;
	}
	public int getNotice_comment_depth() {
		return notice_comment_depth;
	}
	public void setNotice_comment_depth(int notice_comment_depth) {
		this.notice_comment_depth = notice_comment_depth;
	}
	public String getNotice_comment_content() {
		return notice_comment_content;
	}
	public void setNotice_comment_content(String notice_comment_content) {
		this.notice_comment_content = notice_comment_content;
	}
	public Date getNotice_comment_date() {
		return notice_comment_date;
	}
	public void setNotice_comment_date(Date notice_comment_date) {
		this.notice_comment_date = notice_comment_date;
	} 
	
}
