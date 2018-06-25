package member.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JDBCTemplate;
import member.model.service.myInfoService;
import member.model.vo.Member;
import member.model.vo.wishList;

/**
 * Servlet implementation class JjimDeleteServlet
 */
@WebServlet(name = "JjimDelete", urlPatterns = { "/jjimDelete" })
public class JjimDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JjimDeleteServlet() {
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
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String id = ((Member)session.getAttribute("login")).getUser_id();
		int deleteNo = Integer.parseInt(request.getParameter("deleteNo"));
		int result = new myInfoService().deletejjim(id,deleteNo);
		System.out.println(result);
		if(result>0)
		{
			response.sendRedirect("/views/member/jjim.jsp");
		}
		else
		{
			response.sendRedirect("/views/error/member/Error.html");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
