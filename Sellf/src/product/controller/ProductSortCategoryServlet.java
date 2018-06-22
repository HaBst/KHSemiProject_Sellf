package product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import common.JDBCTemplate;
import product.model.service.ProductService;
import product.model.vo.Product;

/**
 * Servlet implementation class ProductSortCategoryServlet
 */
@WebServlet(name = "ProductSortCategory", urlPatterns = { "/productSortCategory" })
public class ProductSortCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSortCategoryServlet() {
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

		request.setCharacterEncoding("utf-8");
		String mainCategory = request.getParameter("mainCategory");
		String subCategory = request.getParameter("subCategory");
		String orderType = request.getParameter("orderType");
		int onePageShowProduct = 8;//Integer.parseInt(request.getParameter("onePageShowProduct"));
		int currentPage = 0;//Integer.parseInt(request.getParameter("currentPage"));
		
		ArrayList<Product> list = new ProductService().productSortCategory(mainCategory,subCategory,onePageShowProduct,currentPage,orderType);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list, response.getWriter());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
