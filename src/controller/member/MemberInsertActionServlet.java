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
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/MemberInsertActionServlet")
public class MemberInsertActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	    request.setCharacterEncoding("UTF-8");      //이하 join.jsp에서 입력된 값을 담는 그릇.
	    String mid = request.getParameter("mid");	//getParameter("")에서 ""안에는 join.jsp에서 각 name 값과 동일하게 입력.
	    String mpwd = request.getParameter("mpwd");
	    String mname = request.getParameter("mname");
	    String mbirth = request.getParameter("mbirth");	   	    
	    String mphone = request.getParameter("mphone");
	    String mphone1 = request.getParameter("mphone1");
	    String mphone2 = request.getParameter("mphone2");	    
	    String mmail1 = request.getParameter("mmail1");
	    String mmail2 = request.getParameter("mmail2");
	    String mpost1 = request.getParameter("mpost1");
	    String mpost2 = request.getParameter("mpost2");
	    String maddr1 = request.getParameter("maddr1");
	    String maddr2 = request.getParameter("maddr2");
	    String mgrade = request.getParameter("mgrade");
	    String mvalue = request.getParameter("mvalue");	
		    
		    
	    MemberServiceImpl ms= new MemberServiceImpl();	//insert구문이 있는 DAO를 생성.
	    MemberVo vo = new MemberVo();			//insert구문에서 메소드에 담긴 매개변수 ?
	    
	  	vo.setMid(mid);	    	
	    vo.setMpwd(mpwd);	    	
	    vo.setMname(mname);	    	
	    vo.setMbirth(Integer.parseInt((mbirth), 10));	//숫자형(int)으로 변환하는 작업. 10은 10진법을 의미함.	    	
	    vo.setMphone(Integer.parseInt((mphone)+(mphone1)+(mphone),10));
	    vo.setMmail(mmail1+"@"+mmail2);
	    vo.setMpost(Integer.parseInt((mpost1)+(mpost2), 10));
	    vo.setMaddr1(maddr1);
	    vo.setMaddr2(maddr2);
	    vo.setMgrade(mgrade);
	    vo.setMvalue(mvalue);
	    
	    int row = ms.insertMember(vo);	//DAO에 있는 insert메소드에 매개변수를 담아 row로 보내는 것(반환)?
	}

}