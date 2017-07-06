package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.member.MemberServiceImpl;
import service.member.MemberVo;

/**
 * Servlet implementation class MemberCheckidServlet
 */
@WebServlet("/MemberCheckidActionServlet")
public class MemberCheckidActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

       

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberCheckidActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	    
	    request.setCharacterEncoding("UTF-8");
	    String mid = request.getParameter("mid");
	    
	    MemberServiceImpl msi = new MemberServiceImpl();
	    
	    boolean result = msi.checkId(mid);
	    
	    response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
	    if(result){
		out.println("0");
	    }else{
		out.println("1");		
	    }
	    out.close();
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
