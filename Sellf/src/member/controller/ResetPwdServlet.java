package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.FindIdPwdService;
import member.model.vo.*;
/**
 * Servlet implementation class ResetPwdServlet
 */
@WebServlet(name = "ResetPwd", urlPatterns = { "/resetPwd" })
public class ResetPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
	
		String pwd1 = request.getParameter("pwd1");
		String memberId = request.getParameter("memberId");

		int result = new FindIdPwdService().changePwd(memberId, pwd1);

		if(result>0)
		{
			response.sendRedirect("/index.jsp");
		}
		else
		{
			response.sendRedirect("/views/member/resetPwd.jsp");
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
