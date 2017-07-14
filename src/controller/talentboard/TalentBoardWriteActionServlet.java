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
@WebServlet("/TalentBoardWriteActionServlet")
public class TalentBoardWriteActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TalentBoardWriteActionServlet() {
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
		String tbcategory1 = request.getParameter("tbcategory1");
		String tbcategory2 = request.getParameter("tbcategory2");
		String tbpeople = request.getParameter("tbpeople");
		int tbhdate = Integer.parseInt(request.getParameter("tbhdate"));
		String tbtime = request.getParameter("tbtime");
		String tbarea1 = request.getParameter("tbarea1");
		String tbarea2 = request.getParameter("tbarea2");
		String tbcontent = request.getParameter("tbcontent");
		int midx = Integer.parseInt(request.getParameter("midx"));
		int tbpeoplecnt = Integer.parseInt(request.getParameter("tbpeoplecnt"));

		
		TalentBoardServiceImpl tbsi = new TalentBoardServiceImpl();
		TalentBoardVo tvo = new TalentBoardVo();

			tvo.setTbtitle(tbtitle);
			tvo.setTbcategory1(tbcategory1);
			tvo.setTbcategory2(tbcategory2);
			tvo.setTbpeople(tbpeople);
			tvo.setTbhdate(tbhdate);
			tvo.setTbtime(tbtime);
			tvo.setTbarea1(tbarea1);
			tvo.setTbarea2(tbarea2);
			tvo.setTbcontent(tbcontent);
			tvo.setMidx(midx);
			tvo.setTbpeoplecnt(tbpeoplecnt);
			
			System.out.println(tvo.getTbtitle());
			System.out.println(tvo.getTbcategory1());
			System.out.println(tvo.getTbcategory2());
			System.out.println(tvo.getTbpeople());
			System.out.println(tvo.getTbhdate());
			System.out.println(tvo.getTbtime());
			System.out.println(tvo.getTbarea1());
			System.out.println(tvo.getTbarea2());
			System.out.println(tvo.getTbcontent());
			System.out.println(tvo.getMidx());
			System.out.println(tvo.getTbpeoplecnt());
			
			
			int itb = tbsi.insertTalentBoard(tvo);
		
	}

}
