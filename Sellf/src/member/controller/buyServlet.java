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

import member.model.service.MemberService;
import member.model.vo.Member;
import member.model.vo.purchaseHis;
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
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String id = ((Member)session.getAttribute("user")).getUser_id();
		ArrayList<purchaseHis> list = new MemberService().buy(id);
		if(list.size()>0) 
		{
		ArrayList<Product> list2 =  new MemberService().buy2(list);
		System.out.println("if 서블릿에서 list2:"+list2.size());
		RequestDispatcher view = request.getRequestDispatcher("/views/member/myBuy.jsp");
		request.setAttribute("product", list2);
		view.forward(request, response);
		}
		else 
		{
		System.out.println("else로 옴");
		response.sendRedirect("/views/member/myBuy.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
