package member.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberJoinServlet
 */
@WebServlet("/memberJoin")
public class MemberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		Member m = new Member();
		m.setUser_id(request.getParameter("memberId"));
		m.setUser_name(request.getParameter("memberName"));
		m.setUser_pwd(request.getParameter("memberPwd"));
		m.setUser_birth(request.getParameter("memberBirth"));
		m.setUser_gender(request.getParameter("memberGender"));
		m.setUser_email(request.getParameter("memberEmail"));
		m.setUser_phone(request.getParameter("memberPhone"));
		m.setUser_addr(request.getParameter("memberAddr"));
		m.setUser_interest(request.getParameter("memberInter"));
		
		ServletContext context = getServletContext();
		String fullPath = context.getRealPath("/WEB-INF/property/memberQuery.properties");
	      System.out.println(fullPath);
		int result = 0;
		result = new MemberService().memberJoin(m, fullPath);
		if(result==1)
		{
			response.sendRedirect("/views/member/memberRegiComplete.html");
		}
		else if(result==0)
		{
			response.sendRedirect("/views/member/memberRegister.html");
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
