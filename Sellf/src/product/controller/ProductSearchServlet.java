package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import product.model.service.ProductInsertService;
import product.model.vo.PageData;

/**
 * Servlet implementation class ProductSearchServlet
 */
@WebServlet(name = "productSearch", urlPatterns = { "/productSearch" })
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿 시작");
		request.setCharacterEncoding("utf-8");
		String searchSub = request.getParameter("searchSub");
		System.out.println(searchSub);
		
		int currentPage;
		if(request.getParameter("currentPage")==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		PageData pd = new ProductInsertService().searchSub(searchSub,currentPage);
		
		if(pd != null) {
			RequestDispatcher view = request.getRequestDispatcher("/views/product/productSearch.jsp");
			request.setAttribute("pageData", pd);
			request.setAttribute("searchSub", searchSub);
			view.forward(request, response);
		}else {
			response.sendRedirect("/views/product/poductError.jsp");
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
