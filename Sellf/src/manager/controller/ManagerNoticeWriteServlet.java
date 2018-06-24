package manager.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JDBCTemplate;
import manager.model.service.ManagerBoardService;

/**
 * Servlet implementation class ManagerNoticeWriteServlet
 */
@WebServlet(name = "ManagerNoticeWrite", urlPatterns = { "/managerNoticeWrite" })
public class ManagerNoticeWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerNoticeWriteServlet() {
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
		
		request.setCharacterEncoding("UTF-8");
		String writeTitle = request.getParameter("title");
		String writeContent = request.getParameter("writeContent");
		int result = new ManagerBoardService().writeNotice(writeTitle,writeContent);
		if(result>0) //정상적으로 작성이 되었다면
		{
			response.sendRedirect("/managerNoticeBoard1");
		}
		else {
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
