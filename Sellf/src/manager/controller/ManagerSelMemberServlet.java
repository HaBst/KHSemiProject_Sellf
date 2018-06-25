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
import manager.model.vo.ManagerMemberData;
import manager.model.vo.ManagerMemberSearch;
import manager.model.vo.ManagerSelMember;
import manager.model.vo.SelMemberPageData;

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
		
		ManagerMemberSearch mms = new ManagerMemberSearch();//회원 검색 조건을 담는 객체 선언.
		
		mms.setSelInfo(request.getParameter("selInfo"));   //검색 조건 선택한 값을 저장
		mms.setMemberInfo(request.getParameter("memberInfo")); //선택한 검색 조건에 해당하는 값을 입력받아 저장
		mms.setSelGrade(request.getParameter("selGrade"));    //선택한 등급을 저장
		mms.setGender(request.getParameter("gender"));    //선택한 성별 저장. 
		System.out.println(mms.getMemberInfo());
		int currentPage; //현재 페이지 값을 저장하는 변수
		System.out.println("");
		
		if(request.getParameter("currentPage")==null)currentPage=1; //첫번째 페이지이면 1로 설정
		else currentPage = Integer.parseInt(request.getParameter("currentPage")); //1페이지가 아니면 그 페이지 값을 가져옴.
		SelMemberPageData spd = new ManagerMemberService().getMemberSearch(currentPage,mms);
		   //회원 정보를 검색하는 서비스로 넘김.
		if(spd!=null) //pd가 비어있지 않다면
		{
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(spd, response.getWriter());
		}
		else
		{
			response.sendRedirect("/views/notice/Error.html");
		}
		
		//ArrayList<ManagerSelMember> list = new ManagerService().selMember(selInfo, memberInfo,selGrade,gender);
//		
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");
//		new Gson().toJson,response.getWriter());	//gson����Ͽ� db���� �о�� ���� �ѱ�.
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
