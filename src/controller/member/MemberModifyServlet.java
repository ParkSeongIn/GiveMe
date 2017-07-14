package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Values;
import service.member.MemberServiceImpl;
import service.member.MemberVo;



/**
 * Servlet implementation class MemberModifyServlet
 */
@WebServlet("/MemberModifyServlet")
public class MemberModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int rows;
       
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
	    
	//    int midx = Integer.parseInt(request.getParameter("midx"), 10);
		int midx = 0;
		HttpSession session = request.getSession();
		if(session.getAttribute("vo") != null){
			MemberVo vo = (MemberVo) session.getAttribute("vo");
			midx = vo.getMidx();
		}
		
		String mpwd = null;
		if(request.getParameter("mpwd") != null){
			mpwd = request.getParameter("mpwd").trim();
		}
		System.out.println(midx);
		System.out.println(mpwd);

		MemberVo vo = new MemberVo();
		vo.setMidx(midx);
		vo.setMpwd(mpwd);
		
		int row = 0;
		
		MemberServiceImpl msi = new MemberServiceImpl();
	    vo = msi.modifyMember(midx);
	    
	    //비밀번호를 빼고 다 회원정보를 담음
	    request.setAttribute("vo", vo);
	    request.setAttribute("midx", midx);
	    
		row = msi.MemberConModChk(midx,mpwd);
		
		System.out.println(row);		
		retn(row);
	}

	
	private void retn(int row) {
		// TODO Auto-generated method stub
		this.rows = row;
	}
	public int retn() {
		// TODO Auto-generated method stub
		return rows;
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		

		
		
		
		
			
	}

}
