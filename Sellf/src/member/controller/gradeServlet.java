package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JDBCTemplate;
import member.model.service.MemberService;
import member.model.vo.Grade;
import member.model.vo.Member;
import member.model.vo.wishList;

/**
 * Servlet implementation class gradeServlet
 */
@WebServlet(name = "grade", urlPatterns = { "/Grade" })
public class gradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gradeServlet() {
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
		String id = ((Member)session.getAttribute("user")).getUser_user_entire_user_grade_id_fk();
		Grade g  = new MemberService().gradeInfo(id);
		
		if(g!=null)
		{
			RequestDispatcher view = request.getRequestDispatcher("/views/member/myGrade.jsp");
			request.setAttribute("userGrade", g);
			view.forward(request, response);
		}
		else
		{
			response.sendRedirect("/views/error/member/Error.html");
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
