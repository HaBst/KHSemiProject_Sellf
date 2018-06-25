package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JDBCTemplate;
import member.model.service.myInfoService;
import member.model.vo.Member;
import product.model.vo.Product;

/**
 * Servlet implementation class cashServlet
 */
@WebServlet(name = "cash", urlPatterns = { "/cash" })
public class cashServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cashServlet() {
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
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = ((Member)session.getAttribute("login")).getUser_id();//접속중 아이디
		int ePoint = ((Member)session.getAttribute("login")).getUser_ePoint();//기존 포인트
		String money[] = request.getParameterValues("money");//충전할 포인트
		int cash2 = Integer.parseInt(money[0]); //충전할 포인트 숫자화
		int cash3 = (cash2+ePoint);//기존포인트 + 충전할포인트
		int result = new myInfoService().cash(id,cash3); //넘겨서 수정 ㄱ 
		if(result>0)
		{
			response.sendRedirect("/views/member/chargeSuccess.html");
		}
		else 
		{
			response.sendRedirect("/views/member/Error.html");
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
