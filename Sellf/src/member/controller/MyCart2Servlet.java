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
		request.setCharacterEncoding("utf-8");
		


		HttpSession session =  request.getSession(false);
		if(session.getAttribute("user")!=null) {
	
			 RequestDispatcher view = request.getRequestDispatcher("/views/member/myCart2.jsp");
			 request.setAttribute("myCartList", list);
			 view.forward(request, response);
			 
		}else {
			System.out.println("myCart2.jsp로 보내기 실패 ");
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
