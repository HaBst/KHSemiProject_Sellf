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
import member.model.service.MyCartService;
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
			ServletContext context = getServletContext();
			String fullPath = context.getRealPath("/WEB-INF/property/driver.properties");
			JDBCTemplate.setDriverPath(fullPath);
		
			request.setCharacterEncoding("utf-8");	 // �ѱ� ���ڵ� ( �޾ƿ��� ���� ������ ������ �ǰ��� ? )
			//HttpSession session = request.getSession(false); // ���ǿ��� ID�� ����
		
	
			ArrayList<Product> list = new MyCartService().myCartList();
			System.out.println("īƮ�Դϴ�." +list.get(0).getProduct_amount());
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
