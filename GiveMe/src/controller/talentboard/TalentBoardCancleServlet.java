package controller.talentboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.talentboard.TalentBoardServiceImpl;
import service.talentboard.TalentBoardVo;

/**
 * Servlet implementation class TalentBoardCancleServlet
 */
@WebServlet("/TalentBoardCancleServlet")
public class TalentBoardCancleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TalentBoardCancleServlet() {
        super();
        // TODO Autoa-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");
		String tbstate = request.getParameter("tbstate");
		String tbapply = request.getParameter("tbapply");
		String tbcancle = request.getParameter("tbcancle");
		int midx = Integer.parseInt(request.getParameter("midx"));

		TalentBoardServiceImpl tbsi = new TalentBoardServiceImpl();
		TalentBoardVo tvo = new TalentBoardVo();
		
		System.out.println(tvo.getTbcancle());
		System.out.println(tvo.getTbstate());
		System.out.println(tvo.getTbapply());
		System.out.println(tbsi);
		System.out.println(tvo);
		int mcan = tbsi.modifyTalentBoardCancle(midx);
		
	}

}
