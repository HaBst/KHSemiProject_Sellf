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
import product.model.service.PopularProductService;
import product.model.vo.Product;

/**
 * Servlet implementation class PopularProductServlet
 */
@WebServlet(name = "PopularProduct", urlPatterns = { "/popularProduct" })
public class PopularProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PopularProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			ArrayList<Product> popularProductList = new PopularProductService().popularProductList();
			
			ServletContext context = getServletContext();
			String fullPath = context.getRealPath("/WEB-INF/property/driver.properties");
			JDBCTemplate.setDriverPath(fullPath);	
			
			response.setCharacterEncoding("utf-8");
			JSONArray resultArray = new JSONArray(); // JSONarray ��ü
			// �������� ������ ���� ��ü�� �ʿ��ϱ� ������ array �� ����
			for (Product product : popularProductList) { // for : each���� ����ؼ� ��ü ����ϱ�
				JSONObject result = new JSONObject();
				result.put("name", product.getProduct_name());
				result.put("price", product.getProduct_price());
				result.put("image", product.getProduct_image());
				result.put("detail", product.getProduct_detail());
				result.put("productNo", product.getProduct_entire_pk()); // ��ǰ�����ε�����ȣ
				result.put("subCateId", product.getProduct_entire_category_sub_id_fk()); // ��ǰ�Һз��ε���
				//System.out.println("�α�ī�װ� �ֽŻ�ǰ "+ resultArray);
				System.out.println("�α⼭����̵�:"+product.getProduct_entire_category_sub_id_fk());
				resultArray.add(result);
			}
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(resultArray);
			response.getWriter().close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
