package manager.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.service.ManagerMemberService;
import manager.model.service.ManagerService;
import manager.model.vo.ManagerMemberSearch;
import manager.model.vo.ManagerSelMember;
import java.util.*;
import com.google.gson.Gson;

import common.JDBCTemplate;


/**
 * Servlet implementation class ManagerSelMemberServlet
 */
@WebServlet(name = "ManagerSelMember", urlPatterns = { "/managerSelMember" })
public class ManagerSelMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ManagerSelMemberServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context = getServletContext();
		String fullPath = context.getRealPath("/WEB-INF/property/driver.properties");
		JDBCTemplate.setDriverPath(fullPath);
		
		request.setCharacterEncoding("UTF-8");
		ManagerMemberSearch mmbs = new ManagerMemberSearch();
		
		mmbs.setSelInfo(request.getParameter("selInfo"));
		mmbs.setMemberInfo(request.getParameter("memberInfo"));
		mmbs.setSelGrade(request.getParameter("selGrade"));
		mmbs.setGender(request.getParameter("gender").charAt(0));
		System.out.println(mmbs.getSelInfo());
		System.out.println(mmbs.getMemberInfo());
		System.out.println(mmbs.getSelGrade());
		System.out.println(mmbs.getGender()); 
		
//		String selInfo = ; //select�±׿��� ������ option�� �����ϴ� ����
//		String memberInfo = request.getParameter("memberInfo"); // select�±׿��� ������ option�� �ش�Ǵ� ���� �Է¹޾� �����ϴ� ����
//		String selGrade = request.getParameter("selGrade"); //����� �̿��Ͽ� �˻��Ϸ��� ������ ����� �޾� ����. 
//		char gender = request.getParameter("gender").charAt(0); //�˻����ǿ� �ִ� ���� �����Ͽ��ٸ� ������ ���� ����.
		new ManagerMemberService().getMemberSearch(mmbs);
		
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");
//		new Gson().toJson(list,response.getWriter());	//gson����Ͽ� db���� �о�� ���� �ѱ�.
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
