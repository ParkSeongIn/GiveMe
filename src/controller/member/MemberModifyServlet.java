package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Values;
import service.member.MemberServiceImpl;
import service.member.MemberVo;



/**
 * Servlet implementation class MemberModifyServlet
 */
@WebServlet("/MemberModifyServlet")
public class MemberModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	    
	    int midx = Integer.parseInt(request.getParameter("midx"), 10);
	    MemberServiceImpl msi = new MemberServiceImpl();
	    MemberVo vo = msi.modifyMember(midx);
	    
	    request.setAttribute("vo", vo);
	    request.setAttribute("midx", midx);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		

		
		
		
		
			
	}

}
