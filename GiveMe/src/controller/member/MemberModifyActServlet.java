package controller.member;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.member.MemberServiceImpl;
import service.member.MemberVo;

/**
 * Servlet implementation class MemberModifyActServlet
 */
@WebServlet("/MemberModifyActServlet")
public class MemberModifyActServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberModifyActServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	    
	    	request.setCharacterEncoding("UTF-8");	    	  
	    	response.setCharacterEncoding("UTF-8");
	    	int midx = Integer.parseInt(request.getParameter("midx"), 10);	    		
	    	String mgrade = request.getParameter("mgrade");	
		String mpwd = request.getParameter("mpwd");
		String mphone = request.getParameter("mphone");
		String mphone1 = request.getParameter("mphone1");
		String mphone2 = request.getParameter("mphone2");
		String mmail1 = request.getParameter("mmail1");
		String mmail2 = request.getParameter("mmail2");
		String mpost = request.getParameter("mpost");
		String maddr1 = request.getParameter("maddr1");
		String maddr2 = request.getParameter("maddr2");		
		
		MemberServiceImpl msi = new MemberServiceImpl();
		MemberVo vo = new MemberVo();
				
		vo.setMgrade(mgrade);			
		vo.setMpwd(mpwd);		
		vo.setMphone(Integer.parseInt((mphone+mphone1+mphone2),10));			
		vo.setMmail(mmail1+mmail2);
		vo.setMpost(Integer.parseInt(mpost));
		vo.setMaddr1(maddr1);
		vo.setMaddr2(maddr2);		
		vo.setMidx(midx);
		
		int row = msi.modifyupdateMember(vo);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
