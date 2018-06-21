package manager.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.service.ManagerBoardService;
import manager.model.vo.ManagerBoardPageData;

/**
 * Servlet implementation class ManagerFreeBoardServlet
 */
@WebServlet(name = "ManagerNoticeBoard", urlPatterns = { "/managerNoticeBoard" }) //�������� �Խ��� ����¡ó���ϴ� ����
public class ManagerNoticeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerNoticeBoardServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage ;//���� ���������� �����ϴ� ����
		if(request.getParameter("currentPage")==null) 
		{
			currentPage=1;
		} //ù��° �������� 1�� ����
		else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}//1�������� �ƴϸ� �� ������ ���� ������.

		ManagerBoardPageData mbpd = new ManagerBoardService().noticeBoardSelect(currentPage);

		if(mbpd!=null) //mbpd�� ������� �ʴٸ�
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
