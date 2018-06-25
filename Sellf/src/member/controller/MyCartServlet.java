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
import member.model.service.MemberInfoService;
import member.model.service.MyCartService;
import member.model.vo.Member;
import member.model.vo.UserCartList;
import product.model.vo.Product;

/**
 * Servlet implementation class MyCartServlet
 */
@WebServlet(name = "MyCart", urlPatterns = { "/myCart" })
public class MyCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// JDBCTemplate 호출 
			ServletContext context = getServletContext();
			String fullPath = context.getRealPath("/WEB-INF/property/driver.properties");
			JDBCTemplate.setDriverPath(fullPath);
			
			// 인코딩 
			request.setCharacterEncoding("utf-8");
			ArrayList<Product> list = new ArrayList<>();
			
		
			// 세션값이 넘어왔는지 여부 체크 
			HttpSession session = request.getSession(false);
			
			//System.out.println("세션값:"+session.getAttribute("login"));
			if(session.getAttribute("login")!=null) {
				Member m = (Member) session.getAttribute("login");
				System.out.println("m???"+m.getUser_birth());
				String userId = m.getUser_id();
				list =new MyCartService().myCartList(userId);
				
				RequestDispatcher view = request.getRequestDispatcher("/views/member/myCart.jsp");
				request.setAttribute("myCartList", list);
				view.forward(request, response);
			}
			else {
				System.out.println("로그인이 되어있지 않아 장바구니 접근 불가");
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
