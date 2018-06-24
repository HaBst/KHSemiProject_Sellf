package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.UserReviewService;
import member.model.vo.Member;
import member.model.vo.UserReview;

/**
 * Servlet implementation class UserReviewServlet
 */
@WebServlet(name = "UserReview", urlPatterns = { "/userReview" })
public class UserReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("login");
		
		
		int point = Integer.parseInt(request.getParameter("starPoint"));
		String reviewComment = request.getParameter("reviewCommentArea");
		String reviewId = request.getParameter("reviewerID");// 판매자 아이디
		int productId = Integer.parseInt(request.getParameter("productId"));
		UserReview ur = new UserReview();
		ur.setUserReviewProductEntireFk(productId);
		ur.setUserReviewRating(point);
		ur.setUserReviewComment(reviewComment);
		ur.setUserReviewUserEntireIdFk(reviewId);
		ur.setUserReviewUserEntireReviewedIdFk("mslove11");//m.getUser_id()
		int result = new UserReviewService().reviewComment(ur);
		if(result>0)
		{
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(result);
			response.getWriter().close();
		}else
		{
			System.out.println("댓글등록에 실패했음");
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
