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

import product.model.service.ProductInsertService;
import product.model.vo.CateSmall;
import product.model.vo.ProductCategorySubTb;

/**
 * Servlet implementation class ProductSmallCateServlet
 */
@WebServlet(name = "ProductSmallCate", urlPatterns = { "/productSmallCate" })
public class ProductSmallCateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSmallCateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cateBig = request.getParameter("bCategory");
		ArrayList<CateSmall> list = new ProductInsertService().productSmallCate(cateBig);
//		new Gson().toJson(list,response.getWriter());
	      JSONArray resultArray = new JSONArray(); // JSONarray 객체
	      // 여러명의 정보를 담을 객체가 필요하기 때문에 array 로 만듦/
	      for (CateSmall cs : list) { // for : each문을 사용해서 전체 출력하기
	         JSONObject result = new JSONObject();
	         result.put("ScateId", cs.getProductCategorySubId()); // 상품 대분류 가져옴
	         result.put("ScateName", cs.getProductCategorySubName());
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
