package board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.FaqDao;
import board.model.vo.Faq;
import board.model.vo.FaqPageData;
import common.JDBCTemplate;

public class FaqService {

public FaqService() {} 

	public FaqPageData faqAll(int currentPage) //공지사항 게시물 전체보기 페이징처리 메소드 
	{
		Connection conn = JDBCTemplate.getConnection();
		
		int recordCountPerPage = 5; //한페이지당 보이는 게시물의 수 
		int naviCountPerPage = 5; //현재 위치 중심으로 시작 navi부터 끝 navi까지의 개수 
		
		ArrayList<Faq> f_list = new FaqDao().getCurrentPage(conn,currentPage,recordCountPerPage);
		System.out.println("f_list값:"+f_list.get(0).getFaq_subject());
								//DB 가서 현재 페이지, 몇개의 게시물 보여줄것인지 
		String FaqPageNavi = new FaqDao().getFaqPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage);
		FaqPageData fpd= null; 
		if(!f_list.isEmpty() && !FaqPageNavi.isEmpty())
		{
			fpd = new FaqPageData();
			fpd.setFaqList(f_list);
			fpd.setFaqPageNavi(FaqPageNavi);
		}
		JDBCTemplate.close(conn);
		return fpd;
	}
	public Faq faqSelect(int faq_pk) {
		Connection conn = JDBCTemplate.getConnection();
		Faq faq = new FaqDao().faqSelect(conn, faq_pk);
		JDBCTemplate.close(conn);
		return faq;		
	}
	
}
