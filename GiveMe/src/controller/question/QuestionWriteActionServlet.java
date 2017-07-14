package controller.question;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.question.QuestionServiceImpl;
import service.question.QuestionVo;

/**
 * Servlet implementation class QuestionWriteActionServlet
 */
@WebServlet("/QuestionWriteActionServlet")
public class QuestionWriteActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionWriteActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		String qcategory = request.getParameter("qcategory");
		String qtitle = request.getParameter("qtitle");
		String qcontent = request.getParameter("qcontent");
	//	int midx = Integer.parseInt(request.getParameter("midx"));
		String qrecontent = request.getParameter("qrecontent");
		
		QuestionVo qv = new QuestionVo();
		qv.setQcategory(qcategory);
		qv.setQtitle(qtitle);
		qv.setQcontent(qcontent);
	//	qv.setMidx(midx);
		qv.setQrecontent(qrecontent);
		
		QuestionServiceImpl qd = new QuestionServiceImpl();
		
		int row = qd.insertQuestion(qv);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
