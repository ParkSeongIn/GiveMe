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
 * Servlet implementation class TalentBoardModifyActionServlet
 */
@WebServlet("/TalentBoardModifyActionServlet")
public class TalentBoardModifyActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TalentBoardModifyActionServlet() {
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
		
		String tbpeople = request.getParameter("tbpeople");
		String tbcategory1 = request.getParameter("tbcategory1");
		String tbcategory2 = request.getParameter("tbcategory2");
		String tbtitle = request.getParameter("tbtitle");
		int tbhdate = Integer.parseInt(request.getParameter("tbhdate"));
		String tbtime = request.getParameter("tbtime");
		int tbpeoplecnt = Integer.parseInt(request.getParameter("tbpeoplecnt"));
		String tbarea1 = request.getParameter("tbarea1");
		String tbarea2 = request.getParameter("tbarea2");
		String tbfile = request.getParameter("tbfile");
		String tbcontent = request.getParameter("tbcontent");
		int tbidx = Integer.parseInt(request.getParameter("tbidx"));
		
		TalentBoardServiceImpl tbsi = new TalentBoardServiceImpl();
		TalentBoardVo tvo = new TalentBoardVo();
		
		tvo.setTbpeople(tbpeople);
		tvo.setTbcategory1(tbcategory1);
		tvo.setTbcategory2(tbcategory2);
		tvo.setTbtitle(tbtitle);
		tvo.setTbhdate(tbhdate);
		tvo.setTbtime(tbtime);
		tvo.setTbpeoplecnt(tbpeoplecnt);
		tvo.setTbarea1(tbarea1);
		tvo.setTbarea2(tbarea2);
		tvo.setTbfile(tbfile);
		tvo.setTbcontent(tbcontent);
		tvo.setTbidx(tbidx);

		int tbu = tbsi.modifyTalentBoard(tvo, tbidx);
		
		
	}

}
