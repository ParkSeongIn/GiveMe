package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.admin.AdminServiceImpl;
import service.admin.CashDonationConVo;

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
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int cidx = Integer.parseInt(request.getParameter("cidx"),10);
		System.out.println(cidx);
		AdminServiceImpl ad = new AdminServiceImpl();
		CashDonationConVo gcv = new CashDonationConVo();
		gcv = ad.getCashDonation(cidx);	
		gcv.setCidx(cidx);
		
		request.setAttribute("gcv", gcv);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
