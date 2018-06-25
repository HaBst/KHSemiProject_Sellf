package manager.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.dao.ManagerDao;
import manager.model.service.ManagerService;
import com.google.gson.Gson;

import common.JDBCTemplate;

/**
 * Servlet implementation class ManagerGetSubCtgServlet
 */
@WebServlet(name = "ManagerGetSubCtg", urlPatterns = { "/managerGetSubCtg" })
public class ManagerGetSubCtgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerGetSubCtgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//메인카테고리 선택에 따라 하위분류를 db에서 읽어오는 서블릿.
		
		ServletContext context = getServletContext();
		String fullPath = context.getRealPath("/WEB-INF/property/driver.properties");
		JDBCTemplate.setDriverPath(fullPath);
		
		request.setCharacterEncoding("UTF-8");
		String mainCtg = request.getParameter("mainCtg");
		System.out.println(mainCtg);
		
        HashMap<String, String> subCtg = new ManagerService().getSubCtg(mainCtg); //DB에서 읽어온 소분류를 저장.
//      for(String subId:subCtg.keySet())
//      {
//          System.out.println("key:"+subId+",value:"+subCtg.get(subId)); // 값 읽어온거 테스트
//      }
      //hash-map을 Gson이용하여 script로 넘김.
      response.setCharacterEncoding("UTF-8");
      response.setContentType("application/json");
      new Gson().toJson(subCtg,response.getWriter());

	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
