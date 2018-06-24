package member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MyCartService;
import member.model.vo.Member;
import member.model.vo.MyCartTmp;
import product.model.vo.Product;

/**
 * Servlet implementation class MyCart3Servlet
 */
@WebServlet(name = "MyCart3", urlPatterns = { "/myCart3" })
public class MyCart3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCart3Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login")!=null) {
			
			Member m = (Member) session.getAttribute("login");
			String userId = m.getUser_id();
			RequestDispatcher view = request.getRequestDispatcher("/views/member/myCart3.jsp");
			request.setAttribute("myCartList3", m);
			view.forward(request, response);
		}else {
		
		
		System.out.println("로그인이 되어있지않아 접근 불가");
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
