package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import member.model.service.myInfoService;
import member.model.vo.Member;

/**
 * Servlet implementation class PasswordServlet
 */
@WebServlet(name = "Password", urlPatterns = { "/Password" })
public class PasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userPwd = request.getParameter("userPwd");//입력값 받아온 비번
		HttpSession session = request.getSession();
		String pwd = ((Member)session.getAttribute("login")).getUser_pwd(); //기존 접속중 비번
		if(userPwd.equals(pwd)) //세션비번이랑 일치하면
		{
			response.sendRedirect("/views/member/myInfo.jsp");
		}
		else //틀림
		{
			response.sendRedirect("/views/error/member/PasswordError.html");
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
