package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import product.model.service.NewProductMainService;
import product.model.vo.Product;

/**
 * Servlet implementation class NewProductServlet
 */
@WebServlet(name = "NewProduct", urlPatterns = { "/newProduct" })
public class NewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
	
		ArrayList<Product> newProductMainList = new NewProductMainService().updateNewProductImg();
		System.out.println(newProductMainList.get(0).getProduct_name());
		
	
		response.setCharacterEncoding("utf-8");
		JSONArray resultArray = new JSONArray(); // JSONarray 媛앹껜
		
		for (Product product : newProductMainList) { 
			JSONObject result = new JSONObject();
			result.put("name", product.getProduct_name());
			result.put("price", product.getProduct_price());
			result.put("image", product.getProduct_image());
			resultArray.add(result);
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(resultArray);
		response.getWriter().close();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
