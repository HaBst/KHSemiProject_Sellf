package manager.model.dao;
import java.sql.*;
import java.util.ArrayList;

import common.JDBCTemplate;
import manager.model.vo.ManagerSellSearch;

public class ManagerProductDao {

	public void getSellSearch(Connection conn, ManagerSellSearch mss) {
		// service로부터 conn객체와 front단으로부터 조건이 들어있는 mss객체를 가져와 dynamic query를 작성하여 paging한 뒤 다시 검색 조건을 입력 받은 페이지로 결과를 리턴할 예정...
		 PreparedStatement pstmt = null;
		 ResultSet rset = null;
		 
		System.out.println(mss.getSearchType());  // 겁색어 입력할 타입
		System.out.println(mss.getGetSearch()); //입력받은 검색어
		System.out.println(mss.getMainCtg()); //상위카테고리
		System.out.println(mss.getSubCtg()); //하위카테고리
		System.out.println(mss.getGradeStatus()); //상품 상태
		 String query = "select * from product_entire_tb where";
		 String whereQuery="";
		 int whereQueryUpdate=0; //and추가를 위한 확인 변수
		 
		 if(mss.getGetSearch()!=null && mss.getGradeStatus()!=null && mss.getMainCtg()!=null &&
			 mss.getSearchType()!=null && mss.getSubCtg()!=null)
		{
			 //검색 타입 설정
			 if(mss.getGetSearch().equals("1")) { //1이면 상품명으로 검색
				 whereQuery+="product_name='"+mss.getGetSearch()+"'";
				 whereQueryUpdate=1;
			 }else if(mss.getGetSearch().equals("2")){ //2면 카테고리 검색
				 whereQuery+="product_entire_cate_main_id_fk='"+mss.getGetSearch()+"'";	
				 whereQueryUpdate=1;
			 }else if(mss.getGetSearch().equals("3")) {//3이면 판매자 검색
				 whereQuery+="product_entire_user_id_fk='"+mss.getGetSearch()+"'";
				 whereQueryUpdate=1;
			 }
			 else {
				 whereQuery+="";
			 }
			 if(whereQueryUpdate==1) //and 추가
			 {
				 whereQuery+=" and ";
				 whereQueryUpdate=0;
			 }
			 //대분류 값이 넘어왔다면
			 if(!mss.getMainCtg().equals("") && !mss.getSubCtg().equals("")) {
				 whereQuery+="  product_entire_cate_main_id_fk='"+mss.getMainCtg()+"' and product_entire_cate_sub_id_fk='"+mss.getSubCtg()+"'";
				 whereQueryUpdate=1;
			 }else {
				 whereQuery+="";
			 }
			 if(whereQueryUpdate==1) //and 추가
			 {
				 whereQuery+=" and ";
				 whereQueryUpdate=0;
			 }
			 //상품상태가 null이 아니면
			 if(!mss.getGradeStatus().equals(null))
			 {
				 
				 whereQuery+=" product_grade='"+mss.getGradeStatus()+"'";
				 
			 }else {
				 whereQuery+="";
			 }
		 }
		 
		 query += whereQuery;
		 
		 System.out.println(query);

	}

	
}
