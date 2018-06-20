package board.model.vo;

import java.util.ArrayList;

public class FaqPageData {
	private ArrayList<Faq> faqList;
	private String FaqPageNavi;
	public FaqPageData() {}
	
	public FaqPageData(ArrayList<Faq> faqList, String faqPageNavi) {
		this.faqList = faqList;
		this.FaqPageNavi = faqPageNavi;
	}

	public ArrayList<Faq> getFaqList() {
		return faqList;
	}
	public void setFaqList(ArrayList<Faq> faqList) {
		this.faqList = faqList;
	}
	public String getFaqPageNavi() {
		return FaqPageNavi;
	}
	public void setFaqPageNavi(String faqPageNavi) {
		FaqPageNavi = faqPageNavi;
	}
	

	
}
