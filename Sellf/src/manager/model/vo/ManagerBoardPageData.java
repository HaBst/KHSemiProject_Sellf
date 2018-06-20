package manager.model.vo;

import java.util.*;

public class ManagerBoardPageData {
	public ManagerBoardPageData() {}
	
	private ArrayList<ManagerBoard> BoardList;
	private String pageNavi;
	
	public ManagerBoardPageData(ArrayList<ManagerBoard> boardList, String pageNavi) {
		super();
		BoardList = boardList;
		this.pageNavi = pageNavi;
	}

	public ArrayList<ManagerBoard> getBoardList() {
		return BoardList;
	}

	public void setBoardList(ArrayList<ManagerBoard> boardList) {
		BoardList = boardList;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
