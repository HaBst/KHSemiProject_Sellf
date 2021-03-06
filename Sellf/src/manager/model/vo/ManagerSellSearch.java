package manager.model.vo;

public class ManagerSellSearch {
	public ManagerSellSearch() {};
	private String searchType; //검색하려는 (상품명,판매자, 카테고리 ...)선택한것을 담는 변수
	private String getSearch; //검색 내용담는 변수
	private String mainCtg;   //메인 카테고리 선택한 것을 담는 변수
	private String subCtg;    //메인 밑에 서브 카테고리를 담는 변수
	private String gradeStatus; //상품상태를 (a,b,c,d,e)담는 변수.
	

	public ManagerSellSearch(String searchType, String getSearch, String mainCtg, String subCtg, String gradeStatus) {
		super();
		this.searchType = searchType;
		this.getSearch = getSearch;
		this.mainCtg = mainCtg;
		this.subCtg = subCtg;
		this.gradeStatus = gradeStatus;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getGetSearch() {
		return getSearch;
	}

	public void setGetSearch(String getSearch) {
		this.getSearch = getSearch;
	}

	public String getMainCtg() {
		return mainCtg;
	}

	public void setMainCtg(String mainCtg) {
		this.mainCtg = mainCtg;
	}

	public String getSubCtg() {
		return subCtg;
	}

	public void setSubCtg(String subCtg) {
		this.subCtg = subCtg;
	}
	
	public String getGradeStatus() {
		return gradeStatus;
	}

	public void setGradeStatus(String gradeStatus) {
		this.gradeStatus = gradeStatus;
	}
}
