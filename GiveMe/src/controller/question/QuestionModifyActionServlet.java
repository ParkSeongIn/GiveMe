package controller.question;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.member.MemberVo;
import service.question.QuestionServiceImpl;
import service.question.QuestionVo;

/**
 * Servlet implementation class QuestionModifyActionServlet
 */
@WebServlet("/QuestionModifyActionServlet")
public class QuestionModifyActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionModifyActionServlet() {
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
//		doGet(request, response);
	
		int qidx = Integer.parseInt(request.getParameter("qidx"));
		String qtitle = request.getParameter("qtitle");
		int midx = Integer.parseInt(request.getParameter("midx"));
		String qcategory = request.getParameter("qcategory");
		String qcontent = request.getParameter("qcontent");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("vo") != null ) {
			MemberVo vo = (MemberVo) session.getAttribute("vo");
			midx = vo.getMidx();
		}
		
		QuestionServiceImpl qd = new QuestionServiceImpl();
		
		QuestionVo qv = new QuestionVo();
		qv.setQidx(qidx);
		qv.setQtitle(qtitle);
		qv.setMidx(midx);
		qv.setQcategory(qcategory);
		qv.setQcontent(qcontent);
		
		int row = qd.modifyWriteQuestion(qv);
	}

}
