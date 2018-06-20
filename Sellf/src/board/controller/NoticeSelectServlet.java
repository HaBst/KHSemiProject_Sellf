package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.NoticeService;
import board.model.vo.Notice;
import board.model.vo.NoticeComment;

/**
 * Servlet implementation class NoticeSelectServlet
 */
@WebServlet(name = "NoticeSelect", urlPatterns = { "/noticeSelect" })
public class NoticeSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//2. view에서 보낸 데이터를 변수에 저장 
		int notice_pk = Integer.parseInt(request.getParameter("notice_pk"));
		
		//3. 비즈니스로직 
		Notice notice = new NoticeService().noticeSelect(notice_pk);
		//3. 비즈니스 로직(댓글 내용) 
		ArrayList<NoticeComment> list = new NoticeService().noticeComment(notice_pk);
		
		System.out.println("댓글길이: "+list.size());
		//4. View에 결과 출력 
		if(notice!=null)
		{
		    System.out.println(notice.getNotice_pk());
			RequestDispatcher view = request.getRequestDispatcher("/views/board/boardSelect.jsp"); 
			request.setAttribute("notice", notice);
			request.setAttribute("comment", list);
			view.forward(request, response);
		}
		else
		{
			response.sendRedirect("/views/notice/noticeError.html");
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
