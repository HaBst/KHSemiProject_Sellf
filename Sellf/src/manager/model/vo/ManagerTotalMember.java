package manager.model.vo;

import java.sql.Date;

public class ManagerTotalMember {
	//회원 통계정보를 담을 객체
	public ManagerTotalMember() {}
	
	private int userVisitLoginCnt;//로그인 횟수 저장하는 변수
	private int userVisitEnrollCnt;//회원 가입 횟수 저장하는 변수
	private int userVisitSignoutCnt; //탈퇴 횟수
	private Date userVisitInfoDate;// 연/월/일 저장
	
	public ManagerTotalMember(int userVisitLoginCnt, int userVisitEnrollCnt, int userVisitSignoutCnt,
			Date userVisitInfoDate) {
		super();
		this.userVisitLoginCnt = userVisitLoginCnt;
		this.userVisitEnrollCnt = userVisitEnrollCnt;
		this.userVisitSignoutCnt = userVisitSignoutCnt;
		this.userVisitInfoDate = userVisitInfoDate;
	}

	public int getUserVisitLoginCnt() {
		return userVisitLoginCnt;
	}

	public void setUserVisitLoginCnt(int userVisitLoginCnt) {
		this.userVisitLoginCnt = userVisitLoginCnt;
	}

	public int getUserVisitEnrollCnt() {
		return userVisitEnrollCnt;
	}

	public void setUserVisitEnrollCnt(int userVisitEnrollCnt) {
		this.userVisitEnrollCnt = userVisitEnrollCnt;
	}

	public int getUserVisitSignoutCnt() {
		return userVisitSignoutCnt;
	}

	public void setUserVisitSignoutCnt(int userVisitSignoutCnt) {
		this.userVisitSignoutCnt = userVisitSignoutCnt;
	}

	public Date getUserVisitInfoDate() {
		return userVisitInfoDate;
	}

	public void setUserVisitInfoDate(Date userVisitInfoDate) {
		this.userVisitInfoDate = userVisitInfoDate;
	}
	
	

}
