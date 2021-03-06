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
import member.model.service.myInfoService;
import member.model.vo.Member;
import product.model.vo.Product;

/**
 * Servlet implementation class buyServlet
 */
@WebServlet(name = "buy", urlPatterns = { "/buy" })
public class buyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public buyServlet() {
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
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = ((Member)session.getAttribute("login")).getUser_id();
		ArrayList<Product> list = new myInfoService().Buy(id);
		if(list.size()>0) 
		{
		RequestDispatcher view = request.getRequestDispatcher("/views/member/myBuy.jsp");
		request.setAttribute("product", list);
		view.forward(request, response);
		}
		else 
		{
		response.sendRedirect("/views/member/myBuy.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
