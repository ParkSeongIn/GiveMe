package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.admin.AdminServiceImpl;
import service.admin.DonationListVo;
import service.member.MemberVo;

import java.util.ArrayList;

/**
 * Servlet implementation class DonationListServlet
 */
@WebServlet("/DonationListServlet")
public class DonationListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DonationListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		MemberVo vo = (MemberVo)session.getAttribute("vo");
		int midx = 0;
		if(vo != null){
			midx = vo.getMidx();
		}
		AdminServiceImpl as = new AdminServiceImpl();
		
		ArrayList<DonationListVo> list = as.getDonationListLine(midx);
		request.setAttribute("list", list);
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
