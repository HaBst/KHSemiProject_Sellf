package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.FindIdPwdService;
import member.model.vo.Member;

/**
 * Servlet implementation class FindIdPwdServlet
 */
@WebServlet(name = "FindIdPwd", urlPatterns = { "/findIdPwd" })
public class FindIdPwdServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindIdPwdServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userName = request.getParameter("memberName_id");
		String userEmail = request.getParameter("memberEmail_id");
		int idCertificationNum = Integer.parseInt(request.getParameter("IDcertificationNum"));
		String findId = new FindIdPwdService().findId(userName, userEmail, idCertificationNum);
		if (findId != null) {
/*			response.sendRedirect("/views/member/test.jsp");*/
			RequestDispatcher view = request.getRequestDispatcher("/views/member/findIdComplete.jsp");
			request.setAttribute("userId1", findId);
			view.forward(request, response);
		} else
		{
			System.out.println("아이디 찾기 실패");
			response.sendRedirect("/views/member/memberLoginError.html");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
