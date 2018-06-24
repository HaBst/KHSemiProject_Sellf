package manager.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JDBCTemplate;
import manager.model.service.ManagerService;
import member.model.vo.Member;

/**
 * Servlet implementation class ManagerLoginServlet
 */
@WebServlet(name = "ManagerLogin", urlPatterns = { "/managerLogin" })
public class ManagerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerLoginServlet() {
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
		
		String managerId = request.getParameter("userId");
		String managerPwd = request.getParameter("userPwd");
		Member m = new ManagerService().managerLogin(managerId,managerPwd);
		
		if(m.getUser_id()!=null && m.getUser_pwd()!=null && m.getUser_id().equals(managerId) && m.getUser_pwd().equals(managerPwd)) //관리자가 맞다면!
		{
			HttpSession session = request.getSession();
			session.setAttribute("manager", m);
			response.sendRedirect("/managerFirstLoad");
		}else
		{
			response.sendRedirect("/views/error/manager/managerLoginError.html");
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
