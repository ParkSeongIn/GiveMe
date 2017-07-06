package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.admin.AdminServiceImpl;
import service.allboard.AllBoardVo;

/**
 * Servlet implementation class AllBoardIfWriteActionServlet
 */
@WebServlet("/AllBoardIfWriteActionServlet")
public class AllBoardIfWriteActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllBoardIfWriteActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");
		
		String abtype = request.getParameter("abtype");
		String abtitle = request.getParameter("abtitle");
		String abcontent = request.getParameter("abcontent");
		int midx = Integer.parseInt(request.getParameter("midx"));
		
		AdminServiceImpl ads = new AdminServiceImpl();
		AllBoardVo avo = new AllBoardVo();
		
		avo.setAbtype(abtype);
		avo.setAbtitle(abtitle);
		avo.setAbcontent(abcontent);
		avo.setMidx(midx);
		
		int iab = ads.insertAllBoard(avo);
		
		
	}

}
