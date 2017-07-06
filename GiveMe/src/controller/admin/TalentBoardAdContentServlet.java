package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.talentboard.TalentBoardServiceImpl;
import service.talentboard.TalentBoardVo;

/**
 * Servlet implementation class TalentBoardAdContentServlet
 */
@WebServlet("/TalentBoardAdContentServlet")
public class TalentBoardAdContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TalentBoardAdContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		int tbidx = Integer.parseInt(request.getParameter("tbidx"));
		TalentBoardServiceImpl tbsi = new TalentBoardServiceImpl();
		TalentBoardVo tvo = tbsi.getTalentBoard(tbidx);
							
		request.setAttribute("tvo", tvo);
		request.setAttribute("tbidx", tbidx);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
