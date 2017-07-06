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
 * Servlet implementation class QusetionDeleteServlet
 */
@WebServlet("/QusetionDeleteServlet")
public class QuestionDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String qdeletest = request.getParameter("qdeletest");
		int qidx = Integer.parseInt(request.getParameter("qidx"));
		System.out.println(qidx);
		
		QuestionServiceImpl qd = new QuestionServiceImpl();
		
		QuestionVo qv = new QuestionVo();
		//qd.deleteQuestion(qidx);
	
			int row = qd.deleteQuestion(qidx);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
