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
 * Servlet implementation class TalentBoardConfirmServlet
 */
@WebServlet("/TalentBoardConfirmServlet")
public class TalentBoardConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TalentBoardConfirmServlet() {
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
		
		String tbhconfirm = request.getParameter("tbhconfirm");
		String tbstate = request.getParameter("tbstate");
		int tbidx = Integer.parseInt(request.getParameter("tbidx"));
		
		TalentBoardServiceImpl tbsi = new TalentBoardServiceImpl();
		TalentBoardVo tvo = new TalentBoardVo();
		
		int mtbc = tbsi.modifyTalentBoardConfirm(tbidx);
		
		System.out.println(tvo.getTbhconfirm());
		System.out.println(tvo.getTbstate());
		System.out.println(tvo.getTbidx());
		System.out.println(tbsi);
		System.out.println(tvo);
	}

}
