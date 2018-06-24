package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		HttpSession session = request.getSession(false);
		String memberName = request.getParameter("memberName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("addrInfo")+request.getParameter("addrDetail");
		
		if(session.getAttribute("login")!=null) {
			Member m = (Member) session.getAttribute("login");
			String userId = m.getUser_id();
			MyCartTmp mt = new MyCartTmp();
			System.out.println("myCart3 서블릿 왔어");
		}
		
		else {
			System.out.println("로그인이 되어있지않아 접근 불가");
			response.sendRedirect("/views/error/memberLoginError.html");
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
