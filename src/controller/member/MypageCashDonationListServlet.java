package controller.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.cashdonation.CashDonationServiceImpl;
import service.cashdonation.CashDonationVo;
import service.member.MemberVo;

/**
 * Servlet implementation class MypageCashDonationListServlet
 */
@WebServlet("/MypageCashDonationListServlet")
public class MypageCashDonationListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageCashDonationListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int midx = 0;
		HttpSession session = request.getSession();
		MemberVo vo = (MemberVo)session.getAttribute("vo");
		midx = vo.getMidx();		
		
		
		CashDonationServiceImpl cd = new CashDonationServiceImpl();
		ArrayList<CashDonationVo> clist = cd.getMypageCashDonationList(midx);
		request.setAttribute("clist", clist);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
