package controller.cashdonation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.cashdonation.CashDonationServiceImpl;
import service.cashdonation.CashDonationVo;
import service.member.MemberServiceImpl;
import service.member.MemberVo;

/**
 * Servlet implementation class CashDonationInsertServlet
 */
@WebServlet("/CashDonationInsertServlet")
public class CashDonationInsertActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CashDonationInsertActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String cway = request.getParameter("cway");
		int cmoney = Integer.parseInt(request.getParameter("cmoney"));
		String cpay = request.getParameter("cpay");
		String creceipt = request.getParameter("creceipt");		
		String cpaydate1 = request.getParameter("cpaydate1");
		int cpoint =  Integer.parseInt(request.getParameter("cpoint"));
		int midx = 0;
		
		HttpSession session = request.getSession();
		MemberVo vo = (MemberVo)session.getAttribute("vo");
		midx = vo.getMidx();
		
		CashDonationVo cv = new CashDonationVo();
		cv.setCway(cway);
		cv.setCmoney(cmoney);
		cv.setCpay(cpay);
		cv.setCreceipt(creceipt);
		cv.setCpaydate1(cpaydate1);
		cv.setMidx(midx);	
		cv.setCpoint(cpoint);
		CashDonationServiceImpl cdsi = new CashDonationServiceImpl();
		int row = cdsi.insertCashDonation(cv);

	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	    
	}

}
