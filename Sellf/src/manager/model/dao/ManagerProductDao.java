package manager.model.dao;
import java.sql.*;
import java.util.ArrayList;

import common.JDBCTemplate;
import manager.model.vo.ManagerSellSearch;
import product.model.vo.Product;

public class ManagerProductDao {

	private static String whereQueryStatic;

	public void getSellSearch(Connection conn, ManagerSellSearch mss) {
	      
	       PreparedStatement pstmt = null;
	       ResultSet rset = null;
	       
	      System.out.println((mss.getSearchType().equals("null")) + " 겁색어 입력할 타입" + mss.getSearchType());  // 겁색어 입력할 타입
	      System.out.println("입력받은 검색어 " + mss.getGetSearch()); //입력받은 검색어
	      System.out.println("상위카테고리 " + mss.getMainCtg()); //상위카테고리
	      System.out.println("하위카테고리  " + mss.getSubCtg()); //하위카테고리
	      System.out.println("상품 상태 " + mss.getGradeStatus()); //상품 상태
	       String query = "select * from product_entire_tb ";
	       String whereQuery="";
	       int whereQueryUpdate=0; //and추가를 위한 확인 변수
	       
	       //여기입니다
	      // 상품명일때 //1이면 상품명으로 검색
	       if(!mss.getSearchType().equals("null")) {
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
	       if(!mss.getMainCtg().equals("null")) {
	          System.out.println("query2");
	          if(whereQueryUpdate>0) whereQuery += " and " ;//and 추가
	          if(whereQueryUpdate==0) whereQuery += " where ";// 첫 검색 명령어면 where
	          whereQuery+="  product_entire_cate_main_id_fk='"+mss.getMainCtg()+"' ";
	          whereQueryUpdate+=1;
	       }
	       // 소붐류 값이 넘어온다면
	       if(mss.getSubCtg()!=null)
	       {
	          System.out.println("query3");
	          if(whereQueryUpdate>0) whereQuery += " and " ;//and 추가
	          if(whereQueryUpdate==0) whereQuery += " where ";// 첫 검색 명령어면 where
	          whereQuery+= " and product_entire_cate_sub_id_fk='"+mss.getSubCtg()+"'";
	          whereQueryUpdate+=1;
	       }

	       //상품상태가 null이 아니면
	       if(!mss.getGradeStatus().equals("null"))
	       {      
	          System.out.println("query4 " + whereQueryUpdate + " 업데이트 숫자");
	          if(whereQueryUpdate>0) whereQuery += " and " ;//and 추가
	          if(whereQueryUpdate==0) whereQuery += " where ";// 첫 검색 명령어면 where
	          whereQuery+=" product_oldnew='"+mss.getGradeStatus()+"'";
	          
	       }
	       
	       query += whereQuery;
	       
	       System.out.println(query);

	   }
	public ArrayList<Product> getCurrentPage(Connection conn, int currentPage, int recordCountPerPage,
			ManagerSellSearch mss) {
		// 현재 페이지 정보를 가져옴  currentPage:요청한 페이지 recordCountPerPage:1페이지 당 출력할 게시물 수
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				 String whereQuery="";
			       int whereQueryUpdate=0; //and추가를 위한 확인 변수
			       
			       //여기입니다
			      // 상품명일때 //1이면 상품명으로 검색
			       if(!mss.getSearchType().equals("null")) {
			         System.out.println("query1");
			         if(whereQueryUpdate==0) whereQuery += " where ";// 첫 검색 명령어면 where
			         if(mss.getSearchType().equals("1"))
			         {
			             whereQuery+=" product_name like '%"+mss.getGetSearch()+"%'";
			             whereQueryUpdate+=1;
			         }else if(mss.getSearchType().equals("2")){ //2면 카테고리 검색
			             whereQuery+=" product_entire_cate_main_id_fk='"+mss.getGetSearch()+"'";   
			             whereQueryUpdate+=1;
			         }else if(mss.getSearchType().equals("3")) {//3이면 판매자 검색
			             whereQuery+=" product_entire_user_id_fk like '%"+mss.getGetSearch()+"%'";
			             whereQueryUpdate+=1;
			         }
			      }
		   
			       //대분류 값이 넘어왔다면
			       if(!mss.getMainCtg().equals("null")) {
			          System.out.println("query2");
			          if(whereQueryUpdate>0) whereQuery += " and " ;//and 추가
			          if(whereQueryUpdate==0) whereQuery += " where ";// 첫 검색 명령어면 where
			          whereQuery+="  product_entire_cate_main_id_fk='"+mss.getMainCtg()+"' ";
			          whereQueryUpdate+=1;
			       }
			       // 소붐류 값이 넘어온다면
			       if(mss.getSubCtg()!=null)
			       {
			          System.out.println("query3");
			          if(whereQueryUpdate>0) whereQuery += " and " ;//and 추가
			          if(whereQueryUpdate==0) whereQuery += " where ";// 첫 검색 명령어면 where
			          whereQuery+= " and product_entire_cate_sub_id_fk='"+mss.getSubCtg()+"'";
			          whereQueryUpdate+=1;
			       }

			       //상품상태가 null이 아니면
			       if(!mss.getGradeStatus().equals("null"))
			       {      
			          System.out.println("query4");
			          if(whereQueryUpdate>0) whereQuery += " and " ;//and 추가
			          if(whereQueryUpdate==0) whereQuery += " where ";// 첫 검색 명령어면 where
			          whereQuery+=" product_oldnew='"+mss.getGradeStatus()+"'";
			          
			       }
			       whereQueryStatic = whereQuery;
				

				//시작 페이지 계산
				int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
				//1페이지 요청 : 1*10-(10-1)=10-9=1;
				//3페이지 요청: 3*10-(10-1)=30-9=21;
				//끝페이지 계산
				int end = currentPage*recordCountPerPage;
				//1페이지 요청: 1*10=10
				//3페이지 요청: 3*10=30
				String query = "select *from" + 
						"(select product_entire_tb.*,row_number() over(order by PRODUCT_ENTIRE_PK desc) as num from product_entire_tb "+whereQuery+" )"
						+ " where num between ? and ?";
				ArrayList<Product> list = new ArrayList<Product> ();
				
				System.out.println("ManagerProductDao 상품 리스트 쿼리" +query);
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, start);
					pstmt.setInt(2, end);
					rset = pstmt.executeQuery();

					while(rset.next()) {
						Product p = new Product();
						p.setProduct_entire_pk(rset.getInt("PRODUCT_ENTIRE_PK"));
						p.setProduct_entire_user_entire_id_fk(rset.getString("PRODUCT_ENTIRE_USER_ID_FK"));
						p.setProduct_entire_category_main_id_fk(rset.getString("PRODUCT_ENTIRE_CATE_MAIN_ID_FK"));
						p.setProduct_entire_category_sub_id_fk(rset.getString("PRODUCT_ENTIRE_CATE_SUB_ID_FK"));
						p.setProduct_name(rset.getString("PRODUCT_NAME"));
						p.setProduct_price(rset.getInt("PRODUCT_PRICE"));
						p.setProduct_image(rset.getString("PRUDUCT_IMAGE")==null?"":rset.getString("PRUDUCT_IMAGE"));
						p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));
						p.setProduct_state(rset.getString("PRODUCT_STATE"));	
						p.setProduct_detail(rset.getString("PRODUCT_DETAIL"));
						list.add(p);
					}
					System.out.println("검색 결과 "  + list.size());
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally
				{
					JDBCTemplate.close(rset);
					JDBCTemplate.close(pstmt);
				}
				return list;
	}

	public static String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage,
			ManagerSellSearch mss) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int recordTotalCount = 0;
		//게시물의 토탈 개수 구하기
		String query = "select count(*)as totalCount from product_entire_tb " + whereQueryStatic;

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			rset.next();
			recordTotalCount = rset.getInt("totalCount");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		int pageTotalCount = 0;

		if(recordTotalCount%recordCountPerPage!=0)
		{
			pageTotalCount = recordTotalCount / recordCountPerPage+1;
		}else
		{
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(currentPage<1)
		{
			currentPage = 1;
		}else if(currentPage>pageTotalCount)
		{
			currentPage = pageTotalCount;					
		}

		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount)
		{
			endNavi = pageTotalCount;
		}
		//페이지navi에서 사용할 '<'모양과'>'모양을 사용하기 위해 필요한 변수 2개 생성
		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi==1)
		{
			needPrev = false;
		}

		if(endNavi==pageTotalCount)
		{
			needNext = false;
		}
		//여기까지 기본적은 구조는 끝.

		StringBuilder sb = new StringBuilder();
		String navi = 
				"<nav aria-label='Page navigation example'>";				
		navi+= "<ul class='pagination'>";

		
		if(needPrev) {// 시작이 1페이지가 아니라면!					
			navi +=	"<li class='page-item'>"+
				"<a class='page-link' aria-label='Previous' onclick='pageChange("+(startNavi-1)+ ");'> <span aria-hidden='true' >«</span>"+
				"<span class='sr-only'>Previous</span>"+
				"</a> </li>";
			
//			"<span onclick='pageChange("+(startNavi-1)+ ");'> < </span>";
		}
		
		for(int i = startNavi;i<=endNavi;i++)
		{
			if(i==currentPage) {
				navi += "<li>"+
				"<a class='page-link' onclick='pageChange("+ i +");'> <span aria-hidden='true'><B>"+i+"</B></span>"+
				"<span class='sr-only'>"+ i +"</span>"+
				"</a></li>";
//				navi += "<span onclick='pageChange("+ i + ");'></span>";
			}
			else {
				navi += "<li>"+
					"<a class='page-link'  onclick='pageChange("+ i +");'> <span aria-hidden='true'>"+i+"</span>"+
					"<span class='sr-only'>"+i+"</span>"+
					"</a></li>";
//				navi += "<span onclick='pageChange("+ i + ");'>"+ i +"</span>";
//				sb.append("<a href='/notice?currentPage="+i+"'> "+i+" </a>");
			}
		}
		
		if(needNext) {// 끝페이지가 아니라면
			navi += "<li class='page-item'>"+
				"<a class='page-link' aria-label='Next' onclick='pageChange("+(endNavi+1)+ ");'>"+
				"<span aria-hidden='true' >»</span>"+ 
				"<span class='sr-only'>Next</span>"+
				"</a>"+
			"</li>";
//			navi+= "<span onclick='pageChange("+(endNavi+1)+ ");'> > </span>";
//			sb.append("<a href='/notice?currentPage="+(endNavi+1)+ "'> > </a>");
		
		}
//		System.out.println("검색어 " + search);
		return navi;
	}
	
}
