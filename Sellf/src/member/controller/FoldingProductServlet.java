package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MyCartService;
import member.model.vo.Member;

/**
 * Servlet implementation class FoldingProductServlet
 */
@WebServlet(name = "FoldingProduct", urlPatterns = { "/foldingProduct" })
public class FoldingProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoldingProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String productEntire = request.getParameter("");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("login")!=null) {
			Member m = (Member)session.getAttribute("login");
			String userId = m.getUser_id();
			int result = new MyCartService().insertCartList(userId,productEntire);
			System.out.println("장바구니 담기 성공했니?? 성공하면 !"+result);
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
