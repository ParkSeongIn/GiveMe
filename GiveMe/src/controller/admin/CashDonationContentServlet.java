package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MemberDao;
import Model.MemberVo;
import service.cashdonation.CashDonationServiceImpl;
import service.cashdonation.CashDonationVo;

/**
 * Servlet implementation class CashDonationContentServlet
 */
@WebServlet("/CashDonationContentServlet")
public class CashDonationContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CashDonationContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int cidx = Integer.parseInt(request.getParameter("cidx"));
		
		CashDonationServiceImpl cd = new CashDonationServiceImpl();
		CashDonationVo cv= cd.getCashDonation(cidx);	
		cv.setCidx(cidx);
		
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
