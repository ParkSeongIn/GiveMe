package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Values;
import service.member.MemberServiceImpl;
import service.member.MemberVo;
import service.member.SessionInfo;

/**
 * Servlet implementation class MemberCheckLoginServlet
 */
@WebServlet("/MemberCheckLoginActionServlet")
public class MemberCheckLoginActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberCheckLoginActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @return 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());	    	
	   } 
	 
	  
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
    	
    	//뷰에서 입력해서 온 값.
    	  	
    	String mid = request.getParameter("mid");	    		
    	String mpwd = request.getParameter("mpwd");	    	    	
    	    	
    	MemberServiceImpl msi = new MemberServiceImpl();	 
    	MemberVo vo = new MemberVo();
    	
    	int result = msi.checkLogin(mid, mpwd);
    	
    	if(result == Values.login_success){
    		
    		vo = msi.getMember(mid);
    		
    		vo.setLogin(true);

        	HttpSession session = request.getSession();
    		session.setAttribute("vo", vo);
    		
    	
    	}else if(result==Values.login_fail_pw){	    	    	//비밀번호가 틀렸을 경우
		response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    out.println("<script>");
	    out.println("alert('비밀번호가 일치하지 않습니다.');");
	    out.println("location.href='/GiveMe/controller/MemberCheckLoginServlet.do';");
	    out.println("</script>");
	    out.close();
	    
	}else{		//아이디가 존재하지 않을 경우.
		response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    out.println("<script>");
	    out.println("alert('아이디가 존재하지 않습니다.');");
	    out.println("location.href='/GiveMe/controller/MemberCheckLoginServlet.do';");
	    out.println("</script>");
	    out.close();
	}
	}
	
}

    	
    	

