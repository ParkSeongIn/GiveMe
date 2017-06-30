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
 * Servlet implementation class MemberFindidServlet
 */
@WebServlet("/MemberFindidServlet")
public class MemberFindidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindidServlet() {
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
	    	response.setContentType("text/html; charset=utf-8");	    		    	
	    	//뷰에서 입력한 값을 가지고 오는 것.
	    	String mname = request.getParameter("mname");
	    	String mphone = request.getParameter("mphone");	
	    		System.out.println(mname+mphone);
	    		
	    	
	    	MemberServiceImpl msi = new MemberServiceImpl();
	    	MemberVo vo = new MemberVo();
	    	
	    	int result = 0;	    
	    	
	    	
	    	vo.setMname(request.getParameter("mname"));
	    	vo.setMphone(Integer.parseInt(request.getParameter("mphone"), 10));
	    	
	    	result = msi.findMid(vo);
	    		
	    	if(result==1){
	    	    PrintWriter out = response.getWriter();
	    	    out.println("<script>");
	    	    out.println("alert('아이디 " + vo.getMid() + " ');");
	    	    out.println("</script>");
	    	    out.close();
	    	}else if(result==0){
	    	    PrintWriter out = response.getWriter();
	    	    out.println("<script>");
	    	    out.println("alert('Unname and Unphone.');");
	    	    out.println("location.href='"+request.getContextPath()+"/member/find_id.jsp';");
	    	    out.println("</script>");
	    	    out.close();
	    	}else{
	    	    PrintWriter out = response.getWriter();
	    	    out.println("<script>");
	    	    out.println("alert('NOT Mid.');");
	    	    out.println("location.href='"+request.getContextPath()+"/member/find_id.jsp';");
	    	    out.println("</script>");
	    	    out.close();
	    	    
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
