package product.model.dao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import product.model.service.ProductInsertService;
import product.model.vo.ImageUpload;
import product.model.vo.ProductInsert;

/**
 * Servlet implementation class FileRemoveServlet
 */
@WebServlet(name = "FileRemove", urlPatterns = { "/fileRemove" })
public class FileRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileRemoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ImageUpload iu = new ImageUpload();
		ProductInsert pi = new ProductInsert();
		
		String userId = request.getParameter("userId");
		System.out.println(userId);
		String productImage =request.getParameter("productImage");
		System.out.println( ((ImageUpload)productImage).getImgOne()) ;
		
//		System.out.println((ImageUpload)productImage.);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
