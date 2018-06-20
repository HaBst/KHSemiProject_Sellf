package manager.model.vo;

import java.sql.Date;

public class ManagerSelMember { //���������������� DB�� ����� ȸ�������� �о� ������ ��ü�� ����.
	public ManagerSelMember() {}
	
	private String userEntireId; //ȸ�� id
	private String userEntireName; //ȸ�� �̸�
	private String userGrade; //ȸ�� ���
	private String userPhone; //ȸ�� ��ȭ��ȣ
	private char userGender; //ȸ�� ����
	private Date userEnrollDate; //��������
	
	public ManagerSelMember(String userEntireId, String userEntireName, String userGrade, String userPhone,
			char userGender, Date userEnrollDate) {
		super();
		this.userEntireId = userEntireId;
		this.userEntireName = userEntireName;
		this.userGrade = userGrade;
		this.userPhone = userPhone;
		this.userGender = userGender;
		this.userEnrollDate = userEnrollDate;
	}

	public String getUserEntireId() {
		return userEntireId;
	}

	public void setUserEntireId(String userEntireId) {
		this.userEntireId = userEntireId;
	}

	public String getUserEntireName() {
		return userEntireName;
	}

	public void setUserEntireName(String userEntireName) {
		this.userEntireName = userEntireName;
	}

	public String getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public char getUserGender() {
		return userGender;
	}

	public void setUserGender(char userGender) {
		this.userGender = userGender;
	}

	public Date getUserEnrollDate() {
		return userEnrollDate;
	}

	public void setUserEnrollDate(Date userEnrollDate) {
		this.userEnrollDate = userEnrollDate;
	}
	
	
}
