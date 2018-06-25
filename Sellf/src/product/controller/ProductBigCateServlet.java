package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import product.model.service.ProductInsertService;
import product.model.vo.CateBig;

/**
 * Servlet implementation class ProductBigCateServlet
 */
@WebServlet(name = "ProductBigCate", urlPatterns = { "/productBigCate" })
public class ProductBigCateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductBigCateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("login") != null) {
			System.out.println("세션"+session.getAttribute("login"));
			ArrayList<CateBig>list = new ProductInsertService().productBigCate();
			
			RequestDispatcher view = request.getRequestDispatcher("/views/product/productInsert.jsp");
			request.setAttribute("listBig", list);
			view.forward(request, response);
		}else {
			response.sendRedirect("/views/error/product/productInsertSessionOver.jsp");
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
