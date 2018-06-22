package product.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.oreilly.servlet.MultipartRequest;

import common.FileRename;
import product.model.service.ProductInsertService;
import product.model.vo.ImageUpload;
import product.model.vo.ProductInsert;

/**
 * Servlet implementation class ProductInsertServlet
 */
@WebServlet(name = "ProductInsert", urlPatterns = { "/productInsert" })
public class ProductInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파일 업로드르르 거ㅜ현하려면 몇가지 정보들이 필요함
		//1. 사용자 계정명(업로드한 사람 정보가 있어야함, session객체에서 꺼냄)
		HttpSession session = request.getSession();

		//				String userId = (((Member)session.getAttribute("user")).getUserId());

		//2. 최대 업로드 파일 사이즈 (설정)
		int fileSizeLimit = 1024*1024*1024*5;//Byte 단위(50MB)

		//3. 업로드 될 경로
		String uploadFilePath = getServletContext().getRealPath("/")+"uploadfile"; // getRealPath("/")-> WebContent

		//4. 인코딩 타입(파일 인코딩 타입)
		String enctype = "UTF-8";

		// 위에 정보를 바탕으로
		//5. MultipartRequest 객체를 생성
		//MultipartRequest 객체가 생성되면 requst의 기능 이 사라짐(MultipartRequest로 합쳐짐)
		//인자값 순서  : request, 파일경로, 파일최대 사이즈, 인코딩 타입, Policy

		MultipartRequest multi = new MultipartRequest(request,uploadFilePath,fileSizeLimit,enctype,new FileRename());

		// 파일 이름이 2가지가 저장되어야 함
		// beforFileName 과 afterFileName 생성
		// 업로드된 파일의 정보를 DB에 기록하여야 함

		// 1. 파일 이름 (fileName)
		// getFilesystemName("view의 파라미터이름"); 을 하게 되면
		// 해당 업로드 될때의 파일 이름을 가져옴
		


			String beforeFileNameOne = multi.getOriginalFileName("upfile1");
			
			String beforeFileNameTwo = multi.getOriginalFileName("upfile2");
			
			String beforeFileNameThree = multi.getOriginalFileName("upfile3");
			
			String beforeFileNameFour = multi.getOriginalFileName("upfile4");
			
			String beforeFileNameFive = multi.getOriginalFileName("upfile5");

			String afterFileNameOne = multi.getFilesystemName("upfile1"); //바뀐파일
			
			String afterFileNameTwo = multi.getFilesystemName("upfile2");
			
			String afterFileNameThree = multi.getFilesystemName("upfile3");
			
			String afterFileNameFour = multi.getFilesystemName("upfile4");
			
			String afterFileNameFive = multi.getFilesystemName("upfile5");

			String fullFilePathOne = uploadFilePath+"\\"+afterFileNameOne;
			String fullFilePathTwo = uploadFilePath+"\\"+afterFileNameTwo;
			String fullFilePathThree = uploadFilePath+"\\"+afterFileNameThree;
			String fullFilePathFour = uploadFilePath+"\\"+afterFileNameFour;
			String fullFilePathFive = uploadFilePath+"\\"+afterFileNameFive;
			
			ImageUpload iu = new ImageUpload();
			iu.setImgOne(afterFileNameOne);
			iu.setImgTwo(afterFileNameTwo);
			iu.setImgThree(afterFileNameThree);
			iu.setImgFour(afterFileNameFour);
			iu.setImgFive(afterFileNameFive);
			
			String productEntireUserIdFK = "mslove11";
			String productEntireCateMainIdFK = multi.getParameter("bCategory"); //카테고리 대분류
//			System.out.println("카테고리"+productEntireCateMainIdFK);
			String productEntireCateSubIdFK = multi.getParameter("sCategory"); //카테고리 소분류
//			System.out.println("소분류"+productEntireCateSubIdFK);
			String productName = multi.getParameter("productName"); //상품이름
//			System.out.println("상품이름"+productName);
			int productPrice = Integer.parseInt(multi.getParameter("price")); // 상품 가격
//			System.out.println("상품가격"+productPrice);
			int productAmount = Integer.parseInt(multi.getParameter("productCount")); //상품 수량
//			System.out.println("상품수량"+productAmount);
			String productGrade = multi.getParameter("grade"); //상품 등급
//			System.out.println("상품등급"+productGrade);
			String productDetail = multi.getParameter("detail"); //상세설명
//			System.out.println("상세설명"+productDetail);

			ProductInsert pi = new ProductInsert();
			pi.setProductEntireUserIdFK(productEntireUserIdFK);
			pi.setProductEntireCateMainIdFK(productEntireCateMainIdFK);
			pi.setProductEntireCateSubIdFK(productEntireCateSubIdFK);
			pi.setProductName(productName);
			pi.setProductPrice(productPrice);
			pi.setProductImage(iu);
			pi.setProductAmount(productAmount);
			pi.setProductGrade(productGrade);
			pi.setProductDetail(productDetail);
			
			
			
			int result = 0;
			result = new ProductInsertService().productInsert(pi);
			
		if(result > 0) {
			response.sendRedirect("/views/error/product/productInsertSuccess.jsp");
		}else {
			
			JSONObject jsonObj = pi.getProductImage().getImgArr();

			String value1 = (String)jsonObj.get("1");
			String value2 = (String)jsonObj.get("2");
			String value3 = (String)jsonObj.get("3");
			String value4 = (String)jsonObj.get("4");
			String value5 = (String)jsonObj.get("5");
			
			System.out.println("키 1값 : "  + value1);
			System.out.println("키 2값 : "  + value2);
			System.out.println("키 3값 : "  + value3);
			System.out.println("키 4값 : "  + value4);
			System.out.println("키 5값 : "  + value5);
			

			
			if(value1 != null) {
				File file1 = new File(fullFilePathOne);
				file1.delete();
			}
			if(value2 != null) {
				File file2 = new File(fullFilePathTwo);
				file2.delete();
			}
			if(value3 != null) {
				File file3 = new File(fullFilePathThree);
				file3.delete();
			}
			if(value4 != null) {
				File file4 = new File(fullFilePathFour);
				file4.delete();
			}
			if (value5 != null) {
				File file5 = new File(fullFilePathFive);
				file5.delete();
			}
			
			response.sendRedirect("/views/error/product/productInsertError.jsp");
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
