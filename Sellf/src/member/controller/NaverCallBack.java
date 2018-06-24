package member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class NaverCallBack
 */
@WebServlet("/navercallback")
public class NaverCallBack extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NaverCallBack() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String token = (String) request.getAttribute("token");
		System.out.println(token);
		String header = "Bearer " + token; // Bearer 다음에 공백 추가
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            String response2 = "";
            while ((inputLine = br.readLine()) != null) {
                response2 += inputLine;
            }
            br.close();
            System.out.println(response2);
            String temp = response2.replace("{\"resultcode\":\"00\",\"message\":\"success\",\"response\":{","");
            temp = temp.replace("}}", "");
            temp = temp.replace("\"", "");
            System.out.println(temp);
            Member m = new Member();
            StringTokenizer sT = new StringTokenizer(temp, ",");
            String id = sT.nextToken().replace("id:", "");
            String gender = sT.nextToken().replace("gender:", "");
            String email = sT.nextToken().replace("email:", "");
            String name = decode(sT.nextToken().replace("name:", ""));
            String birth = sT.nextToken().replace("birthday:", "");
            String pw = "0000";
            request.setCharacterEncoding("UTF-8");
    		m.setUser_id(id);
    		m.setUser_name(name);
    		m.setUser_birth(birth);
    		m.setUser_gender(gender);
    		m.setUser_email(email);
    		
    		ServletContext context = getServletContext();
    		String fullPath = context.getRealPath("/WEB-INF/property/memberQuery.properties");
    	      System.out.println(fullPath);
    		Member m2= null;
    		int result = new MemberService().checkId(id, fullPath);
    		if(result==1)
    		{
    			m2 = new MemberService().memberLogin(id,pw, fullPath);
    			HttpSession session = request.getSession();
    			session.setAttribute("login", m2);
    			response.sendRedirect("/index.jsp");
    		}
    		else if(result==0)
    		{
    			int result2  = new MemberService().memberNaverJoin(m, fullPath);
    			if(result2==1)
    			{
    				m2 = new MemberService().memberLogin(id,pw, fullPath);
    				HttpSession session = request.getSession();
        			session.setAttribute("login", m2);
        			response.sendRedirect("/index.jsp");
    			}
    		}
        } catch (Exception e) {
            System.out.println(e);
        }
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public static String decode( String uni){
		StringBuffer str = new StringBuffer();
		for( int i= uni.indexOf("\\u") ; i > -1 ; i = uni.indexOf("\\u") ){// euc-kr(%u), utf-8(//u)
		str.append( uni.substring( 0, i ) );
		str.append( String.valueOf( (char)Integer.parseInt( uni.substring( i + 2, i + 6 ) ,16) ) );
		uni = uni.substring( i +6);
		}
		str.append( uni );
		return str.toString();
		}

}
