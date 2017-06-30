package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.member.MemberServiceImpl;
import service.member.MemberVo;
import service.member.SessionInfo;

/**
 * Servlet implementation class MemberCheckLoginServlet
 */
@WebServlet("/MemberCheckLoginServlet")
public class MemberCheckLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberCheckLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @return 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());	    	
	    	request.setCharacterEncoding("UTF-8");
	    	
	    	//뷰에서 입력해서 온 값.
	    	  	
	    	String mid = request.getParameter("mid");	    		
	    	String mpwd = request.getParameter("mpwd");	    	    	
	    	    	
	    	MemberServiceImpl msi = new MemberServiceImpl();	    		    		
	    	MemberVo vo = new MemberVo();
	    	
	    	int result = 0;
	    	
	    	vo.setMid(request.getParameter("mid"));	    		
	    	vo.setMpwd(request.getParameter("mpwd"));
	    	
	    	result = msi.checkLogin(vo);
	    	
	    		
	    	if(result==0){	    	    	//비밀번호가 틀렸을 경우
	    	    PrintWriter out = response.getWriter();
	    	    response.setContentType("text/html;charset=UTF-8");
	    	    out.println("<script>");
	    	    out.println("alert('비밀번호가 일치하지 않습니다.');");
	    	    out.println("location.href='"+request.getContextPath()+"/member/login.jsp';");
	    	    out.println("</script>");
	    	    out.close();
	    	    
	    	}else if(result==-1){		//아이디가 존재하지 않을 경우.
	    	    PrintWriter out = response.getWriter();
	    	    request.setCharacterEncoding("UTF-8");
	    	    out.println("<script>");
	    	    out.println("alert('아이디가 존재하지 않습니다.');");
	    	    out.println("location.href='"+request.getContextPath()+"/member/login.jsp';");
	    	    out.println("</script>");
	    	    out.close();
	    	    
	    	}
	    	
	    	HttpSession session = request.getSession();
	    	session.setAttribute("mid", vo.getMid());
	    	
	    	
	    	
	    	//String msg = "";
	    	
	    	//if(check==0){
	    	//   request.setAttribute("fail", "0");
	    	//    msg="login.jsp";
	    		   
	    	//}else if(check==-1){
	    	  //  request.setAttribute("fail", "-1");
	    	    //msg="login.jsp";
	    	    
	    	//}else{
	    	 //   session.setAttribute("sessionID", mid);
	    	    
	    	   // msg="WebContent/main/main.jsp";
	    	//}	    	
	    	
	    	//response.sendRedirect(msg);  	
	    	
	    
	} 
	 
	  
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
