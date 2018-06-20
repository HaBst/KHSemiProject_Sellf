package board.model.vo;

import java.util.ArrayList;

public class NoticePageData {
	private ArrayList<Notice> noticeList;
	private String NoticePageNavi;
	public NoticePageData() {}

	public NoticePageData(ArrayList<Notice> noticeList, String NoticePageNavi) 
	{
		this.noticeList = noticeList;
		this.NoticePageNavi = NoticePageNavi;
	}

	public ArrayList<Notice> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(ArrayList<Notice> noticeList) {
		this.noticeList = noticeList;
	}

	public String getNoticePageNavi() {
		return NoticePageNavi;
	}

	public void setNoticePageNavi(String NoticePageNavi) {
		this.NoticePageNavi = NoticePageNavi;
	}
	
}
