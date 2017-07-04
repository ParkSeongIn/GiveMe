package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.member.MemberServiceImpl;
import service.member.MemberVo;

/**
 * Servlet implementation class MemberChangePwdActServlet
 */
@WebServlet("/MemberChangePwdActServlet")
public class MemberChangePwdActServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberChangePwdActServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String mid = request.getParameter("mid");
    	String mpwd = request.getParameter("mpwd");	    		
    	MemberServiceImpl msi = new MemberServiceImpl();
    	
    	MemberVo vo = new MemberVo();
    	System.out.println(mid);
    	System.out.println(mpwd);
    	vo.setMid(mid);
		vo.setMpwd(mpwd);
    	
		int result = msi.passwordupdateMember(mid, mpwd);
	}
		

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
    	
	}
}
