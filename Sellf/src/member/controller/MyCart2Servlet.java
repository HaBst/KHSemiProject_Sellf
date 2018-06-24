package member.controller;

import java.io.IOException;
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
 * Servlet implementation class MyCart2Servlet
 */
@WebServlet(name = "MyCart2", urlPatterns = { "/myCart2" })
public class MyCart2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyCart2Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); // 한글인코딩 		

		String info = request.getParameter("productIndex"); // 파라미터 값 받아오기 
		System.out.println("productIndex:"+info);
		
		String [] arr = info.split(",");
		
		ArrayList<MyCartTmp> list = new ArrayList<MyCartTmp>();
		
		HttpSession session = request.getSession(false); // 세션값 여부에 따라 로직 진행 
		if(session.getAttribute("login")!=null) {
			Member m =  (Member) session.getAttribute("login");
			System.out.println("m객체 있니?"+m.getUser_ePoint());
			for(int i = 0 ; i<arr.length;i++) { 		
				MyCartTmp mt = new MyCartService().selectCartList(arr[i]);
				list.add(mt);	
				System.out.println("for문안에 list있니?"+list.get(i));
			}
			
			request.setCharacterEncoding("utf-8");
			System.out.println("마이카트서블릿2:"+list.get(0).getProductDetail());
			RequestDispatcher view = request.getRequestDispatcher("/views/member/myCart2.jsp");
			request.setAttribute("orderList", list);
			view.forward(request, response);
		}
		else {
			System.out.println("로그인이 되어있지 않아 장바구니 접근 불가");
			response.sendRedirect("/views/member/memberLoginError.jsp");
		}
		
		
		
}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
