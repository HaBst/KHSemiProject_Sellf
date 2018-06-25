package manager.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import common.JDBCTemplate;
import manager.model.service.ManagerProductService;
import manager.model.vo.ManagerSellSearch;
import manager.model.vo.ProductPageData;

/**
 * Servlet implementation class ManagerProductSearchServlet
 */
@WebServlet(name = "ManagerProductSearch", urlPatterns = { "/managerProductSearch" })
public class ManagerProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerProductSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context = getServletContext();
		String fullPath = context.getRealPath("/WEB-INF/property/driver.properties");
		JDBCTemplate.setDriverPath(fullPath);
		
		ManagerSellSearch mss= new ManagerSellSearch(); //상품 검색내용을 담을 객체 선언.
//		String searchType = request.getParameter("searchType");
//		String getSearch = request.getParameter("getSearch");
//		String MainCtg = request.getParameter("MainCtg");
//		String subCtg = request.getParameter("subCtg");
//		char gradeStatus = request.getParameter("gradeStatus").charAt(0);
//		System.out.println(searchType + getSearch + MainCtg + subCtg);
		mss.setSearchType(request.getParameter("searchType"));
		mss.setGetSearch(request.getParameter("getSearch"));
		mss.setMainCtg(request.getParameter("MainCtg"));
		mss.setSubCtg(request.getParameter("subCtg"));
		mss.setGradeStatus(request.getParameter("gradeStatus"));
		System.out.println(mss.getSearchType());
		System.out.println(mss.getGetSearch());
		System.out.println(mss.getMainCtg());
		System.out.println(mss.getSubCtg());
		System.out.println(mss.getGradeStatus());
		
//		new ManagerProductService().getSellSearch(mss);
		
//		System.out.println(mss.getSearchType());
//		System.out.println(mss.getGetSearch());
//		System.out.println(mss.getMainCtg());
//		System.out.println(mss.getSubCtg());
//		System.out.println(mss.getGradeStatus());
		
		int currentPage; //현재 페이지 값을 저장하는 변수
		System.out.println("");
		
		if(request.getParameter("currentPage")==null)currentPage=1; //첫번째 페이지이면 1로 설정
		else currentPage = Integer.parseInt(request.getParameter("currentPage")); //1페이지가 아니면 그 페이지 값을 가져옴.
		
		
		//비즈니스 로직.
		ProductPageData pd = new ProductPageData().pagingList(currentPage,mss);
		
		if(pd!=null) //pd가 비어있지 않다면
		{
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(pd, response.getWriter());
		}
		else
		{
			response.sendRedirect("/views/notice/Error.html");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
