package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JDBCTemplate;
import product.model.service.ProductService;
import product.model.vo.Product;

/**
 * Servlet implementation class ProductSelectOneServlet
 */
@WebServlet(name = "ProductSelectOne", urlPatterns = { "/productSelectOne" })
public class ProductSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSelectOneServlet() {
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
		int productPk = Integer.parseInt(request.getParameter("productId"));
		Product p = new ProductService().selectOneProduct(productPk);
		if(p!=null)
		{
			RequestDispatcher view = request.getRequestDispatcher("/views/product/productSelect.jsp");
			request.setAttribute("productInfo", p);
			view.forward(request, response);
		}
		else
		{
			
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
