package product.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import common.FileRename;
import product.model.service.FileService;
import product.model.service.ProductInsertService;
import product.model.vo.DataFile;
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
//		String userId = "mslove1";

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
			

			//				String beforeFileName = multi.getOriginalFileName("upfile5"); // 원본파일

			String afterFileNameOne = multi.getFilesystemName("upfile1"); //바뀐파일
			
			String afterFileNameTwo = multi.getFilesystemName("upfile2");
			
			String afterFileNameThree = multi.getFilesystemName("upfile3");
			
			String afterFileNameFour = multi.getFilesystemName("upfile4");
			
			String afterFileNameFive = multi.getFilesystemName("upfile5");
			
			
			// 2. 업로드 파일의 실제 총 경로(filePath)
			// 총 경로 : filePath+파일이름
			// ex) 업로드한 파일이 a.txt 라면?
			// 총 경로 : c:\webworkspace2\web2\webContent\\uploadfile\a.txt

			String fullFilePathOne = uploadFilePath+"\\"+afterFileNameOne;
			String fullFilePathTwo = uploadFilePath+"\\"+afterFileNameTwo;
			String fullFilePathThree = uploadFilePath+"\\"+afterFileNameThree;
			String fullFilePathFour = uploadFilePath+"\\"+afterFileNameFour;
			String fullFilePathFive = uploadFilePath+"\\"+afterFileNameFive;
			
			System.out.println("beforeFileName"+beforeFileNameOne);
			System.out.println("afterFileName"+afterFileNameOne);
			System.out.println(fullFilePathOne);
			System.out.println("-----");
			System.out.println("beforeFileName"+beforeFileNameTwo);
			System.out.println("afterFileName"+afterFileNameTwo);
			System.out.println(fullFilePathTwo);
			System.out.println("-----");
			System.out.println("beforeFileName"+beforeFileNameThree);
			System.out.println("afterFileName"+afterFileNameThree);
			System.out.println(fullFilePathThree);
			System.out.println("-----");
			System.out.println("beforeFileName"+beforeFileNameFour);
			System.out.println("afterFileName"+afterFileNameFour);
			System.out.println(fullFilePathFour);
			System.out.println("-----");
			System.out.println("beforeFileName"+beforeFileNameFive);
			System.out.println("afterFileName"+afterFileNameFive);
			System.out.println(fullFilePathFive);
			System.out.println("-----");
			
			ImageUpload iu = new ImageUpload();
			iu.setImgOne(afterFileNameOne);
			iu.setImgTwo(afterFileNameTwo);
			iu.setImgThree(afterFileNameThree);
			iu.setImgFour(afterFileNameFour);
			iu.setImgFive(afterFileNameFive);
			
			

		
		//3. 파일의 길이-크기 (length)
		//				File file = new File(fullFilePath); // 해당 파일을 오픈
		//				long fileSize = file.length();
		//				System.out.println(fileSize);
		// 파일 사이즈가 long인 이유?
		// 파일 사이즈는 Byte 단위

		//4. 파일 유저명
		// 굳이 만들필요가 없음(위에 userID 변수를 만들어 놓았음)

		// 5. 파일 업로드된 타임(밀리세컨드)
		//				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
		//				Timestamp uploadTime = null;
		//				
		//				uploadTime = Timestamp.valueOf(formatter.format(Calendar.getInstance().getTimeInMillis()));
		// Timestamp 패키지는 java.sql.Timestamp 로  가져와야 함

		//객체에 값 저장
		//				DataFile df = new DataFile(afterFileName, fullFilePath, userId);


		//비즈니스 로직 처리
		//				int result = new FileService().uploadFile(df);
			String productEntireUserIdFK = "mslove11";
			String productEntireCateMainIdFK = multi.getParameter("bCategory"); //카테고리 대분류
			System.out.println("카테고리"+productEntireCateMainIdFK);
			String productEntireCateSubIdFK = multi.getParameter("sCategory"); //카테고리 소분류
			System.out.println("소분류"+productEntireCateSubIdFK);
			String productName = multi.getParameter("productName"); //상품이름
			System.out.println("상품이름"+productName);
			int productPrice = Integer.parseInt(multi.getParameter("price")); // 상품 가격
			System.out.println("상품가격"+productPrice);
			int productAmount = Integer.parseInt(multi.getParameter("productCount")); //상품 수량
			System.out.println("상품수량"+productAmount);
			String productGrade = multi.getParameter("grade"); //상품 등급
			System.out.println("상품등급"+productGrade);
			String productDetail = multi.getParameter("detail"); //상세설명
			System.out.println("상세설명"+productDetail);

			ProductInsert pi = new ProductInsert();
			pi.setProductEntireUserIdFK(productEntireUserIdFK);
			pi.setProductEntireCateMainIdFK(productEntireCateMainIdFK);
			pi.setProductEntireCateSubIdFK(productEntireCateSubIdFK);
			pi.setProductName(productName);
			pi.setProductPrice(productPrice);
			pi.setProductAmount(productAmount);
			pi.setProductGrade(productGrade);
			pi.setProductDetail(productDetail);
			
			
			
			
			result = new ProductInsertService().productInsert(pi);
			System.out.println("결과"+result);
		if(result > 0) {
			response.sendRedirect("/views/file/fileUploadSuccess.jsp");
		}else {
			response.sendRedirect("/views/file/fileError.html");
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
