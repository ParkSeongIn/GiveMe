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
 * Servlet implementation class QusetionModifyServlet
 */
@WebServlet("/QusetionModifyServlet")
public class QuestionModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int qidx = Integer.parseInt(request.getParameter("qidx"));
		int midx = Integer.parseInt(request.getParameter("midx"));
		System.out.println(qidx);
		QuestionServiceImpl qd = new QuestionServiceImpl();
		QuestionVo qv = qd.getQuestion(qidx, midx);
		
		request.setAttribute("qv", qv);
	//  다인아 qv에  qidx와 midx가 모두 담기기 때문에 qv만 담아서 보내면 된다	
	//	request.setAttribute("qidx", qidx);
	//	request.setAttribute("midx", midx);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
