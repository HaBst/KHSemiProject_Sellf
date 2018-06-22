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
		
		ManagerMemberSearch mms = new ManagerMemberSearch(); //회원 검색 조건을 담는 객체 선언.
		mms.setSelInfo(request.getParameter("selInfo"));   //검색 조건 선택한 값을 저장
		mms.setMemberInfo(request.getParameter("memberInfo")); //선택한 검색 조건에 해당하는 값을 입력받아 저장
		mms.setSelGrade(request.getParameter("selGrade"));    //선택한 등급을 저장
		mms.setGender(request.getParameter("gender"));        //선택한 성별 저장.
		new ManagerMemberService().getMemberSearch(mms);   //회원 정보를 검색하는 서비스로 넘김.
		
		
		//ArrayList<ManagerSelMember> list = new ManagerService().selMember(selInfo, memberInfo,selGrade,gender);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		//new Gson().toJson(list,response.getWriter());	//gson����Ͽ� db���� �о�� ���� �ѱ�.
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
