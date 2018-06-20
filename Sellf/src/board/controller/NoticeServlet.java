package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.NoticeService;
import board.model.vo.NoticePageData;

/**
 * Servlet implementation class NoticeServlet
 */
@WebServlet(name = "Notice", urlPatterns = { "/notice" })
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int currentPage;
		//첫페이지는 요청값이 없음. 따라서 첫페이지만 1로 셋팅하고 그외 페이지라면 해당 페이지값을 셋팅
		if(request.getParameter("currentPage")==null)
		{
			currentPage=1;
		}
		else
		{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		//비즈니스 로직
		NoticePageData npd = new NoticeService().noticeAll(currentPage);
		if(npd!=null)
		{
			RequestDispatcher view = request.getRequestDispatcher("/views/board/board.jsp");
			request.setAttribute("NoticePageData", npd);
			request.setAttribute("noticeTab", "boardListArea");
			view.forward(request, response);
		}else
		{
			response.sendRedirect("/views/error/notice/NoticeError.html");
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
