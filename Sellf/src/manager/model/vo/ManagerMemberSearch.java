package manager.model.vo;

public class ManagerMemberSearch {
	public ManagerMemberSearch() {}
	private String selInfo ;// 회원 검색정보 종류를 저장
	private String memberInfo; //검색정보에따라 입력받은 값을 저장
	private String selGrade; //선택한 회원 등급을 저장하는 변수
	private char gender; //성별을 선택받아 저장하는 변수. 
	
	public ManagerMemberSearch(String selInfo, String memberInfo, String selGrade, char gender) {
		super();
		this.selInfo = selInfo;
		this.memberInfo = memberInfo;
		this.selGrade = selGrade;
		this.gender = gender;
	}

	public String getSelInfo() {
		return selInfo;
	}

	public void setSelInfo(String selInfo) {
		this.selInfo = selInfo;
	}

	public String getMemberInfo() {
		return memberInfo;
	}

	public void setMemberInfo(String memberInfo) {
		this.memberInfo = memberInfo;
	}

	public String getSelGrade() {
		return selGrade;
	}

	public void setSelGrade(String selGrade) {
		this.selGrade = selGrade;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}
	
	
	

}
