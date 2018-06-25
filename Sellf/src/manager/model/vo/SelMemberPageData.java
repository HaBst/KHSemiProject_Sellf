package manager.model.vo;

import java.util.ArrayList;

public class SelMemberPageData {
	public SelMemberPageData() {}
	private ArrayList<ManagerSelMember> list = new ArrayList<ManagerSelMember>();
	private String pageNavi;
	public SelMemberPageData(ArrayList<ManagerSelMember> list, String pageNavi) {
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
