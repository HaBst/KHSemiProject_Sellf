package member.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class updateServlet
 */
@WebServlet(name = "Update", urlPatterns = { "/update" })
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Member m = new Member();
		m.setUser_id(request.getParameter("userId"));
		m.setUser_email(request.getParameter("email"));
		m.setUser_phone(request.getParameter("phone"));
		m.setUser_addr((Integer.parseInt(request.getParameter("postNum"))+(request.getParameter("addrInfo"))+(request.getParameter("addrDetail"))));
		String [] inter = request.getParameterValues("userInter");
		String interStr = "";
		for(String val :inter)
		{
			interStr += val + " ";
		}
		m.setUser_interest(interStr);
		
	int result = 0;//new MemberService().updateMember(m);
	if(result>0)
	{
		response.sendRedirect("/views/member/myInfo.jsp");
	}
	else 
	{
		response.sendRedirect("/views/member/Error.html");
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
