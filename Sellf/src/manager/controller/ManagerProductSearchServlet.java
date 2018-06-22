package manager.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JDBCTemplate;
import manager.model.service.ManagerProductService;
import manager.model.vo.ManagerSellSearch;

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
		new ManagerProductService().getSellSearch(mss);
//		System.out.println(mss.getSearchType());
//		System.out.println(mss.getGetSearch());
//		System.out.println(mss.getMainCtg());
//		System.out.println(mss.getSubCtg());
//		System.out.println(mss.getGradeStatus());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
