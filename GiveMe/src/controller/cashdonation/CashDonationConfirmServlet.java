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
 * Servlet implementation class CashDonationConfirmServlet
 */
@WebServlet("/CashDonationConfirmServlet")
public class CashDonationConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CashDonationConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int cidx = Integer.parseInt(request.getParameter("cidx"));
		System.out.println(cidx);
		
		CashDonationServiceImpl cd = new CashDonationServiceImpl();
		CashDonationVo cv = new CashDonationVo();
		
		cv = cd.getCashDonationConfirm(cidx);
		
		request.setAttribute("cv", cv);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
