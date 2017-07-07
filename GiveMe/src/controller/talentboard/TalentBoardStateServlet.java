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
 * Servlet implementation class TalentBoardStateServlet
 */
@WebServlet("/TalentBoardStateServlet")
public class TalentBoardStateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TalentBoardStateServlet() {
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
		String tbstate = request.getParameter("tbstate");
		String tbapply = request.getParameter("tbapply");
		int midx = Integer.parseInt(request.getParameter("midx"));
		
		TalentBoardServiceImpl tbsi = new TalentBoardServiceImpl();
		TalentBoardVo tvo = new TalentBoardVo();
		
		int mtbs = tbsi.modifyTalentBoardState(midx);
		System.out.println(tvo.getTbstate());
		System.out.println(tvo.getTbapply());
		System.out.println(tvo.getMidx());
		System.out.println(tbsi);
		System.out.println(tvo);
	}

}
