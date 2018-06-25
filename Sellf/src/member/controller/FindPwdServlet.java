package member.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import common.EmailConfirm;
import common.JDBCTemplate;
import member.model.service.FindIdPwdService;

/**
 * Servlet implementation class FindPwdServlet
 */
@WebServlet(name = "FindPwd", urlPatterns = { "/findPwd" })
public class FindPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String authReturn = "";	   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		ServletContext context = getServletContext();
		String fullPath = context.getRealPath("/WEB-INF/property/driver.properties");
		JDBCTemplate.setDriverPath(fullPath);
		
		//이름, 아이디 , 이메일이 입력되고 이메일 인증번호를 요청했을때.
		if(authReturn.length()==0)
		{
					request.setCharacterEncoding("utf-8");
					authReturn = "";
					String userId = request.getParameter("userId");
					String userName = request.getParameter("userName");
					String userEmail = request.getParameter("userEmail");
					System.out.println(userId);
					System.out.println(userName);
					System.out.println(userEmail);
					
					int result = new FindIdPwdService().existUserFindingPwd(userId, userName, userEmail);
					System.out.println(result);
					if(result>0)
					{	
						System.out.println("등록되어있는 아이디입니다.");
						System.out.println("메일 보냄 성공");
						authReturn = new EmailConfirm().connectEmail(request.getParameter("userEmail"));			
						System.out.println(authReturn);
					}
					else
					{
						System.out.println("등록되어있지 않은 정보입니다.");
					}
				}
				else// 사용자가 다음버튼을 눌렀을때.
				{
					String sendMyAuth=request.getParameter("sendMyAuth");
					// 인증번호 일치
					if(sendMyAuth.equals(authReturn))
					{
						System.out.println("인증성공");
						response.setCharacterEncoding("utf-8");
						response.getWriter().print("인증성공");
						response.getWriter().close();
					}
					else // 인증번호 불일치
					{
						System.out.println("인증실패");
						response.sendRedirect("/views/error/member/Error.html");
					}			
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
