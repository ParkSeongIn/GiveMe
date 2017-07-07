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
 * Servlet implementation class QuestionContentServlet
 */
@WebServlet("/QuestionContentServlet")
public class QuestionContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int qidx = Integer.parseInt(request.getParameter("qidx"));
		int midx = Integer.parseInt(request.getParameter("midx"));
		//System.out.println(qidx);
		QuestionServiceImpl qd = new QuestionServiceImpl();
		QuestionVo qv = qd.getQuestion(qidx, midx);
		//System.out.println(qv);
		request.setAttribute("qv", qv);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
