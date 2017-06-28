package controller.cashdonation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.admin.AdminServiceImpl;
import service.cashdonation.CashDonationConVo;
import service.cashdonation.CashDonationServiceImpl;

/**
 * Servlet implementation class CashDonationReceiptServlet
 */
@WebServlet("/CashDonationReceiptServlet")
public class CashDonationReceiptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CashDonationReceiptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		int midx = Integer.parseInt(request.getParameter("midx"));
		//System.out.println(cidx);
		CashDonationServiceImpl cd = new CashDonationServiceImpl();
		CashDonationConVo rcv = new CashDonationConVo();
		rcv = cd.getReceipt(midx);	
		rcv.setMidx(midx);
		
		request.setAttribute("rcv", rcv);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
