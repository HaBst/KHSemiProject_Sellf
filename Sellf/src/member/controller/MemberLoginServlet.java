package member.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet(name = "MemberLogin", urlPatterns = { "/memberLogin" })
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPwd");
		boolean checkDelete = false;
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login")!=null)
		{
			session.invalidate();
		}
		
		ServletContext context = getServletContext();
		String fullPath = context.getRealPath("/WEB-INF/property/memberQuery.properties");
	    System.out.println(fullPath);
		Member m= null;
		checkDelete = new MemberService().memberCheckDelete(id,fullPath);
		if(checkDelete==false)
		{
			response.sendRedirect("/views/member/memberLogin.jsp?error="+"2");
		}
		else
		{
		m = new MemberService().memberLogin(id,pw, fullPath);
		if(m!=null)
		{
			session = request.getSession();
			System.out.println(session.getAttribute("login"));
			session.setAttribute("login", m);
			System.out.println(session.getAttribute("login"));
			response.sendRedirect("/index.jsp");
		}
		else
		{
			response.sendRedirect("/views/member/memberLogin.jsp?error="+"1");
		}
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
