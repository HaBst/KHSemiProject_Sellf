package product.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

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
		ArrayList<ProductCategorySubTb> list= new PopularCategoryService().popularCategoryList();
	
	
		
		// 1.인코딩
		JSONArray resultArray = new JSONArray(); // JSONarray 객체
		// 여러명의 정보를 담을 객체가 필요하기 때문에 array 로 만듦
		for (ProductCategorySubTb pST : list) { // for : each문을 사용해서 전체 출력하기
			JSONObject result = new JSONObject();
			result.put("categoryName", pST.getProductCategorySubName()); // 상품 대분류 가져옴 
			result.put("categoryImagePath", "/img/categoryImgGroup/" +pST.getProductCategorySubId() +".JPG");
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
