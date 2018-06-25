package manager.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.PortableServer.RequestProcessingPolicy;

import com.google.gson.Gson;

import common.JDBCTemplate;
import manager.model.service.ManagerService;
import manager.model.vo.Manager;
import manager.model.vo.ManagerTotalMember;

/**
 * Servlet implementation class ManagerFirstLoadServlet
 */
@WebServlet(name = "ManagerFirstLoad", urlPatterns = { "/managerFirstLoad" })
public class ManagerFirstLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerFirstLoadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//맨처음 관리자 계정으로 로그인했을 시 그래프와 테이블에 들어갈 정보를 읽어오는 servlet. 
		ServletContext context = getServletContext();
		String fullPath = context.getRealPath("/WEB-INF/property/driver.properties");
		JDBCTemplate.setDriverPath(fullPath);
	
		HashMap<Integer, ArrayList<ManagerTotalMember>> totalMember=new ManagerService().getMemberStatus();
		 request.getContextPath();
		if(!totalMember.isEmpty())
			{
			System.out.println("success");
			System.out.println(totalMember);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(totalMember,response.getWriter());
				
						
			}else {
				System.out.println("fail");
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
