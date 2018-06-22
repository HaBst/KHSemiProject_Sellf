package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.model.service.MemberService;
import member.model.service.UserReviewService;
import member.model.vo.ReviewPageData;

/**
 * Servlet implementation class UserReviewInProductServlet
 */
@WebServlet(name = "UserReviewInProduct", urlPatterns = { "/userReviewInProduct" })
public class UserReviewInProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReviewInProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		String id = request.getParameter("userId");
		
		System.out.println("서블릿 " + id);
		if(request.getParameter("currentPage")==null) currentPage = 1;
		else currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		
		ReviewPageData pd = new UserReviewService().sellerReviewAll(currentPage,id);
		System.out.println(pd.getReviewList().size());
		
		if(pd!=null)
		{
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(pd, response.getWriter());
//			RequestDispatcher view = request.getRequestDispatcher("/views/notice/notice.jsp");
//			request.setAttribute("pageData", pd);
//			view.forward(request, response);
		}
		else
		{
			response.sendRedirect("/views/notice/Error.html");
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
