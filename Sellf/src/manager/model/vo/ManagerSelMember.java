package manager.model.vo;

import java.sql.Date;

public class ManagerSelMember { //DB에서 회원정보를 가져올 때 저장할 객체
	public ManagerSelMember() {}
	
	private String userEntireId; //db에서 회원 아이디를 읽어 저장
	private String userEntireName; //db에서 회원 이름을 읽어 저장
	private String userGrade; //db에서 회원 등급을 읽어 저장
	private String userPhone; //db에서 회원의 폰 번을 읽어 저장
	private char userGender; //db에서 회원의 성별을 읽어 저장
	private Date userEnrollDate; //회원가입한 날을 읽어 저장
	private int userPoint; //회원이 보유한 point읽어와 저장함.
	private int totalCount;//검색갯수
	public ManagerSelMember(String userEntireId, String userEntireName, String userGrade, String userPhone,
			char userGender, Date userEnrollDate, int userPoint,int totalCount ) {
		super();
		this.userEntireId = userEntireId;
		this.userEntireName = userEntireName;
		this.userGrade = userGrade;
		this.userPhone = userPhone;
		this.userGender = userGender;
		this.userEnrollDate = userEnrollDate;
		this.userPoint = userPoint;
		this.totalCount = totalCount;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
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
	
	public int getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}
	
	
}
