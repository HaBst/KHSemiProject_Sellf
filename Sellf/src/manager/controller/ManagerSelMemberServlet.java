package manager.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JDBCTemplate;
import manager.model.service.ManagerMemberService;
import manager.model.vo.ManagerMemberData;
import manager.model.vo.ManagerMemberSearch;


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
		int currentPage ; //시작페이지
		if(request.getParameter("currentPage")==null) 
		{
			currentPage=1;
		} //시작페이지 없으면 1부터
		else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} //현재 페이지를 가져옴.
		ManagerMemberSearch mms = new ManagerMemberSearch();//회원 검색 조건을 담는 객체 선언.
		
		mms.setSelInfo(request.getParameter("selInfo"));   //검색 조건 선택한 값을 저장
		mms.setMemberInfo(request.getParameter("selVal")); //선택한 검색 조건에 해당하는 값을 입력받아 저장
		mms.setSelGrade(request.getParameter("selGrade"));    //선택한 등급을 저장
		mms.setGender(request.getParameter("gender"));    //선택한 성별 저장. 
		System.out.println(mms.getMemberInfo());
		ManagerMemberData mmd = new ManagerMemberService().getMemberSearch(currentPage,mms);   //회원 정보를 검색하는 서비스로 넘김.
		if(mmd!=null)//mmd객체가 널값이 아니라면
		{
			RequestDispatcher view = request.getRequestDispatcher("/views/manager/managerMemberSelect.jsp");
			request.setAttribute("listData", mmd);
			view.forward(request, response);
		}
		else
		{
			response.sendRedirect("/views/error/manager/managerPermissionError.html");
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
