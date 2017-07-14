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
		
		String tbtitle_s = request.getParameter("tbtitle");
		String tbtitle = "ㄴ"+tbtitle_s;
		String tbcontent = request.getParameter("tbcontent");
		int tbidx = Integer.parseInt(request.getParameter("tbidx"));
		int midx = Integer.parseInt(request.getParameter("midx"));
		
		System.out.println(tbtitle);
		System.out.println(tbcontent);
		System.out.println(tbidx);
		System.out.println(midx);
		
		TalentBoardServiceImpl tbsi = new TalentBoardServiceImpl();
		TalentBoardVo tvo = new TalentBoardVo();

			tvo.setTbtitle(tbtitle);
			tvo.setTbcontent(tbcontent);
			tvo.setTbidx(tbidx);
			tvo.setMidx(midx);
		
			System.out.println(tvo.getTbtitle());
			System.out.println(tvo.getTbcontent());
			System.out.println(tvo.getTbidx());
			System.out.println(tvo.getMidx());
			
			int rtb = tbsi.replyTalentBoard(tvo);
			System.out.println(rtb);
		
	}

}
