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

import product.model.service.PopularProductService;
import product.model.vo.Product;

/**
 * Servlet implementation class CollectionSecServlet
 */
@WebServlet(name = "CollectionSec", urlPatterns = { "/collectionSec" })
public class CollectionSecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollectionSecServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Product> CollectionSecRandomList = new PopularProductService().CollectionSecRandomList();
		
		response.setCharacterEncoding("utf-8");
		JSONArray resultArray = new JSONArray();
	
		for (Product collectionRandom : CollectionSecRandomList) { 
			JSONObject result = new JSONObject();
			result.put("name", collectionRandom.getProduct_name());
			result.put("price", collectionRandom.getProduct_price());
			result.put("image", collectionRandom.getProduct_image());
			result.put("detail", collectionRandom.getProduct_detail());
			result.put("productNo",collectionRandom.getProduct_entire_pk()); // 상품 고유 인덱스
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
