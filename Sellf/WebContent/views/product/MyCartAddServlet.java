package views.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import product.model.service.ProductService;

/**
 * Servlet implementation class MyCartAddServlet
 */
@WebServlet(name = "MyCartAdd", urlPatterns = { "/myCartAdd" })
public class MyCartAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCartAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		
		if(session.getAttribute("login")!=null) {
			int productId = Integer.parseInt(request.getParameter("productId"));
			Member m = (Member)session.getAttribute("login");
			int result = new ProductService().productAddCart(m.getUser_id(),productId);
			if(result>0)
			{
				response.sendRedirect("/myCart");
			}
			else
			{
				response.sendRedirect("/views/error/product/productAddCartFail.html");
			}
		}
		else
		{
			response.sendRedirect("/views/error/member/memberLoginError.html");
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
