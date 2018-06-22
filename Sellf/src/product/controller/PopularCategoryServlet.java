package product.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import common.JDBCTemplate;
import member.model.service.MainUserReviewService1;
import member.model.vo.UserReview;
import product.model.service.NewProductMainService;
import product.model.service.PopularCategoryService;
import product.model.vo.Product;
import product.model.vo.ProductCategorySubTb;
import product.model.vo.ProductSellTb;

/**
 * Servlet implementation class PopularCategoryServlet
 */
@WebServlet(name = "PopularCategory", urlPatterns = { "/popularCategory" })
public class PopularCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PopularCategoryServlet() {
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
		
		ArrayList<ProductCategorySubTb> list= new PopularCategoryService().popularCategoryList();

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
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
