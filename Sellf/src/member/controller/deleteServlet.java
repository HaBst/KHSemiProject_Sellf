package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class deleteServlet
 */
@WebServlet(name = "delete", urlPatterns = { "/delete" })
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String userPwd = ((Member)session.getAttribute("user")).getUser_pwd();
		String userId = ((Member)session.getAttribute("user")).getUser_id();
		//3. 비즈니스 로직
		int result2 = new MemberService().deleteSave(userId);//탈퇴정보저장
		int result = new MemberService().deleteMember(userId,userPwd);//탈퇴
		
		if(result>0)
		{
			session.invalidate(); //세션 파기
			response.sendRedirect("/views/error/member/goodBye.html");
		}else
		{
			response.sendRedirect("/views/error/member/Error.html");
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
