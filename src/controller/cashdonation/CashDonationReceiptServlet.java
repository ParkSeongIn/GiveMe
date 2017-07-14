package controller.cashdonation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.admin.AdminServiceImpl;
import service.cashdonation.CashDonationServiceImpl;
import service.cashdonation.CashDonationVo;
import service.member.MemberVo;

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
		
		int cidx = Integer.parseInt(request.getParameter("cidx"));
		
		int midx = 0;
		HttpSession session = request.getSession();
		MemberVo vo = (MemberVo)session.getAttribute("vo");
		midx = vo.getMidx();
		
		CashDonationVo cv = new CashDonationVo();
		
		CashDonationServiceImpl cd = new CashDonationServiceImpl();
		
		cv = cd.getReceipt(midx, cidx);	
		cv.setCidx(cidx);
		
		request.setAttribute("cidx", cidx);
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
