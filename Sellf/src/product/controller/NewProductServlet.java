package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.JDBCTemplate;
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
		ServletContext context = getServletContext();
		String fullPath = context.getRealPath("/WEB-INF/property/driver.properties");
		JDBCTemplate.setDriverPath(fullPath);
	
		ArrayList<Product> newProductMainList = new NewProductMainService().updateNewProductImg();	
		response.setCharacterEncoding("utf-8");
		JSONArray resultArray = new JSONArray(); // JSONarray 媛앹껜
		
		for (Product product : newProductMainList) { 
			JSONObject result = new JSONObject();
			result.put("id", product.getProduct_entire_pk());
			result.put("name", product.getProduct_name());
			result.put("price", product.getProduct_price());
			result.put("image", product.getProduct_image());
			result.put("productEntireNo",product.getProduct_entire_pk()); //상품고유 인덱스 번호
			System.out.println("상품금액:"+product.getProduct_price());
			System.out.println("상품고유번호 :"+product.getProduct_entire_pk());
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
