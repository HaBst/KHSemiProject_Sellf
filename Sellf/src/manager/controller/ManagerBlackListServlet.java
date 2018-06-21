package manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.service.ManagerService;
import manager.model.vo.ManagerMemberData;
import manager.model.vo.ManagerSelMember;
import com.google.gson.Gson;

import common.JDBCTemplate;

/**
 * Servlet implementation class ManagerBlackListServlet
 */
@WebServlet(name = "ManagerBlackList", urlPatterns = { "/managerBlackList" })
public class ManagerBlackListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerBlackListServlet() {
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
		
		int currentPage ;//���� ���������� �����ϴ� ����
		if(request.getParameter("currentPage")==null) 
		{
			currentPage=1;
		} //ù��° �������� 1�� ����
		else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}//1�������� �ƴϸ� �� ������ ���� ������.
		ManagerMemberData mmd =  new ManagerService().readBlackList(currentPage); // ������Ʈ ����� ���� ȸ���� ������ �������� ���� service�� ��û. 
		
		if(mmd!=null)//mmd�� ������� �ʴٸ�
		{
			RequestDispatcher view = request.getRequestDispatcher("/views/manager/managerBlackList.jsp");
			request.setAttribute("listData", mmd);
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
