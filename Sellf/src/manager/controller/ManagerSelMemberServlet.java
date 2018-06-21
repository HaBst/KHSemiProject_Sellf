package manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.service.ManagerService;
import manager.model.vo.ManagerSelMember;
import java.util.*;
import com.google.gson.Gson;


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
		request.setCharacterEncoding("UTF-8");
		
		String selInfo = request.getParameter("selInfo"); //select�±׿��� ������ option�� �����ϴ� ����
		String memberInfo = request.getParameter("memberInfo"); // select�±׿��� ������ option�� �ش�Ǵ� ���� �Է¹޾� �����ϴ� ����
		String selGrade = request.getParameter("selGrade"); //����� �̿��Ͽ� �˻��Ϸ��� ������ ����� �޾� ����. 
		char gender = request.getParameter("gender").charAt(0); //�˻����ǿ� �ִ� ���� �����Ͽ��ٸ� ������ ���� ����.
		ArrayList<ManagerSelMember> list = new ManagerService().selMember(selInfo, memberInfo,selGrade,gender);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list,response.getWriter());	//gson����Ͽ� db���� �о�� ���� �ѱ�.
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
