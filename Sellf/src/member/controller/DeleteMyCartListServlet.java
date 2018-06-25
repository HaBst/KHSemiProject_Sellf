package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MyCartService;
import member.model.vo.Member;

/**
 * Servlet implementation class DeleteMyCartListServlet
 */
@WebServlet(name = "DeleteMyCartList", urlPatterns = { "/deleteMyCartList" })
public class DeleteMyCartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMyCartListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
		 String[] productEntireArr = request.getParameterValues("items");
		 System.out.println("productEntireArr:"+ productEntireArr);
		 HttpSession session = request.getSession(false);
		 if(session.getAttribute("login")!=null) {
			 Member m = (Member) session.getAttribute("login");
			 String userId = m.getUser_id();
			 
			 int [] result = new int [productEntireArr.length]; // 결과값 받기 
			 
			 for(int i = 0 ;i<productEntireArr.length;i++) {
				// int [] productEntireArr1 = new int[productEntireArr.length];
				 result[i]= new MyCartService().deleteOneMycartList(userId,productEntireArr[i]);
				 System.out.println("장바구니 목록에서 선택삭제 됐니?" +result[i]);
			 }
			
			 System.out.println("장바구니 목록에서 선택삭제 됐니?" +result[1]);
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
