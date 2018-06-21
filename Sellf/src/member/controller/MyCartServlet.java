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
import member.model.vo.UserCartList;

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
		request.setCharacterEncoding("utf-8");	 // 한글 인코딩 ( 받아오는 값은 없으니 지워도 되겠지 ? )
			//HttpSession session = request.getSession(false); // 세션에서 ID값 추출
		
	
			ArrayList<UserCartList> list = new MyCartService().myCartList();
			System.out.println("카트입니다." +list);
			RequestDispatcher view = request.getRequestDispatcher("/views/member/myCart.jsp");
			request.setAttribute("myCartList", list);
			view.forward(request, response);
			
			
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
