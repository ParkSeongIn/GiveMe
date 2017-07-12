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
 * Servlet implementation class TalentBoardWriteActionServlet
 */
@WebServlet("/TalentBoardReplyActionServlet")
public class TalentBoardReplyActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TalentBoardReplyActionServlet() {
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
		
		request.setCharacterEncoding("UTF-8");
		
		String tbtitle = request.getParameter("tbtitle");
		String mid = request.getParameter("mid");
		String tbcategory1 = request.getParameter("tbcategory1");
		String tbcategory2 = request.getParameter("tbcategory2");
		String tbpeople = request.getParameter("tbpeople");
		int tbhdate = Integer.parseInt(request.getParameter("tbhdate"));
		String tbtime = request.getParameter("tbtime");
		String tbarea1 = request.getParameter("tbarea1");
		String tbarea2 = request.getParameter("tbarea2");
		String tbcontent = request.getParameter("tbcontent");
		int tbidx = Integer.parseInt(request.getParameter("tbidx"));
		int midx = Integer.parseInt(request.getParameter("midx"));
		int tbpeoplecnt = Integer.parseInt(request.getParameter("tbpeoplecnt"));

		
		TalentBoardServiceImpl tbsi = new TalentBoardServiceImpl();
		TalentBoardVo tvo = new TalentBoardVo();

			tvo.setTbtitle(tbtitle);
			tvo.setMid(mid);
			tvo.setTbcategory1(tbcategory1);
			tvo.setTbcategory2(tbcategory2);
			tvo.setTbpeople(tbpeople);
			tvo.setTbhdate(tbhdate);
			tvo.setTbtime(tbtime);
			tvo.setTbarea1(tbarea1);
			tvo.setTbarea2(tbarea2);
			tvo.setTbcontent(tbcontent);
			tvo.setTbidx(tbidx);
			tvo.setMidx(midx);
			tvo.setTbpeoplecnt(tbpeoplecnt);	
			
			int rtb = tbsi.replyTalentBoard(tvo);
		
	}

}
