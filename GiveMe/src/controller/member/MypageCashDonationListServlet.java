package controller.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.cashdonation.CashDonationListVo;
import service.cashdonation.CashDonationServiceImpl;

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
	
//		int midx = Integer.parseInt(request.getParameter("midx"));
		int midx = 4;
		CashDonationServiceImpl cd = new CashDonationServiceImpl();
		ArrayList<CashDonationListVo> mcdlist = cd.getMypageCashDonationList(midx);
		System.out.println(mcdlist);
		request.setAttribute("mcdlist", mcdlist);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
