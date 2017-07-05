package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.admin.AdminServiceImpl;

/**
 * Servlet implementation class DonationDeleteServlet
 */
@WebServlet("/DonationDeleteServlet")
public class DonationDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DonationDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int dlidx = Integer.parseInt(request.getParameter("dlidx"));
		AdminServiceImpl as = new AdminServiceImpl();
		
		int row = as.deleteDonationList(dlidx);
		
		String alt = null;
		
		if (row == 0) {
			 alt ="삭제실패";		
			}else{
			 alt ="삭제성공";	
			}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<script> self.window.alert('"+alt+"'); location.href='DonationListServlet.do';</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
