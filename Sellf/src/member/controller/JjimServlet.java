package member.controller;

import java.io.IOException;
import java.util.ArrayList;

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
import member.model.vo.Member;
import member.model.vo.wishList;
import product.model.vo.Product;

/**
 * Servlet implementation class JjimServlet
 */
@WebServlet(name = "Jjim", urlPatterns = { "/jjim" })
public class JjimServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JjimServlet() {
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
		String id = ((Member)session.getAttribute("user")).getUser_id();
		ArrayList<wishList> list  = new MemberService().jjimList(id);
		if(list.size()>0) 
		{
		ArrayList<Product> list2 = new MemberService().jjimList2(list);
		System.out.println("Servlet->list2:"+list2.size());
		RequestDispatcher view = request.getRequestDispatcher("/views/member/jjim.jsp");
		request.setAttribute("product", list2);
		view.forward(request, response);
		}
		else 
		{
		response.sendRedirect("/views/member/jjim.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
