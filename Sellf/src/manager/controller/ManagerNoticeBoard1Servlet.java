package manager.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JDBCTemplate;
import manager.model.service.ManagerBoardService;
import manager.model.vo.ManagerBoardPageData;
/**
 * Servlet implementation class ManagerNoticeBoard1Servlet
 */
@WebServlet(name = "ManagerNoticeBoard1", urlPatterns = { "/managerNoticeBoard1" })
public class ManagerNoticeBoard1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerNoticeBoard1Servlet() {
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

		int currentPage ;//현재 페이지 값을 저장하는 변수
		if(request.getParameter("currentPage")==null) 
		{
			currentPage=1; //현재페이지값이 없으면 1페이지로 지정
		}else {
				currentPage = Integer.parseInt(request.getParameter("currentPage")); //페이지 값이 존재한다면  그페이지 겂으로 설정.
		}
		ManagerBoardPageData mbpd = new ManagerBoardService().noticeBoardSelect(currentPage);
		response.setCharacterEncoding("UTF-8");
		
		if(mbpd!=null) //mbpd객체가 null 아니라면 (페이지 정보를 담고있음.)
		{
			RequestDispatcher view = request.getRequestDispatcher("/views/manager/managerBoard.jsp");
			request.setAttribute("pageData", mbpd);
			view.forward(request, response);
		}
		else
		{
			response.sendRedirect("/views/error/manager/managerPermissionError.html");
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
