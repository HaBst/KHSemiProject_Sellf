package manager.model.vo;

import java.util.*;

public class ManagerMemberData {
	public ManagerMemberData() {}
	private ArrayList<ManagerSelMember>list ;
	private String pageNavi;
	
	public ManagerMemberData(ArrayList<ManagerSelMember> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

	public ArrayList<ManagerSelMember> getList() {
		return list;
	}

	public void setList(ArrayList<ManagerSelMember> list) {
		this.list = list;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
