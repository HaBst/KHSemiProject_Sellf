package manager.model.dao;
import java.sql.*;
import java.util.ArrayList;

import common.JDBCTemplate;
import manager.model.vo.ManagerSellSearch;

public class ManagerProductDao {

	public void getSellSearch(Connection conn, ManagerSellSearch mss) {
		
		 PreparedStatement pstmt = null;
		 ResultSet rset = null;
		 
		System.out.println(mss.getSearchType());  // 겁색어 입력할 타입
		System.out.println(mss.getGetSearch()); //입력받은 검색어
		System.out.println(mss.getMainCtg()); //상위카테고리
		System.out.println(mss.getSubCtg()); //하위카테고리
		System.out.println(mss.getGradeStatus()); //상품 상태
		 String query = "select * from product_entire_tb ";
		 String whereQuery="";
		 int whereQueryUpdate=0; //and추가를 위한 확인 변수
		 
		 //여기입니다
		  if(!mss.getSearchType().equals("")) {
		         System.out.println("query1");
		         if(whereQueryUpdate==0) whereQuery += " where ";// 첫 검색 명령어면 where
		         if(mss.getSearchType().equals("1"))
		         {
		             whereQuery+=" product_name='"+mss.getGetSearch()+"'";
		             whereQueryUpdate+=1;
		         }else if(mss.getSearchType().equals("2")){ //2면 카테고리 검색
		             whereQuery+=" product_entire_cate_main_id_fk='"+mss.getGetSearch()+"'";   
		             whereQueryUpdate+=1;
		         }else if(mss.getSearchType().equals("3")) {//3이면 판매자 검색
		             whereQuery+=" product_entire_user_id_fk='"+mss.getGetSearch()+"'";
		             whereQueryUpdate+=1;
		         }
		      }
		            
		       //대분류 값이 넘어왔다면
		       if(!mss.getMainCtg().equals("")) {
		          System.out.println("query2");
		          if(whereQueryUpdate==1) whereQuery += " and " ;//and 추가
		          if(whereQueryUpdate==0) whereQuery += " where ";// 첫 검색 명령어면 where
		          whereQuery+="  product_entire_cate_main_id_fk='"+mss.getMainCtg()+"' ";
		          whereQueryUpdate+=1;
		       }
		       // 소붐류 값이 넘어온다면
		       if(mss.getSubCtg()!=null)
		       {
		          System.out.println("query3");
		          if(whereQueryUpdate==2) whereQuery += " and " ;//and 추가
		          if(whereQueryUpdate==0) whereQuery += " where ";// 첫 검색 명령어면 where
		          whereQuery+= "' and product_entire_cate_sub_id_fk='"+mss.getSubCtg()+"'";
		          whereQueryUpdate+=1;
		       }

		       //상품상태가 null이 아니면
		       if(!mss.getGradeStatus().equals(""))
		       {      
		          System.out.println("query4");
		          if(whereQueryUpdate==3) whereQuery += " and " ;//and 추가
		          if(whereQueryUpdate==0) whereQuery += " where ";// 첫 검색 명령어면 where
		          whereQuery+=" product_grade='"+mss.getGradeStatus()+"'";
		          
		       }
		       
		       query += whereQuery;
		       
		       System.out.println(query);

		   }

}
