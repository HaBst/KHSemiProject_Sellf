package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.FaqService;
import board.model.service.NoticeService;
import board.model.vo.FaqPageData;
import board.model.vo.NoticePageData;

/**
 * Servlet implementation class FaqServlet
 */
@WebServlet(name = "Faq", urlPatterns = { "/faq" })
public class FaqServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		FaqPageData fpd = new FaqService().faqAll(currentPage);
		if(fpd!=null)
		{
			RequestDispatcher view = request.getRequestDispatcher("/views/board/boardFaq.jsp");
			request.setAttribute("FaqPageData", fpd);
			request.setAttribute("noticeTab", "answerListArea");
			view.forward(request, response);
		}else
		{
			RequestDispatcher view = request.getRequestDispatcher("/views/board/boardFaq.jsp");
			request.setAttribute("noticeTab", "answerListArea");
			view.forward(request, response);
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
