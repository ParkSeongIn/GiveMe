package controller.cashdonation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.cashdonation.CashDonationServiceImpl;
import service.cashdonation.CashDonationVo;

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
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	    String cway = request.getParameter("cway");
	    int cmoney = Integer.parseInt(request.getParameter("cmoney"));   
	    String creceipt = request.getParameter("creceipt");
	    int cpaydate1 = Integer.parseInt(request.getParameter("cpaydate1"));
	    String cstate = request.getParameter("cstate");
	    int cpoint = Integer.parseInt(request.getParameter("cpoint")); 
	    int midx = Integer.parseInt(request.getParameter("midx"));
	    int dlidx = Integer.parseInt(request.getParameter("dlidx")); 
	    String cpay = request.getParameter("cpay");
	    String capst = request.getParameter("capst");
	    
//	    System.out.println(cway);
//	    System.out.println(cmoney);
//	    System.out.println(creceipt);
//	    System.out.println(cpaydate1);
//	    System.out.println(cstate);
//	    System.out.println(cpoint);
//	    System.out.println(midx);
//	    System.out.println(dlidx);
//	    System.out.println(cpay);
//	    System.out.println(capst);
	    
	    
	    CashDonationServiceImpl cd = new CashDonationServiceImpl();
	    
	    CashDonationVo cv = new CashDonationVo ();
	    cv.setCway(cway);
	    cv.setCmoney(cmoney);
	    cv.setCreceipt(creceipt);
	    cv.setCpaydate1(cpaydate1);
	    cv.setCstate(cstate);
	    cv.setCpoint(cpoint);
	    cv.setMidx(midx);
	    cv.setDlidx(dlidx);
	    cv.setCpay(cpay);
	    cv.setCapst(capst);
	    
	    int row = cd.insertCashDonation(cv); 
	    System.out.println(row);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
