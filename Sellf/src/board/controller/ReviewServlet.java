package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonElement;

import board.model.service.NoticeService;
import board.model.service.ReviewService;
import board.model.vo.NoticePageData;
import board.model.vo.ProductReviewPageData;

/**
 * Servlet implementation class NoticeServlet
 */
@WebServlet(name = "Review", urlPatterns = { "/review" })
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewServlet() {
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
		ProductReviewPageData rpd = new ReviewService().reviewAll(currentPage);
		if(rpd!=null)
		{
			RequestDispatcher view = request.getRequestDispatcher("/views/board/boardReview.jsp");
			request.setAttribute("ProductReviewPageData", rpd);
			request.setAttribute("noticeTab", "reviewListArea");
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
