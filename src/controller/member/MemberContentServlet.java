package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.member.MemberServiceImpl;
import service.member.MemberVo;

/**
 * Servlet implementation class MemberContentServlet
 */
@WebServlet("/MemberContentServlet")
public class MemberContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberContentServlet() {
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
		
		String diff = null;
		if(request.getParameter("diff") != null){
			diff = request.getParameter("diff").trim();
		}
		
		String del = null;
		if(request.getParameter("del") != null){
			del = request.getParameter("del").trim();
		}
		
		HttpSession session = request.getSession();
		MemberVo vo = (MemberVo)session.getAttribute("vo");
		int midx=vo.getMidx();

		MemberServiceImpl msi = new MemberServiceImpl();
		
		vo = msi.getMember(midx);
		request.setAttribute("vo", vo);
	
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
